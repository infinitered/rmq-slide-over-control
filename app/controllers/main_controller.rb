class MainController < UIViewController

  def viewDidLoad
    super

    self.title = 'rmq-slide-over-control'

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    @slide_over_control = rmq.append(SlideOverControl, :slide_over_control).get.tap do |o|
      o.slide_bar_top_snap_back_to = 174
      o.slide_bar_center = rmq.device.height / 2
      o.main_view = create_map
      o.top_view = rmq.create! SampleTable
      o.layout
      rmq(o.slide_bar).append(UILabel, :slide_bar_label)
    end

    rmq.append(UIButton, :open_button).on(:touch){ @slide_over_control.open }
    rmq.append(UIButton, :close_button).on(:touch){ @slide_over_control.close }

    rmq.append(UIButton, :toggle_auto_close).on(:touch) do |sender|
      @slide_over_control.auto_close = !@slide_over_control.auto_close
      rmq(sender).data = if @slide_over_control.auto_close
        'Disable auto close'
      else
        'Enable auto close'
      end
    end
  end

  def create_map
    map_view = rmq.create! MKMapView

    region = MKCoordinateRegion.new
    region.center.latitude = 37.8007876
    region.center.longitude = -122.4426679
    region.span.latitudeDelta = 0.015
    region.span.longitudeDelta = 0.015

    map_view.setRegion region, animated: false
    map_view
  end

  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end

end
