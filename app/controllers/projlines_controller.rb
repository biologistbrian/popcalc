class ProjlinesController < ApplicationController
  # before_action :set_projline, only: [:show, :edit, :update, :destroy]
    def download_csv
    send_file "#{Rails.root}/public/docs/ti_projects_template.csv", type: "application/csv", x_sendfile: true
  end
  def import
    Projline.import(params[:file])
    redirect_to root_path, notice: "Projects uploaded successfully"
  end
  # GET /projlines
  # GET /projlines.json
  def index
    @projlines = Projline.all
  end

  # GET /projlines/1
  # GET /projlines/1.json
  def show
  end

  # GET /projlines/new
  def new
    @projline = Projline.new
  end

  # GET /projlines/1/edit
  def edit
  end

  # POST /projlines
  # POST /projlines.json
  def create
    @projline = Projline.new(projline_params)

    respond_to do |format|
      if @projline.save
        format.html { redirect_to @projline, notice: 'Projline was successfully created.' }
        format.json { render :show, status: :created, location: @projline }
      else
        format.html { render :new }
        format.json { render json: @projline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projlines/1
  # PATCH/PUT /projlines/1.json
  def update
    respond_to do |format|
      if @projline.update(projline_params)
        format.html { redirect_to @projline, notice: 'Projline was successfully updated.' }
        format.json { render :show, status: :ok, location: @projline }
      else
        format.html { render :edit }
        format.json { render json: @projline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projlines/1
  # DELETE /projlines/1.json
  def destroy
    @projline.destroy
    respond_to do |format|
      format.html { redirect_to projlines_url, notice: 'Projline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projline
      @projline = Projline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projline_params
      params.fetch(:projline, {})
    end
end
