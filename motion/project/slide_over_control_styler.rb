module RubyMotionQuery
  module Stylers

    # Inherits all of UIViewStyler and UIControlStyler
    class SlideOverControlStyler < UIControlStyler
      def auto_close=(value) ;                    @view.auto_close = value ; end
      def auto_close ;                            @view.auto_close ; end

      def slide_bar_bottom_margin=(value) ;       @view.slide_bar_bottom_margin = value ; end
      def slide_bar_bottom_margin ;               @view.slide_bar_bottom_margin ; end

      def slide_bar_top_margin=(value) ;          @view.slide_bar_top_margin = value ; end
      def slide_bar_top_margin ;                  @view.slide_bar_top_margin ; end

      def slide_bar_height=(value) ;              @view.slide_bar_height = value ; end
      def slide_bar_height ;                      @view.slide_bar_height ; end

      def slide_bar_background_color=(value) ;    @view.slide_bar_background_color = value ; end
      def slide_bar_background_color;             @view.slide_bar_background_color ; end

      def slide_bar_center=(value) ;              @view.slide_bar_center = value ; end
      def slide_bar_center;                       @view.slide_bar_center ; end

      def slide_bar_top_snap_back_to=(value) ;    @view.slide_bar_top_snap_back_to = value ; end
      def slide_bar_top_snap_back_to ;            @view.slide_bar_top_snap_back_to ; end

      def slide_bar_bottom_snap_back_to=(value) ; @view.slide_bar_bottom_snap_back_to = value ; end
      def slide_bar_bottom_snap_back_to ;         @view.slide_bar_bottom_snap_back_to ; end
    end

  end
end
