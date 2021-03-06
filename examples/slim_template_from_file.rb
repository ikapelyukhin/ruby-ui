$: << File.expand_path(File.join(File.dirname(__FILE__), '../lib'))
require 'ui'

include UI::Template

TEMPLATE_FILE = File.expand_path("../wizard1.uit",__FILE__)
TEMPLATE_FILE2 = File.expand_path("../wizard2.uit",__FILE__)

dialog = render file: TEMPLATE_FILE
puts dialog.id
puts dialog[:Enabled]
puts dialog.properties.inspect
dialog.wait_for_event
puts dialog.id
map = {}
map[:first] = dialog.find_widget(:i1)[:Value]
map[:second] = dialog.find_widget(:i2)[:Value]
dialog.destroy!
dialog2 = render file: TEMPLATE_FILE2, context: map
dialog2.wait_for_event
puts dialog2.id
