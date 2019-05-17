class BancosController < ApplicationController
  before_action :set_banco, only: [:show, :edit, :update, :destroy]

  def index
    @bancos = Banco.all
  end

  def show; end

  def new
    @banco = Banco.new
  end

  def edit; end

  def create
    @banco = Banco.new(banco_params)

    if @banco.save
      redirect_to @banco, notice: 'Banco was successfully created.'
    else
      render :new
    end
  end

  def update
    if @banco.update(banco_params)
      redirect_to @banco, notice: 'Banco was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @banco.destroy
    redirect_to bancos_url, notice: 'Banco was successfully destroyed.'
  end

  private
    def set_banco
      @banco = Banco.find(params[:id])
    end

    def banco_params
      params.require(:banco).permit(:nome_banco)
    end
end
