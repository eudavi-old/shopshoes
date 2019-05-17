class ClientesController < ApplicationController
    before_action :set_cliente, only: [:destroy]
    before_action :manipular_cliente?, only: [:new, :create, :edit, :show, :destroy]

    def index
      @clientes = Cliente.all
    end

    def new
      @cliente = Cliente.new
    end

    def create
      @cliente = Cliente.new(cliente_params)
      @user = User.new(user_params)
      @user.admin = false

      if @cliente.save
        @user.cliente_id = @cliente.id
        @user.save!

        redirect_to root_path, notice: 'Cliente was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @cliente.destroy
      redirect_to clientes_url, notice: 'Cliente was successfully destroyed.'
    end

    private
    
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    def cliente_params
      params.require(:cliente).permit(:cpf, :nome, :data_nasc, :cep, 
        :logradouro, :debito, :num_logradouro, :bairro, :cidade, :uf, :pais, emails_attributes: [:email])
    end

    def user_params
      params.require(:cliente).permit(:email,:password,:password_confirmation)
    end
end
