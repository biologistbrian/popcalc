class SitefactorsController < ApplicationController
  before_action :set_sitefactor, only: [:show, :edit, :update, :destroy]

  # GET /sitefactors
  # GET /sitefactors.json
  def index
    @sitefactors = Sitefactor.all
  end

  # GET /sitefactors/1
  # GET /sitefactors/1.json
  def show
  end

  # GET /sitefactors/new
  def new
    @sitefactor = Sitefactor.new
  end

  # GET /sitefactors/1/edit
  def edit
  end

  # POST /sitefactors
  # POST /sitefactors.json
  def create
    @sitefactor = Sitefactor.new(sitefactor_params)

    respond_to do |format|
      if @sitefactor.save
        format.html { redirect_to @sitefactor, notice: 'Sitefactor was successfully created.' }
        format.json { render :show, status: :created, location: @sitefactor }
      else
        format.html { render :new }
        format.json { render json: @sitefactor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitefactors/1
  # PATCH/PUT /sitefactors/1.json
  def update
    respond_to do |format|
      if @sitefactor.update(sitefactor_params)
        format.html { redirect_to @sitefactor, notice: 'Sitefactor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitefactor }
      else
        format.html { render :edit }
        format.json { render json: @sitefactor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitefactors/1
  # DELETE /sitefactors/1.json
  def destroy
    @sitefactor.destroy
    respond_to do |format|
      format.html { redirect_to sitefactors_url, notice: 'Sitefactor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitefactor
      @sitefactor = Sitefactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitefactor_params
      params.fetch(:sitefactor, {})
    end
end
