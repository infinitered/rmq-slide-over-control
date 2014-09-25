module SlideOverControlStylesheet

  def draggable_split(st)
    st.frame = {l: 5, t: 100, w: 80, h: 40}
    st.background_color = color.light_gray

    # Style overall view here
  end

  def top_view_container(st)
    #st.frame = {l: 5, t: 5, fr: 5, height: (st.super_height / 2) - 20}
    st.background_color = color.blue
  end

  def bottom_view_container(st)
    #st.frame = {l: 5, fb: 5, fr: 5, height: (st.super_height / 2) - 20}
    st.background_color = color.green
  end

  def slide_bar(st)
    st.frame = {l: 5, fr: 5, top: (st.super_height / 2) - 15, height: 30}
    st.background_color = color.orange
  end

  def slide_bar_drag(st)
    st.frame = {l: 5, fr: 5, top: (st.super_height / 2) - 15, height: 30}
    st.background_color = color.translucent_black
  end

  def top_view(st)
    st.frame = {l: 5, t: 5, fr: 5, fb: 5}
    st.background_color = color.red
  end

  def bottom_view(st)
    st.frame = {l: 5, t: 5, fr: 5, fb: 5}
    st.background_color = color.yellow
  end
end

