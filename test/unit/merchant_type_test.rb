require 'test_helper'

class MerchantTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert MerchantType.new.valid?
  end
end
