class AgenciaController < ApplicationController
  before_action :set_agencia, only: [:show, :edit, :update, :destroy]

  # GET /agencia
  # GET /agencia.json
  def index
    @agencia = Agencia.all
  end

  # GET /agencia/1
  # GET /agencia/1.json
  def show
  end

  # GET /agencia/new
  def new
    @agencia = Agencia.new
  end

  # GET /agencia/1/edit
  def edit
  end

  # POST /agencia
  # POST /agencia.json
  def create
    @Agencia = Agencia.new(agencia_params)

    respond_to do |format|
      if @agencia.save
        format.html { redirect_to @agencia, notice: 'Agencia was successfully created.' }
        format.json { render :show, status: :created, location: @agencia }
      else
        format.html { render :new }
        format.json { render json: @agencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencia/1
  # PATCH/PUT /agencia/1.json
  def update
    respond_to do |format|
      if @agencia.update(agencia_params)
        format.html { redirect_to @agencia, notice: 'Agencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @agencia }
      else
        format.html { render :edit }
        format.json { render json: @agencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencia/1
  # DELETE /agencia/1.json
  def destroy
    @agencia.destroy
    respond_to do |format|
      format.html { redirect_to agencia_url, notice: 'Agencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agencia
      @agencia = Agencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agencia_params
      params.require(:agencia).permit(:nome_agencia)
    end
end
