class SlideOverControl < UIControl

  attr_accessor :slide_bar_height,
                :slide_bar_top_margin,
                :slide_bar_top_snap_back_to,
                :slide_bar_bottom_margin,
                :slide_bar_bottom_snap_back_to,
                :slide_bar_center_when_opening,
                :auto_close

  attr_reader   :top_view,
                :main_view,
                :slide_bar,
                :slide_bar_center

  def open?
    @is_open
  end

  def rmq_styler
    RubyMotionQuery::Stylers::SlideOverControlStyler.new(self)
  end

  def rmq_build
    q = rmq(self)
    @is_open = true
    @slide_bar = q.append(UIView).get
    @slide_bar_drag = q.append(UIView).get
    set_defaults
    slide_bar_events
  end

  def rmq_style_applied
    layout
  end

  def set_defaults
    @slide_bar_height = 30

    @slide_bar_top_margin = 74
    @slide_bar_bottom_margin = 0

    @slide_bar_top_snap_back_to = 94
    @slide_bar_bottom_snap_back_to = 80
    @slide_bar_center = 200

    self.slide_bar_background_color = rmq.color.dark_gray

    rmq(self, @slide_bar_drag).style do |st|
      st.background_color = rmq.color.clear
      st.clips_to_bounds = true
    end

    @auto_close = true
  end

  def slide_bar_events
    rmq(@slide_bar_drag).on(:pan) do |sender, rmq_event|
      r = rmq_event.recognizer
      y = rmq_event.location_in(self).y

      self_height = self.bounds.size.height
      bottom_margin = self_height - y

      adjusted_slide_bar_bottom_margin = @slide_bar_bottom_margin + (@slide_bar_height / 2)

      y = (self_height - adjusted_slide_bar_bottom_margin) if bottom_margin < adjusted_slide_bar_bottom_margin

      y = @slide_bar_top_margin if y < @slide_bar_top_margin

      @slide_bar_center = y

      if r.state == UIGestureRecognizerStateEnded
        @moving = false
        if @auto_close && (bottom_margin < @slide_bar_bottom_snap_back_to)
          self.close
        else
          if y < @slide_bar_top_snap_back_to
            bounce_to @slide_bar_top_snap_back_to
          elsif bottom_margin < @slide_bar_bottom_snap_back_to
            bounce_to self_height - @slide_bar_bottom_snap_back_to
          end
          self.setNeedsLayout
        end
      else
        @moving = true
        self.setNeedsLayout
      end
    end
  end

  def slide_bar_background_color=(value)
    @slide_bar_background_color = value

    rmq(@slide_bar).style do |st|
      st.background_color = value
    end
  end

  def slide_bar_center=(value)
    @slide_bar_center = value
    @slide_bar_center_when_opening = value
  end

  def main_view=(value)
    rmq(@main_view).remove if @main_view
    @main_view = value

    rmq(self).prepend(value)
  end

  def top_view=(value)
    rmq(@top_view).remove if @top_view
    @top_view = value

    rmq(self).insert(value, above_view: @main_view)
  end

  def layoutSubviews
    layout
  end

  def layout
    half_bar_height = (@slide_bar_height / 2)

    rmq(@main_view).layout(:full)
    rmq(@top_view).layout(l: 0, fr: 0, t: @slide_bar_center + half_bar_height, fb: 0)

    rmq(@slide_bar).layout(l: 0, fr: 0, h: @slide_bar_height, t: @slide_bar_center - half_bar_height )
    @slide_bar_drag.frame = @slide_bar.frame unless @moving
  end

  def bounce_to(new_y, params = {})
    # TODO, add usingSprintWithDamping and initialSpringVelocity to RMQ, then use RMQ's animate here

    after = params[:after]

    UIView.animateWithDuration(
      0.4,
      delay: 0.0,
      usingSpringWithDamping: 0.6,
      initialSpringVelocity: 0.5,
      options: UIViewAnimationOptionCurveEaseOut,
      animations: ->{
        @slide_bar_center = new_y
        layout
      }, completion: ->(did_finish){
        after.call if after && did_finish
      })
  end


  def hide_top_view
    rmq(@slide_bar, @top_view).hide
  end

  def show_top_view
    rmq(@slide_bar, @top_view).show
  end

  def open(params = {})
    return if @is_open

    @is_open = true
    animate = params[:animate] != false

    if animate
      show_top_view
      bounce_to @slide_bar_center_when_opening, params
    else
      @slide_bar_center = @slide_bar_center_when_opening
      show_top_view
      layout
    end
  end

  def close(params = {})
    return if !@is_open || @is_closing

    @is_open = false
    @is_closing = true

    animate = params[:animate] != false
    after = params[:after]

    if animate
      rmq.animate(
        duration: 0.3,
        options: UIViewAnimationOptionCurveEaseIn,
        animations: ->(q){
          @slide_bar_center = self.bounds.size.height + (@slide_bar_height / 2)
          layout
        }, after: ->(did_finish, last_completion_rmq){
          @is_closing = false
          hide_top_view if did_finish
          after.call if after && did_finish
        })
    else
      hide_top_view
      @slide_bar_center = self.bounds.size.height + (@slide_bar_height / 2)
      layout
      @is_closing = false
    end
  end
end
