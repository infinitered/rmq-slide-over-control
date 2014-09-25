class SlideOverControl < UIControl
  attr_accessor :top_view, :bottom_view, :upper_snap_y, :lower_snap_y

  def rmq_build
    q = rmq(self)
    q.apply_style :draggable_split

    @split_location = 200

    @top_view_container = q.append(UIView, :top_view_container).get
    @bottom_view_container = q.append(UIView, :bottom_view_container).get

    @slide_bar = q.append(UIView, :slide_bar).get
    @slide_bar_drag = q.append(UIView, :slide_bar_drag).get
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
      puts "pan #{rmq_event.location.inspect}"

      r = rmq_event.recognizer
      @split_location = rmq_event.location_in(self).y

      if r.state == UIGestureRecognizerStateEnded
        puts 'ended'
        @moving = false
      else
        @moving = true
        #r.setTranslation CGPointMake(0, 0), inView: self
      end

      self.setNeedsLayout
    end
  end

  def top_view=(value)
    rmq(@top_view_containeu).append(value, :top_view)
  end

  def bottom_view=(value)
    rmq(@bottom_view_container).append(value, :bottom_view)
  end

  def layoutSubviews
    self_height = self.bounds.size.height
    half_self_height = self.bounds.size.height / 2

    center_of_bar = @split_location # - self.frame.origin.y

    rmq(@top_view_container).layout(l: 5, fr: 5, height: center_of_bar - 25)
    rmq(@bottom_view_container).layout(l: 5, fr: 5, t: center_of_bar + 25, height: self_height - center_of_bar - 30)

    rmq(@slide_bar_drag).layout(l: 5, fr: 5, t: center_of_bar - 15) unless @moving
    rmq(@slide_bar).layout(l: 5, fr: 5, t: center_of_bar - 15)
  end
end
