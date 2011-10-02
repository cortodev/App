class NewsletterController < ApplicationController
  def new
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @newsletter }
    end
  end

  def create
    @newseletter = Newsletter.new(params[:inscrit])

    respond_to do |format|
      if @newseletter.save
        format.html { redirect_to @newseletter, :notice => 'Newsletter was successfully created.' }
        format.json { render :json => @newseletter, :status => :created, :location => @inscrit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @newseletter.errors, :status => :unprocessable_entity }
      end
    end
  end
end
