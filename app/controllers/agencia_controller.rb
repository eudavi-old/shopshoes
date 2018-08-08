class AgenciaController < ApplicationController
  before_action :set_agencium, only: [:show, :edit, :update, :destroy]

  # GET /agencia
  # GET /agencia.json
  def index
    @agencia = Agencium.all
  end

  # GET /agencia/1
  # GET /agencia/1.json
  def show
  end

  # GET /agencia/new
  def new
    @agencium = Agencium.new
  end

  # GET /agencia/1/edit
  def edit
  end

  # POST /agencia
  # POST /agencia.json
  def create
    @agencium = Agencium.new(agencium_params)

    respond_to do |format|
      if @agencium.save
        format.html { redirect_to @agencium, notice: 'Agencium was successfully created.' }
        format.json { render :show, status: :created, location: @agencium }
      else
        format.html { render :new }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencia/1
  # PATCH/PUT /agencia/1.json
  def update
    respond_to do |format|
      if @agencium.update(agencium_params)
        format.html { redirect_to @agencium, notice: 'Agencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @agencium }
      else
        format.html { render :edit }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencia/1
  # DELETE /agencia/1.json
  def destroy
    @agencium.destroy
    respond_to do |format|
      format.html { redirect_to agencia_url, notice: 'Agencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agencium
      @agencium = Agencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agencium_params
      params.require(:agencium).permit(:nome_agencia)
    end
end
