class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :data
      t.string :valorTotal

      t.timestamps null: false
    end
  end
end
