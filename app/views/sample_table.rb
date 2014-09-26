class SampleTable < UITableView

  SAMPLE_TABLE_CELL_ID = "SampleTableCell"

  def rmq_build
    load_data

    self.delegate = self
    self.dataSource = self
    rmq(self).apply_style :sample_table
  end

  def load_data
    @data = 0.upto(rand(100)).map do |i| # Test data
      {
        name: %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed).sample,
        num: rand(100),
      }
    end
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @data.length
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    rmq.stylesheet.sample_table_cell_height
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    data_row = @data[index_path.row]

    cell = table_view.dequeueReusableCellWithIdentifier(SAMPLE_TABLE_CELL_ID) || begin
      rmq.create(SampleTableCell, :sample_table_cell, reuse_identifier: SAMPLE_TABLE_CELL_ID).get

      # If you want to change the style of the cell, you can do something like this:
      #rmq.create(SampleTableCell, :sample_table_cell, reuse_identifier: SAMPLE_TABLE_CELL_ID, cell_style: UITableViewCellStyleSubtitle).get
    end

    cell.update(data_row)
    cell
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
  end
end
