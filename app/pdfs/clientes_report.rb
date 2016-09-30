class ClientesReport < Prawn::Document
	def initialize(clientes)
		super()
		@clientes = clientes
		header
		text_content
		table_content
	end
	def header
#This inserts an image in the pdf file and sets the size of the image
image "#{Rails.root}/app/assets/images/lambiscaria.jpg", width: 530, height: 100
end
def text_content
	y_position = cursor - 50
# The bounding_box takes the x and y coordinates for positioning its content and some options to style it
bounding_box([0, y_position], :width => 540, :height => 50) do
	text "Lambiscaria Serviços de Buffet", size: 15, style: :bold
	text "Listagem de Clientes", size: 12, style: :bold
end
end
def table_content
	table cliente_rows do
		row(0).font_style = :bold
		self.header = true
		self.row_colors = ['DDDDDD', 'FFFFFF']
		self.column_widths = [90,200, 200, 50]
	end
end
def cliente_rows
	[['Nome', 'E-mail']] +
	@clientes.map do |cliente|
		[cliente.nome, cliente.email]
	end
end
end
