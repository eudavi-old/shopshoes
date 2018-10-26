class FuncionariosController < ApplicationController
  
  before_action :authenticate_user!
  before_action :manipular_funcionario?, only: [:new, :create, :edit, :show, :destroy]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]
  
  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)
    @user = User.new(user_params)

    if Cargo.count >= 1
      @funcionario.cargos << Cargo.find(params[:funcionario][:cargos])
    end
    if Setor.count >= 1
      @funcionario.setores << Setor.find(params[:funcionario][:setores])
    end

    respond_to do |format|
      if @funcionario.save

        @user.funcionario_id = @funcionario.id
        @user.save!

        format.html { redirect_to rails_admin_path, notice: 'Funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: 'Funcionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:cpf, :nome, :salario, :data_nasc, :cep, 
        :logradouro, :num_logradouro, :bairro, :cidade, :uf, :pais, telefones_attributes: [:telefone])
    end

    def user_params
      params.require(:funcionario).permit(:email, :password,:password_confirmation)
    end
end
