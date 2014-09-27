class MainStylesheet < ApplicationStylesheet
  include SampleTableStylesheet
  include SampleTableCellStylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def slide_over_control(st)
    st.frame = :full

    st.slide_bar_top_margin = 74
    st.slide_bar_top_snap_back_to = 174

    st.slide_bar_center = rmq.device.screen_height / 2

    st.slide_bar_bottom_margin = 0
    st.slide_bar_bottom_snap_back_to = 130

    # Other options
    # st.slide_bar_height = 40
    # st.auto_close = false
    # st.slide_bar_background_color = color.dark_gray
  end

  def button(st)
    st.background_color = color.blue
    st.color = color.white
    st.font = font.small
  end

  def open_button(st)
    button st
    st.frame = "a0:c0"
    st.text = 'Open'
  end

  def close_button(st)
    button st
    st.frame = "d0:f0"
    st.text = 'Close'
  end

  def toggle_auto_close(st)
    button st
    st.frame = "g0:m0"
    toggle_auto_close_enabled st
  end

  def toggle_auto_close_enabled(st)
    st.text = 'Disable auto close'
    st.background_color = color.blue
  end

  def toggle_auto_close_disabled(st)
    st.text = 'Enable auto close'
    st.background_color = color.black
  end

  def slide_bar_label(st)
    st.frame = {l: 10, fr: 10, t: 2, fb: 2}
    st.text = "Drag me"
    st.color = color.white
    st.text_alignment = :center
  end
end
