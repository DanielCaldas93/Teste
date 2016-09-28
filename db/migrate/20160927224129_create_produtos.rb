class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.string :quantidade
      t.float :valorUnit
      t.string :imagem

      t.timestamps null: false
    end
  end
end
