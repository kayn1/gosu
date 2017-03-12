# Encoding: UTF-8
require_relative 'test_helper'

class TestWindow < Minitest::Test
  class StubbornWindow < Gosu::Window
    def close
      # Do not call super
    end
    
    # v For manual testing v
    # def button_down(id)
    #   close! if id == Gosu::KB_ESCAPE
    # end
  end

  def test_close_callback
    window = StubbornWindow.new(200, 150)
    # window.show <- for manual testing
    assert window.tick
    window.close
    assert window.tick
    window.close!
    assert !window.tick
  end
end
