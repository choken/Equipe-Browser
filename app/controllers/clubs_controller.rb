class ClubsController < ApplicationController
  # GET /clubs
  # GET /clubs.xml
  def index
    #@clubs = Club.all
    @clubs = []

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clubs }
    end
  end
  
  
  # GET /clubs/meetings/1
  # GET /clubs/meetings/1.xml
  def meetings
    @current_tab = "Clubs"
    
    sess = Patron::Session.new
    sess.base_url = "http://online.equipe.com/"
    #http://online.equipe.com/api/v1/clubs/####/meetings.json
    response = sess.get "api/v1/clubs/" + params[:id].to_s + "/meetings.json"
    @meetings = JSON.parse response.body
    
    
    
    respond_to do |format|
      format.html # meetings.html.erb
      format.xml  { render :xml => @meetings }
    end
    
  end


  # GET /clubs/starts/1
  # GET /clubs/starts/1.xml
  def starts
    @current_tab = "Clubs"
    
    sess = Patron::Session.new
    sess.base_url = "http://online.equipe.com/"
    #http://online.equipe.com/api/v1/clubs/235/starts.json
    response = sess.get "api/v1/clubs/" + params[:id].to_s + "/starts.json"
    @starts = JSON.parse response.body
    
    
    
    respond_to do |format|
      format.html # starts.html.erb
      format.xml  { render :xml => @starts }
    end
    
  end

  # GET /clubs/show_start/1/1
  # GET /clubs/show_start/1/1.xml
  def show_start
    #@meetings = Meeting.all
    @current_tab = "Clubs"
    
    sess = Patron::Session.new
    sess.base_url = "http://online.equipe.com/"
    #http://online.equipe.com/api/v1/clubs/1/starts.json
    response = sess.get "api/v1/clubs/" + params[:club_id].to_s + "/starts.json"
    @starts = JSON.parse response.body
    @start = @starts.select{|m| m["id"] = params[:id]}
    @start = @start.first if @start.size > 0

    respond_to do |format|
      format.html # show_start.html.erb
      format.xml  { render :xml => @start }
    end
  end
  


#-----------------------------------
=begin

  # GET /clubs/1
  # GET /clubs/1.xml
  def show
    @club = nil #Club.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @club }
    end
  end

  # GET /clubs/new
  # GET /clubs/new.xml
  def new
    @club = Club.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @club }
    end
  end

  # GET /clubs/1/edit
  def edit
    @club = Club.find(params[:id])
  end

  # POST /clubs
  # POST /clubs.xml
  def create
    @club = Club.new(params[:club])

    respond_to do |format|
      if @club.save
        format.html { redirect_to(@club, :notice => 'Club was successfully created.') }
        format.xml  { render :xml => @club, :status => :created, :location => @club }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.xml
  def update
    @club = Club.find(params[:id])

    respond_to do |format|
      if @club.update_attributes(params[:club])
        format.html { redirect_to(@club, :notice => 'Club was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.xml
  def destroy
    @club = Club.find(params[:id])
    @club.destroy

    respond_to do |format|
      format.html { redirect_to(clubs_url) }
      format.xml  { head :ok }
    end
  end
=end
end
