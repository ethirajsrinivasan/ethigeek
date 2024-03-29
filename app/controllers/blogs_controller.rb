class BlogsController < ApplicationController
  before_action :check_authorization, except: [:show, :index]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  layout "blog_application"

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.published.tech.paginate(:page => params[:page]).order('id DESC')
  end

  def show_all
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @previous_blog = @blog.previous
    @next_blog = @blog.next
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(refined_blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(refined_blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    redirect_to :root unless request.xhr?
    @blog = Blog.friendly.find(params[:id])
    @blog.likes += 1
    @blog.save!
    render json: { status: :ok, likes: @blog.likes }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :state, :content_url, :published_at, :slug, :picture,:blog_type,:picture_alt)
    end

    def refined_blog_params
    	refined_params = blog_params
    	refined_params["published_at"] = Date.strptime(blog_params["published_at"], '%Y-%m-%d')
    	refined_params
    end
end
