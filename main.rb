#!/usr/bin/env ruby
require_relative 'app'

def start
  app = App.new
  app.display_menu
end
start
