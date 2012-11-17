class EventsController < ApplicationController
  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]
  def index
    @events = Event.page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
      flash[:notice] = "event was successfully created"
    else
      render :action => :new
    end
  end
  def show
    @page_title = @event.name
    respond_to do |format|
      format.html { @page_title = @event.name } # show.html.erb
      format.xml # show.xml.builder
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end
  end
  def edit
  end
  def update
    if @event.update_attributes(params[:event])
      redirect_to event_url( @event)
      flash[:notice] = "event was successfully update"
    else
      render :action => :edit
    end
  end
  def destroy
    @event.destroy
    redirect_to :action => :index
    flash[:notice] = "event was successfully deleted"
  end
  protected
  def find_event
    @event = Event.find(params[:id])
  end
end
