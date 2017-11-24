require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))
require 'ui'

class ReplacePointTest < Test::Unit::TestCase

  include UI::Builder

  def test_replace

    # FIXME parent is not defined inside replace_point, so it breaks (oh noes! :-()
    # dialog = main_dialog {
    #   vbox {
    #     label "This is fixed", :id => :lbl1
    #     replace_point(:id => :point) {
    #       label"Original content", :id => :lbl2
    #     }
    #   }
    # }

    dialog = UI::Builder.create_main_dialog
    vbox = UI::Builder.create_vbox dialog
    fixed_label = UI::Builder.create_label vbox, "This is fixed" #, :id => :lbl1
    fixed_label.id = :lbl1

    replace_point = UI::Builder.create_replace_point vbox #, :id => :point
    replace_point.id = :point

    label = UI::Builder.create_label replace_point, "Original content" #, :id => :lbl2
    label.id = :lbl2

    assert_raise(RuntimeError, "Only works with replace points") do
      dialog.replace(:lbl1) do
        label "New content"
      end
    end

    assert_equal("Original content", dialog.find(:lbl2)[:Value])

    dialog.replace(:point) do
      new_label = UI::Builder.create_label replace_point, "New content"
      new_label.id = :lbl2
    end

    assert_equal("New content", dialog.find(:lbl2)[:Value])


  end

end