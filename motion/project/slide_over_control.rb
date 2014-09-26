class SlideOverControl < UIControl
  attr_accessor :slide_bar_bottom_margin, :slide_bar_top_margin, :slide_bar_height,
    :open_slide_bar_center, :auto_close
  attr_reader :top_view, :main_view, :slide_bar_center, :slide_bar

  def rmq_build
    q = rmq(self)
    q.apply_style :slide_over_control_content

    @slide_bar_height = 30
    @slide_bar_bottom_margin = 80
    @slide_bar_top_margin = 94
    slide_bar_center = 200

    @auto_close = true

    #@top_view_container = q.append(UIView, :slide_over_control_top_view_container).get
    #@main_view_container = q.append(UIView, :slide_over_control_main_view_container).get

    @slide_bar = q.append(UIView, :slide_over_control_slide_bar).get
    @slide_bar_drag = q.append(UIView, :slide_over_control_slide_bar_drag).get
    slide_bar_events
  end

  def slide_bar_events
    #rmq(@slide_bar).on(:swipe_down) do |sender, rmq_event|
      #puts "swipe down #{rmq_event.location.inspect}"
    #end.on(:swipe_up) do |sender, rmq_event|
      #puts "swipe up #{rmq_event.location.inspect}"
    #end
    #
    rmq(@slide_bar_drag).on(:pan) do |sender, rmq_event|
      r = rmq_event.recognizer
      y = rmq_event.location_in(self).y

      self_height = self.bounds.size.height
      bottom_margin = self_height - y

      #puts "pan, y = #{y}, bottom_margin = #{bottom_margin}"
      y = (self_height - @slide_bar_bottom_margin) if bottom_margin < @slide_bar_bottom_margin

      y = @slide_bar_top_margin if y < @slide_bar_top_margin

      #puts "pan, y = #{y}"

      @slide_bar_center = y

      if r.state == UIGestureRecognizerStateEnded
        puts 'ended'
        @moving = false
        if @auto_close && (bottom_margin < @slide_bar_bottom_margin)
          self.close
        else
          self.setNeedsLayout
        end
      else
        @moving = true
        self.setNeedsLayout

        #UIView.animateWithDuration(
          #0.1,
          #delay: 0.0,
          #usingSpringWithDamping: 0.5,
          #initialSpringVelocity: 1.0,
          #options: UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState,
          #animations: ->{
            #layout
          #}, completion: ->(did_finish){
            #puts 'finish moving'
          #})
      end

      #self.setNeedsLayout
    end
  end

  def slide_bar_center=(value)
    @slide_bar_center = value
    @open_slide_bar_center = value
  end

  def main_view=(value)
    rmq(@main_view).remove if @main_view
    @main_view = value

    #rmq(@main_view_container).append(value, :slide_over_control_main_view)
    rmq(self).prepend(value, :slide_over_control_main_view)
    #self.setNeedsLayout
  end

  def top_view=(value)
    rmq(@top_view).remove if @top_view
    @top_view = value

    rmq(self).insert(value, style: :slide_over_control_top_view, above_view: @main_view)
    #rmq(@top_view_container).append(value, :slide_over_control_top_view)
    #self.setNeedsLayout
  end

  def layoutSubviews
    #rmq.animate(duration: 0.1, options: UIViewAnimationOptionBeginFromCurrentState) do
      layout
    #end
  end

  def layout
    half_bar_height = (@slide_bar_height / 2)

    rmq(@main_view).layout(:full)
    rmq(@top_view).layout(l: 0, fr: 0, t: @slide_bar_center + half_bar_height, fb: 0)

    rmq(@slide_bar).layout(l: 0, fr: 0, h: @slide_bar_height, t: @slide_bar_center - half_bar_height )
    @slide_bar_drag.frame = @slide_bar.frame unless @moving
  end

  def open
    return if @is_open

    show_top_view

#[UIView animateWithDuration: 2.0f delay: 0.0f usingSpringWithDamping: 0.5f initialSpringVelocity: 1.0f
  #options:UIViewAnimationOptionAllowAnimatedContent animations:
#{
    #myView.frame = CGRectMake(20, 20, myView.frame.size.width, myView.frame.size.height);
#}completion:nil];

    @is_open = true


#animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:

    UIView.animateWithDuration(
      0.4,
      delay: 0.0,
      usingSpringWithDamping: 0.5,
      initialSpringVelocity: 1.0,
      options: UIViewAnimationOptionCurveEaseOut,
      animations: ->{
        @slide_bar_center = @open_slide_bar_center
        layout
      }, completion: ->(did_finish){
        puts 'finished open'
      })

    #rmq.animate(
      #duration: 0.4,
      #options: UIViewAnimationOptionCurveEaseOut,
      #singSpringWithDamping: 0.5,
      #initialSpringVelocity: 1.0,
      #animations: ->(q){
        #@slide_bar_center = @open_slide_bar_center
        #layout
      #}, after: ->(did_finish, last_completion_rmq){
        #puts 'finished open'
      #})
  end

  def hide_top_view
    rmq(@slide_bar, @top_view).hide
  end

  def show_top_view
    rmq(@slide_bar, @top_view).show
  end

  def close
    return if !@is_open || @is_closing

    @is_open = false
    @is_closing = true

    rmq.animate(
      duration: 0.3,
      options: UIViewAnimationOptionCurveEaseIn,
      animations: ->(q){
        @slide_bar_center = self.bounds.size.height + (@slide_bar_height / 2)
        layout
      }, after: ->(did_finish, last_completion_rmq){
        puts 'finished close'
        @is_closing = false
        hide_top_view if did_finish
      })
  end
end
