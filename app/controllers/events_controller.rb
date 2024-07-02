class EventsController < ApplicationController
  def index
    @categories = Category.all
    @events = Event.all

    # Simple search
    if params[:search].present?
      @events = @events.where('title LIKE ?', "%#{params[:search]}%")
    end

    # Hierarchical search
    if params[:category_id].present?
      @events = @events.joins(:categories).where(categories: { id: params[:category_id] })
    end

    @events = @events.page(params[:page]).per(5)

  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :user_id, :venue_id, :image, category_ids: [])
  end

end
