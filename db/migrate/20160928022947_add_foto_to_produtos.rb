class AddFotoToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :foto, :string
  end
end
