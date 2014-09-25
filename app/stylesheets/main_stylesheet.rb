class MainStylesheet < ApplicationStylesheet
  include SlideOverControlStylesheet

  def root_view(st)
    st.background_color = color.white
  end

  def slide_over_control(st)
    st.frame = "a0:z99"
    st.background_color = color.cyan
  end
end
