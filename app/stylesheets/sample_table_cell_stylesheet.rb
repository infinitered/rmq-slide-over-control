module SampleTableCellStylesheet
  def sample_table_cell_height
    50
  end

  def sample_table_cell(st)
    st.background_color = color.light_gray
  end

  def cell_label(st)
    st.color = color.black
  end
end
