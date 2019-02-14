class ParkingSpacesController < ApplicationController
  before_action :authenticated_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = ParkingSpace.all
  end
    
  def search
    if params[:search].blank?  
      @search_term = 'N/A'
      @results = ParkingSpace.all  
    else  
      @search_term = params[:search]
      @parameter = params[:search].downcase  
      @results = ParkingSpace.all.where("lower(title) LIKE :search OR lower(address) LIKE :search OR lower(body) LIKE :search OR lower(posted_by) LIKE :search", search: "%#{@parameter}%")
    end
  end
    
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @parking_space = current_user.parking_space.new
  end

  # GET /posts/1/edit
  def edit
  end
    
  def book
  end

  # POST /posts
  # POST /posts.json
  def create
    @parking_space = current_user.parking_space.new(post_params)

    respond_to do |format|
      if @parking_space.save
        format.html { redirect_to @parking_space, notice: 'Post was successfully listed.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @parking_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = ParkingSpace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:parking_space).permit(:title, :body, :address, :cost)
    end
end
