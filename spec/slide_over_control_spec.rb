describe "slideover_controler" do

  it "should the proper styler" do
    SlideOverControl.alloc.init.rmq_styler.class.should == RubyMotionQuery::Stylers::SlideOverControlStyler

  end

  describe "when built" do
    before do
      @view = rmq.append!(SlideOverControl)
    end

    it "should be open" do
      @view.open?.should  == true
    end

    it "should create the top container" do
      @view.instance_variable_get("@top_container").should != nil
    end

    it "should create the slide bar" do
      @view.instance_variable_get("@slide_bar").should != nil
    end

    it "should create the slide bar drag" do
      @view.instance_variable_get("@slide_bar_drag").should != nil
    end

    it "should create the slide bar drag" do
      @view.instance_variable_get("@auto_close").should == true
    end
  end

  describe "slide_bar_background_color=" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.slide_bar_background_color = UIColor.greenColor
    end

    it "should set the background color of the slide bar" do
      @view.instance_variable_get("@slide_bar").backgroundColor.should == UIColor.greenColor
    end
  end

  describe "top_view_container_background_color=" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.top_view_container_background_color = UIColor.yellowColor
    end

    it "should set the background color of the slide bar" do
      @view.instance_variable_get("@top_view_container_background_color").should == UIColor.yellowColor
      @view.instance_variable_get("@top_container").backgroundColor.should == UIColor.yellowColor
    end
  end

  describe "slide_bar_center=" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.slide_bar_center = 200
    end

    it "should set the slide bar center and when opening values" do
      @view.instance_variable_get("@slide_bar_center").should == 200
      @view.instance_variable_get("@slide_bar_center_when_opening").should == 200
    end
  end

  describe "main_view=" do
    before do
      @new_main_view = UIView.alloc.init
      @view = rmq.append!(SlideOverControl)
      @view.main_view = @new_main_view
    end

    it "should set a new main view" do
      @view.instance_variable_get("@main_view").should == @new_main_view
    end
  end

  describe "top_view=" do
    before do
      @new_main_view = UIView.alloc.init
      @view = rmq.append!(SlideOverControl)
      @view.top_view = @new_main_view
    end

    it "should set a new top view" do
      @view.instance_variable_get("@top_view").should == @new_main_view
    end

    it "should allow nil values for the top view" do
      should.not.raise(StandardError) {
        @view.top_view = nil
      }

      @view.instance_variable_get("@top_view").should == nil
    end
  end

  describe "slide_bar_height=" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.slide_bar_height = 102
    end

    it "should set the slide bar height" do
      @view.instance_variable_get("@slide_bar_height").should == 102
    end
  end

  describe "hide_top_view" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.hide_top_view
    end

    it "should make the top container hidden" do
      @view.instance_variable_get("@top_container").hidden?.should == true
    end
  end

  describe "show_top_view" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.hide_top_view
      @view.show_top_view
    end

    it "should make the top container hidden" do
      @view.instance_variable_get("@top_container").hidden?.should == false
    end
  end

  describe "open" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.open
    end

    it "should be open" do
      @view.open?.should == true
    end

    it "should be visible" do
      @view.instance_variable_get("@top_container").hidden?.should == false
    end
  end

  describe "close" do
    before do
      @view = rmq.append!(SlideOverControl)
      @view.open
      @view.close(animate: false)
    end

    it "should not be open" do
      @view.open?.should == false
    end

    it "should not be visible" do
      @view.instance_variable_get("@top_container").hidden?.should == true
    end
  end

  describe "after_open" do
    before do
      @proc = Proc.new {}
      @view = rmq.append!(SlideOverControl)
      @view.after_open = @proc
    end

    it "should set the after_open block" do
      @view.instance_variable_get("@after_open").should == @proc
    end
  end

  describe "after_close" do
    before do
      @proc = Proc.new {}
      @view = rmq.append!(SlideOverControl)
      @view.after_close = @proc
    end

    it "should set the after_close block" do
      @view.instance_variable_get("@after_close").should == @proc
    end
  end

  describe "after_auto_close" do
    before do
      @proc = Proc.new {}
      @view = rmq.append!(SlideOverControl)
      @view.after_auto_close = @proc
    end

    it "should set the after_auto_close block" do
      @view.instance_variable_get("@after_auto_close").should == @proc
    end
  end
end
