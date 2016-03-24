class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end


  def show
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
      redirect_to @car, notice: creation_message
    else
      render :new
    end
  end

  def update
    @car = Car.new(car_params)
    update_message = "#{@car.year} #{@car.make} #{@car.model} updated"
    if @car.save
      redirect_to @car, notice: update_message
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Car was successfully deleted.'
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end
end



