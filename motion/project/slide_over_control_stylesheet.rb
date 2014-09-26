module SlideOverControlStylesheet

  def slide_over_control_content(st)
    st.background_color = color.clear
  end

  #def slide_over_control_top_view_container(st)
    ##st.frame = {l: 5, t: 5, fr: 5, height: (st.super_height / 2) - 20}
    #st.background_color = color.blue
  #end

  #def slide_over_control_main_view_container(st)
    ##st.frame = {l: 5, fb: 5, fr: 5, height: (st.super_height / 2) - 20}
    #st.background_color = color.green
  #end

  def slide_over_control_slide_bar(st)
    #st.frame = {l: 5, fr: 5, top: (st.super_height / 2) - 15, height: 30}
    st.background_color = color.black
  end

  def slide_over_control_slide_bar_drag(st)
    #st.frame = {l: 5, fr: 5, top: (st.super_height / 2) - 15, height: 30}
    st.background_color = color.clear
  end

  def slide_over_control_main_view(st)
    #st.background_color = color.yellow
  end

  def slide_over_control_top_view(st)
    #st.background_color = color.red
  end
end

