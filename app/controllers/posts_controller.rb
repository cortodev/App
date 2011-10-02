class PostsController < ApplicationController
  load_and_authorize_resource
  # GET /posts
  # GET /posts.xml
  def index
    @posts = eval("#{params[:controller].classify}.all")
    @slide =eval("#{params[:controller].classify}.order('count').limit('4')")

    respond_to do |format|
      format.html { render :template => 'posts/index' }# index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = eval("#{params[:controller].classify}.find(params[:id])")
    @post.count  ||= 0
    @post.count += 1

    respond_to do |format|
      format.html { render 'posts/show' } # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = eval("#{params[:controller].classify}.new")

    respond_to do |format|
      format.html { render :template => 'posts/new' }# new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = eval("#{params[:controller].classify}.find(params[:id])")
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = eval("#{params[:controller].classify}.new(params[:#{params[:controller].singularize.to_sym}])")
    @post.user = current_user
    #@post.auteur = current_user if user_signed_in?
    #@post.tags = params[:tags]

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = eval("#{params[:controller].classify}.find(params[:id])")

    respond_to do |format|
      if eval("@post.update_attributes(params[:#{params[:controller].singularize}])")
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
