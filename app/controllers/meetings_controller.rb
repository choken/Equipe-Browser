class MeetingsController < ApplicationController
  #require 'patron'
  # GET /meetings
  # GET /meetings.xml
  def index
    #@meetings = Meeting.all
    @current_tab = "Meetings"
    
    sess = Patron::Session.new
    sess.base_url = "http://online.equipe.com/"
    #http://online.equipe.com/api/v1/meetings.json
    response = sess.get "api/v1/meetings.json"
    @meetings = JSON.parse response.body


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetings }
      format.json { render :json => @meetings }
      format.atom { render :json => @meetings.map{|i| i["name"] }}
    end
  end

  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    #@meetings = Meeting.all
    @current_tab = "Meetings"
    
    sess = Patron::Session.new
    sess.base_url = "http://online.equipe.com/"
    #http://online.equipe.com/api/v1/meetings.json
    response = sess.get "api/v1/meetings/" + params[:id].to_s + ".json"
    @meeting = JSON.parse response.body

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.xml
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.xml
  def create
    @meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to(@meeting, :notice => 'Meeting was successfully created.') }
        format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.xml
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to(@meeting, :notice => 'Meeting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.xml
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end
end
