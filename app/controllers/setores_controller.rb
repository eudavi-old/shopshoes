class SetoresController < ApplicationController
  
  before_action :set_setor, only: [:show, :edit, :update, :destroy]

  def index
    @setores = Setor.all
  end

  def show; end

  def new
    @setor = Setor.new
  end

  def edit; end

  def create
    @setor = Setor.new(setor_params)
   
    if @setor.save
      redirect_to rails_admin_path, notice: 'Setor was successfully created.'
    else
      render :new
    end
  end

  def update
      if @setor.update(setor_params)
        redirect_to @setor, notice: 'Setor was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @setor.destroy
    redirect_to setores_url, notice: 'Setor was successfully destroyed.'
  end

  private
    def set_setor
      @setor = Setor.find(params[:id])
    end
    
    def setor_params
      params.require(:setor).permit(:setor, :manipular_cliente, :manipular_funcionario, :manipular_produto)
    end
end
