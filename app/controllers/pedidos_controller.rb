class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    #@pedidos = Pedido.all
    @pdatade = params[:pdata]
   
    filtro = "1=1"
   
    if @pdatade.present?
     filtro = filtro + " and data = '#{@data}'"
    end

    @pedidos = Pedido.where(filtro).order('data').paginate(page: params[:page], per_page: 3)
  end

  def listar
    @pedidos = Pedido.all
      respond_to do |format|
      format.html
      format.pdf do
        pdf = PedidosReport.new(@pedidos)
        send_data pdf.render, filename: 'PedidosListagem.pdf', :width => pdf.bounds.width,
        type: 'application/pdf', disposition: :inline, :page_size => "A4",
        :page_layout => :portrait
      end
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido criado com sucesso.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido atualizado com successo.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido cancelado com successo.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:data, :valorTotal, :cliente_id, :produto_id)
    end


end
