require 'drinks'

class CocktailsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cocktail, only: %i[ show edit update destroy ]

  # GET /cocktails or /cocktails.json
  def index
    @cocktails = set_cocktail_sort.paginate(page: params[:page], per_page: 16)
    render :index
  end
  
  # GET /cocktails/1 or /cocktails/1.json
  def show
    respond_to do |format|
      format.js
      format.html
    end
    render :show
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
    respond_to do |format|
      format.js
      format.html
    end
    render :new
  end

  # GET /cocktails/1/edit
  def edit
    respond_to do |format|
      format.js
      format.html
    end
    render :edit
  end

  # POST /cocktails or /cocktails.json
  def create
    @cocktail = current_user.cocktails.build(cocktail_params)

    if !@cocktail.api_image_url.nil?
      Cocktail.capture_api_image(@cocktail)
    else
      @cocktail.cocktail_photo.attach(params[:cocktail][:cocktail_photo])
    end

    if @cocktail.save
      redirect_to @cocktail, alert: "Cocktail was successfully created."
    else
      respond_to do |format|
        format.js { render :new }
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /cocktails/1 or /cocktails/1.json
  def update
    respond_to do |format|
      if @cocktail.update!(cocktail_params)
        if params[:cocktail][:cocktail_photo].present?
          @cocktail.cocktail_photo.purge
          @cocktail.cocktail_photo.attach(params[:cocktail][:cocktail_photo])
        end
        format.js { redirect_to @cocktail, notice: "Cocktail was successfully updated." }
        format.html { redirect_to @cocktail, notice: "Cocktail was successfully updated." }
        format.json { render :show, status: :ok, location: @cocktail }
      else
        format.js { render :edit, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cocktails/1 or /cocktails/1.json
  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.js { redirect_to cocktails_url, notice: "Cocktail was successfully removed." }
      format.html { redirect_to cocktails_url, notice: "Cocktail was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def set_cocktail_sort
      @cocktails_sort = current_user.cocktails.order('name ASC')
    end

    # Only allow a list of trusted parameters through.
    def cocktail_params
      params.require(:cocktail).permit(
        :name,
        :category,
        :alcoholic,
        :glass,
        :instructions,
        :ingredient1,
        :ingredient2,
        :ingredient3,
        :ingredient4,
        :ingredient5,
        :ingredient6,
        :ingredient7,
        :ingredient8,
        :ingredient9,
        :ingredient10,
        :ingredient11,
        :ingredient12,
        :ingredient13,
        :ingredient14,
        :ingredient15,
        :measure1,
        :measure2,
        :measure3,
        :measure4,
        :measure5,
        :measure6,
        :measure7,
        :measure8,
        :measure9,
        :measure10,
        :measure11,
        :measure12,
        :measure13,
        :measure14,
        :measure15,
        :api_id_drink, 
        :api_image_url)
    end
end
