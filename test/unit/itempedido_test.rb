require 'test_helper'

class ItempedidoTest < ActiveSupport::TestCase
  test "quantidade deve ser inteira e positiva" do
    Itempedido item = Itempedido.new(:quantidade => -1)
    item.valid?
    assert_not_nil item.errors.on(:quantidade)
  end
end
