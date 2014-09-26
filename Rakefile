# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require './motion/slide_over_control'

require 'bundler'
require 'motion/project/template/gem/gem_tasks'
Bundler.require

Motion::Project::App.setup do |app|
  app.name = 'slide-over-control'
  app.identifier = 'com.infinitered.motion-scene-kit'

  app.sdk_version = "8.0"
  app.deployment_target = "7.1"
  app.frameworks += %w[MapKit]
end
