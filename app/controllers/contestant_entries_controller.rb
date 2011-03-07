class ContestantEntriesController < ApplicationController
  
  before_filter :current_admin
  
  # GET /contestant_entries
  # GET /contestant_entries.xml
  def index
    @contestant_entries = ContestantEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contestant_entries }
    end
  end

  # GET /contestant_entries/1
  # GET /contestant_entries/1.xml
  def show
    @contestant_entry = ContestantEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contestant_entry }
    end
  end

  # GET /contestant_entries/new
  # GET /contestant_entries/new.xml
  def new
    @contestant_entry = ContestantEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contestant_entry }
    end
  end

  # GET /contestant_entries/1/edit
  def edit
    @contestant_entry = ContestantEntry.find(params[:id])
  end

  # POST /contestant_entries
  # POST /contestant_entries.xml
  def create
    @contestant_entry = ContestantEntry.new(params[:contestant_entry])

    respond_to do |format|
      if @contestant_entry.save
        format.html { redirect_to(@contestant_entry, :notice => 'Contestant entry was successfully created.') }
        format.xml  { render :xml => @contestant_entry, :status => :created, :location => @contestant_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contestant_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contestant_entries/1
  # PUT /contestant_entries/1.xml
  def update
    @contestant_entry = ContestantEntry.find(params[:id])

    respond_to do |format|
      if @contestant_entry.update_attributes(params[:contestant_entry])
        format.html { redirect_to(@contestant_entry, :notice => 'Contestant entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contestant_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contestant_entries/1
  # DELETE /contestant_entries/1.xml
  def destroy
    @contestant_entry = ContestantEntry.find(params[:id])
    @contestant_entry.destroy

    respond_to do |format|
      format.html { redirect_to(contestant_entries_url) }
      format.xml  { head :ok }
    end
  end
end
