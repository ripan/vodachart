class AlienCategoriesController < ApplicationController
  before_action :set_alien_category, only: [:show, :edit, :update, :destroy]

  # GET /alien_categories
  # GET /alien_categories.json
  def index
    @alien_categories = AlienCategory.all
  end

  # GET /alien_categories/1
  # GET /alien_categories/1.json
  def show
  end

  # GET /alien_categories/new
  def new
    @alien_category = AlienCategory.new
  end

  # GET /alien_categories/1/edit
  def edit
  end

  # POST /alien_categories
  # POST /alien_categories.json
  def create
    @alien_category = AlienCategory.new(alien_category_params)

    respond_to do |format|
      if @alien_category.save
        format.html { redirect_to @alien_category, notice: 'Alien category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @alien_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @alien_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alien_categories/1
  # PATCH/PUT /alien_categories/1.json
  def update
    respond_to do |format|
      if @alien_category.update(alien_category_params)
        format.html { redirect_to @alien_category, notice: 'Alien category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @alien_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alien_categories/1
  # DELETE /alien_categories/1.json
  def destroy
    @alien_category.destroy
    respond_to do |format|
      format.html { redirect_to alien_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alien_category
      @alien_category = AlienCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alien_category_params
      params.require(:alien_category).permit(:name)
    end
end
