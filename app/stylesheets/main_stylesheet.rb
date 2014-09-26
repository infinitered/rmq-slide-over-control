class MainStylesheet < ApplicationStylesheet
  include SampleTableStylesheet
  include SampleTableCellStylesheet

  include SlideOverControlStylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def slide_over_control(st)
    st.frame = :full #"a0:z99"
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
    st.text = 'Disable auto close'
  end

  def slide_bar_label(st)
    st.frame = {l: 10, fr: 10, t: 2, fb: 2}
    st.text = "Drag me"
    st.color = color.white
    st.text_alignment = :center
  end
end
