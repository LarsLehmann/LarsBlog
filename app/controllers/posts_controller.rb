
class PostsController < ApplicationController
  authorize_resource
  @posts_title       = 'Member Login'
@posts_description = 'Member login page.'
@posts_keywords    = 'Site, Login, Members'
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page])
    @shows = Show.all

    respond_to do |format|
      format.html  #index.html.erb
      format.json { render json: @posts }
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    unauthorized! if cannot? :manage, @post

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    unauthorized! if cannot? :manage, @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    unauthorized! if cannot? :manage, @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Erfolg!' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end

    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    unauthorized! if cannot? :manage, @post

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    unauthorized! if cannot? :manage, @post

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    
  
    end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
   end

   
   @posts = Post.all(:select => "title", :order => "posted_at DESC", :limit => 20) 

    respond_to do |format|
    format.rss { render :layout => false }
    
   end

  
  end
end