class ThreadStatusesController < ApplicationController
  # GET /thread_statuses
  # GET /thread_statuses.xml
  def index
    @thread_statuses = ThreadStatus.default_index
    @recent_updated = ThreadStatus.recent_updated

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thread_statuses }
    end
  end

  # GET /thread_statuses/1
  # GET /thread_statuses/1.xml
  def show
    @thread_status = ThreadStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thread_status }
    end
  end

  # GET /thread_statuses/new
  # GET /thread_statuses/new.xml
  def new
    @thread_status = ThreadStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thread_status }
    end
  end

  # GET /thread_statuses/1/edit
  def edit
    @thread_status = ThreadStatus.find(params[:id])
  end

  # POST /thread_statuses
  # POST /thread_statuses.xml
  def create
    @thread_status = ThreadStatus.new(params[:thread_status])

    respond_to do |format|
      if @thread_status.save
        flash[:notice] = 'ThreadStatus was successfully created.'
        format.html { redirect_to(@thread_status) }
        format.xml  { render :xml => @thread_status, :status => :created, :location => @thread_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thread_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thread_statuses/1
  # PUT /thread_statuses/1.xml
  def update
    @thread_status = ThreadStatus.find(params[:id])

    respond_to do |format|
      if @thread_status.update_attributes(params[:thread_status])
        flash[:notice] = 'ThreadStatus was successfully updated.'
        format.html { redirect_to(@thread_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thread_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thread_statuses/1
  # DELETE /thread_statuses/1.xml
  def destroy
    @thread_status = ThreadStatus.find(params[:id])
    @thread_status.destroy

    respond_to do |format|
      format.html { redirect_to(thread_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
