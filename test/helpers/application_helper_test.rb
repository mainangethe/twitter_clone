require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'Page Title Generator' do
    assert_equal page_title_generator, 'Twitter Clone'
    assert_equal page_title_generator('Home'), 'Home | Twitter Clone'
  end
end
