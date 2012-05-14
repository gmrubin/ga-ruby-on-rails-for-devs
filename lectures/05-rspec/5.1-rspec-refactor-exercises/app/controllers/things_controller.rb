class ThingsController < ApplicationController
  before_filter :get_thing, :only => [ :edit, :show, :update, :destroy ]

  def get_thing
    begin
    @thing = Thing.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404.html", status: 404
    end
  end

  def index
    @things = Thing.all
  end

  def show
  end

  def edit
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(params[:thing])
    if @thing.save
      redirect_to @thing, notice: "Thing was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, notice: "Thing was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @thing.destroy
    redirect_to things_url
  end

end
