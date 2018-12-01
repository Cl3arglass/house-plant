class PlantsController < ApplicationController
  before_action :set_user_by_params

  def new
    @plant = Plant.new
  end

  def create
    # binding.pry
    @plant = @user.plants.build(plant_params)
    if user_valid? && @plant.save
      redirect_to user_plants_path(@user)
    else
      flash[:notice] = "Try Again"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @plants = @user.plants
  end

  def show
  end

  private
  

   def plant_params
    params.require(:plant).permit(:name, :light, :watering, :user_id, comment_new: [:note])
   end

   def set_user_by_params
       @user = User.find_by_id(params[:user_id]) if (params[:user_id] && current_user.id == params[:user_id].to_i)
    if @user.nil?
       redirect_to user_path(current_user)
    end
   end

   def user_valid?
    @user && @user.id == current_user.id
  end

  
end
