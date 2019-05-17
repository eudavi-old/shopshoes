class FuncionariosController < ApplicationController
  before_action :authenticate_user!
  before_action :manipular_funcionario?, only: [:new, :create, :edit, :show, :destroy]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @funcionarios = Funcionario.all
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    @user = User.new(user_params)
    @user.admin = false
    
    @funcionario.cargos << Cargo.find(params[:funcionario][:cargos]) if Cargo.count >= 1
    @funcionario.setores << Setor.find(params[:funcionario][:setores]) if Setor.count >= 1

    if @funcionario.save
      @user.funcionario_id = @funcionario.id
      @user.save!

      redirect_to rails_admin_path, notice: 'Funcionario was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @funcionario.destroy
    redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.'
  end

  private
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def funcionario_params
      params.require(:funcionario).permit(:cpf, :nome, :salario, :data_nasc, :cep, 
        :logradouro, :num_logradouro, :bairro, :cidade, :uf, :pais, telefones_attributes: [:telefone])
    end

    def user_params
      params.require(:funcionario).permit(:email, :password,:password_confirmation)
    end
end
