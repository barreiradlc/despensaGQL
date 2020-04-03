class ProvimentosController < ApplicationController
  before_action :set_provimento, only: [:show, :edit, :update, :destroy]

  # GET /provimentos
  # GET /provimentos.json
  def index
    @provimentos = Provimento.all
  end

  # GET /provimentos/1
  # GET /provimentos/1.json
  def show
  end

  # GET /provimentos/new
  def new
    @provimento = Provimento.new
  end

  # GET /provimentos/1/edit
  def edit
  end

  # POST /provimentos
  # POST /provimentos.json
  def create
    @provimento = Provimento.new(provimento_params)

    respond_to do |format|
      if @provimento.save
        format.html { redirect_to @provimento, notice: 'Provimento was successfully created.' }
        format.json { render :show, status: :created, location: @provimento }
      else
        format.html { render :new }
        format.json { render json: @provimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provimentos/1
  # PATCH/PUT /provimentos/1.json
  def update
    respond_to do |format|
      if @provimento.update(provimento_params)
        format.html { redirect_to @provimento, notice: 'Provimento was successfully updated.' }
        format.json { render :show, status: :ok, location: @provimento }
      else
        format.html { render :edit }
        format.json { render json: @provimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provimentos/1
  # DELETE /provimentos/1.json
  def destroy
    @provimento.destroy
    respond_to do |format|
      format.html { redirect_to provimentos_url, notice: 'Provimento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provimento
      @provimento = Provimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provimento_params
      params.require(:provimento).permit(:nome)
    end
end
