class AddClienteEProdutoToPedidos < ActiveRecord::Migration
  def change
    add_reference :pedidos, :cliente, index: true, foreign_key: true
    add_reference :pedidos, :produto, index: true, foreign_key: true
  end
end
