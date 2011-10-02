class InscritsController < ApplicationController
  # GET /inscrits
  # GET /inscrits.json
  def index
    @inscrits = Inscrit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @inscrits }
    end
  end

  # GET /inscrits/1
  # GET /inscrits/1.json
  def show
    @inscrit = Inscrit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @inscrit }
    end
  end

  # GET /inscrits/new
  # GET /inscrits/new.json
  def new
    @inscrit = Inscrit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @inscrit }
    end
  end

  # GET /inscrits/1/edit
  def edit
    @inscrit = Inscrit.find(params[:id])
  end

  # POST /inscrits
  # POST /inscrits.json
  def create
    @inscrit = Inscrit.new(params[:inscrit])

    respond_to do |format|
      if @inscrit.save
        format.html { redirect_to @inscrit, :notice => 'Inscrit was successfully created.' }
        format.json { render :json => @inscrit, :status => :created, :location => @inscrit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @inscrit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inscrits/1
  # PUT /inscrits/1.json
  def update
    @inscrit = Inscrit.find(params[:id])

    respond_to do |format|
      if @inscrit.update_attributes(params[:inscrit])
        format.html { redirect_to @inscrit, :notice => 'Inscrit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @inscrit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inscrits/1
  # DELETE /inscrits/1.json
  def destroy
    @inscrit = Inscrit.find(params[:id])
    @inscrit.destroy

    respond_to do |format|
      format.html { redirect_to inscrits_url }
      format.json { head :ok }
    end
  end
end
