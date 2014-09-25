class MainController < UIViewController

  def viewDidLoad
    super

    self.title = 'slide-over-control example'

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    @slide_over_control = rmq.append(SlideOverControl, :slide_over_control).get
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end

end
