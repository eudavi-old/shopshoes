class DadoBancariosController < ApplicationController
  before_action :set_dado_bancario, only: [:show, :edit, :update, :destroy]

  # GET /dado_bancarios
  # GET /dado_bancarios.json
  def index
    @dado_bancarios = DadoBancario.all
  end

  # GET /dado_bancarios/1
  # GET /dado_bancarios/1.json
  def show
  end

  # GET /dado_bancarios/new
  def new
    @dado_bancario = DadoBancario.new
  end

  # GET /dado_bancarios/1/edit
  def edit
  end

  # POST /dado_bancarios
  # POST /dado_bancarios.json
  def create
    @dado_bancario = DadoBancario.new(dado_bancario_params)

    respond_to do |format|
      if @dado_bancario.save
        format.html { redirect_to @dado_bancario, notice: 'Dado bancario was successfully created.' }
        format.json { render :show, status: :created, location: @dado_bancario }
      else
        format.html { render :new }
        format.json { render json: @dado_bancario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dado_bancarios/1
  # PATCH/PUT /dado_bancarios/1.json
  def update
    respond_to do |format|
      if @dado_bancario.update(dado_bancario_params)
        format.html { redirect_to @dado_bancario, notice: 'Dado bancario was successfully updated.' }
        format.json { render :show, status: :ok, location: @dado_bancario }
      else
        format.html { render :edit }
        format.json { render json: @dado_bancario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dado_bancarios/1
  # DELETE /dado_bancarios/1.json
  def destroy
    @dado_bancario.destroy
    respond_to do |format|
      format.html { redirect_to dado_bancarios_url, notice: 'Dado bancario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dado_bancario
      @dado_bancario = DadoBancario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dado_bancario_params
      params.require(:dado_bancario).permit(:conta)
    end
end
