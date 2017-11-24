require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))
require 'ui'

class FrameTest < Test::Unit::TestCase

  include UI::Builder

  def test_basics

    dlg = main_dialog {
      frame('Title', :id => :frame) {
        label "Content text"
      }
    }

    frame = dlg.children.first
    assert_kind_of UI::Frame, frame
    # FIXME label method is actually missing
    # assert_equal "Title", frame.label
    #
    # frame.label = "New title"
    # assert_equal "New Title", frame.label
  end

end
