rmq-slide-over-control
===================

**Requires RMQ 0.8.0 or later, and iOS 7 or later**

[RMQ](http://rubymotionquery.com) plugin for RubyMotion

A control that places a draggable view over another view, allowing the user to show more or less of the main view below

![image](https://ir_wp.s3.amazonaws.com/wp-content/uploads/sites/19/2014/09/slide-over-control-example_2.gif)


## Installation

Add this line to your application's Gemfile:

    gem 'rmq-slide-over-control', :git => 'git@github.com:infinitered/rmq-slide-over-control.git'
    
And then execute:

    $ bundle

## Usage

See the sample app in this repo (just download the repo and run it, look in /app for files).

### Example using stylesheet:

In your controller:

```ruby
@slide_over_control = rmq.append(SlideOverControl, :slide_over_control).get.tap do |o|
  o.main_view = rmq.create!(UIImageView, :photo_of_kittens) 
  o.top_view = rmq.create!(UITextView, :kittens_description)
  rmq(o.slide_bar).append(UILabel, :slide_bar_label)
end
```

In your stylesheet:

```ruby

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

def photos_of_kittens(st)
  st.frame = :full
  # Style this
end


def kittens_description(st)
  st.frame = :full
  # Style this
end
```

If you don't use stylesheets, then just call the same methods that are in the style:

```ruby
my_view = rmq.append! SlideOverControl
my_view.slide_bar_top_margin = 74
# etc
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
