class KernelperearsController < ApplicationController
  before_action :set_kernelperear, only: [:show, :edit, :update, :destroy]

  # GET /kernelperears
  # GET /kernelperears.json
  def index
    @kernelperears = Kernelperear.all
  end

  # GET /kernelperears/1
  # GET /kernelperears/1.json
  def show
  end

  # GET /kernelperears/new
  def new
    @kernelperear = Kernelperear.new
  end

  # GET /kernelperears/1/edit
  def edit
  end

  # POST /kernelperears
  # POST /kernelperears.json
  def create
    @kernelperear = Kernelperear.new(kernelperear_params)

    respond_to do |format|
      if @kernelperear.save
        format.html { redirect_to @kernelperear, notice: 'Kernelperear was successfully created.' }
        format.json { render :show, status: :created, location: @kernelperear }
      else
        format.html { render :new }
        format.json { render json: @kernelperear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kernelperears/1
  # PATCH/PUT /kernelperears/1.json
  def update
    respond_to do |format|
      if @kernelperear.update(kernelperear_params)
        format.html { redirect_to @kernelperear, notice: 'Kernelperear was successfully updated.' }
        format.json { render :show, status: :ok, location: @kernelperear }
      else
        format.html { render :edit }
        format.json { render json: @kernelperear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kernelperears/1
  # DELETE /kernelperears/1.json
  def destroy
    @kernelperear.destroy
    respond_to do |format|
      format.html { redirect_to kernelperears_url, notice: 'Kernelperear was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kernelperear
      @kernelperear = Kernelperear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kernelperear_params
      params.fetch(:kernelperear, {})
    end
end
