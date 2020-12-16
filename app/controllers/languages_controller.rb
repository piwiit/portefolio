class LanguagesController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit update destroy]

  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    set_language
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
    @language = set_language
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html do
          redirect_to @language, notice: 'Language was successfully created.'
        end
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new }
        format.json do
          render json: @language.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /languages/1
  # PATCH/PUT /languages/1.json
  def update
    respond_to do |format|
      if set_language.update(language_params)
        format.html do
          redirect_to set_language, notice: 'Language was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json do
          render json: set_language.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    set_language.destroy
    respond_to do |format|
      format.html do
        redirect_to languages_url,
                    notice: 'Language was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private # Use callbacks to share common setup or constraints between actions.
  def set_language
    @language = Language.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def language_params
    params.require(:language).permit(:name, :picture)
  end
end
