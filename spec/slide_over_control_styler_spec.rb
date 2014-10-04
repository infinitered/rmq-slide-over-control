describe "slide_over_control_styler" do

  it "should send the auto_close value to the view" do
    view = rmq.append!(SlideOverControl)

    event_proc = Proc.new { }
    rmq(view).style { |st| st.auto_close = event_proc }

    view.auto_close.should == event_proc
    rmq(view).style { |st| @value = st.auto_close }
    @value.should == event_proc
  end

  it "should send the slide_bar_bottom_margin value to the view" do
    view = rmq.append!(SlideOverControl)

    margin = 123
    rmq(view).style { |st| st.slide_bar_bottom_margin = margin }

    view.slide_bar_bottom_margin.should == margin
    rmq(view).style { |st| @value= st.slide_bar_bottom_margin }
    @value.should == margin
  end

  it "should send the slide_bar_top_margin value to the view" do
    view = rmq.append!(SlideOverControl)

    margin  = 48
    rmq(view).style { |st| st.slide_bar_top_margin = margin }

    view.slide_bar_top_margin.should == margin
    rmq(view).style { |st| @value= st.slide_bar_top_margin }
    @value.should == margin
  end

  it "should send the slide_bar_height value to the view" do
    view = rmq.append!(SlideOverControl)

    rmq(view).style { |st| st.slide_bar_height = 10 }

    view.slide_bar_height.should == 10
    rmq(view).style { |st| @value= st.slide_bar_height }
    @value.should == 10
  end

  it "should send the slide_bar_background_color to the view" do
    view = rmq.append!(SlideOverControl)

    color = UIColor.redColor

    rmq(view).style { |st| st.slide_bar_background_color = color }

    view.slide_bar_background_color.should == color
    rmq(view).style { |st| @value= st.slide_bar_background_color }
    @value.should == color
  end

  it "should send the top_view_container_background_color to the view" do
    view = rmq.append!(SlideOverControl)

    color = UIColor.redColor
    rmq(view).style { |st| st.top_view_container_background_color = color }

    view.top_view_container_background_color.should == color
    rmq(view).style { |st| @value= st.top_view_container_background_color }
    @value.should == color
  end

  it "should send the slide_bar_center to the view" do
    view = rmq.append!(SlideOverControl)

    center = 47
    rmq(view).style { |st| st.slide_bar_center = center }

    view.slide_bar_center.should == center
    rmq(view).style { |st| @value= st.slide_bar_center }
    @value.should == center
  end

  it "should send the slide_bar_top_snap_back_to to the view" do
    view = rmq.append!(SlideOverControl)

    snap_to = 10
    rmq(view).style { |st| st.slide_bar_top_snap_back_to = snap_to }

    view.slide_bar_top_snap_back_to.should == snap_to
    rmq(view).style { |st| @value= st.slide_bar_top_snap_back_to }
    @value.should == snap_to
  end

  it "should send slide_bar_bottom_snap_back_to to the view" do
    view = rmq.append!(SlideOverControl)

    snap_to_bottom = 40
    rmq(view).style { |st| st.slide_bar_bottom_snap_back_to = snap_to_bottom }

    view.slide_bar_bottom_snap_back_to.should == snap_to_bottom
    rmq(view).style { |st| @value= st.slide_bar_bottom_snap_back_to }
    @value.should == snap_to_bottom
  end
end
