class Pedido < ActiveRecord::Base

	belongs_to :cliente
	has_many :produto
end
