class Cliente < ActiveRecord::Base

	has_many :pedidos, :dependent => :destroy
end
