class Produto < ActiveRecord::Base

mount_uploader :foto, FotoProdutoUploader
has_many :pedidos


def listar
@produtos = Produto.all.paginate(page: params[:page], per_page: 10)
respond_to do |format|
format.html
format.pdf do
pdf = ProdutosReport.new(@produtos)
send_data pdf.render, filename: 'ProdutosListagem.pdf', :width =>
pdf.bounds.width,
type: 'application/pdf', disposition: :inline, :page_size => "A4",
:page_layout => :portrait
end
end
end

end
