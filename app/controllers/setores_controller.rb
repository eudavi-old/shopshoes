class SetoresController < ApplicationController
  
  before_action :set_setor, only: [:destroy]

  def index
    @setores = Setor.all
  end

  def new
    @setor = Setor.new
  end

  def create
    @setor = Setor.new(setor_params)
   
    if @setor.save
      redirect_to rails_admin_path, notice: 'Setor was successfully created.'
    else
      render :new
    end
  end

  private
    def set_setor
      @setor = Setor.find(params[:id])
    end

    def setor_params
      params.require(:setor).permit(:setor, :manipular_cliente, :manipular_funcionario, :manipular_produto)
    end
end
