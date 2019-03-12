class PlantsController < ApplicationController
  before_action :set_user_by_params
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def new
    @plant = Plant.new
  end

  def create
    @plant = @user.plants.build(plant_params)
    if user_valid? && @plant.save
      redirect_to user_plants_path(@user)
    else
      # flash[:notice] = "Try Again"
      render 'new'
    end
  end

  def edit
    plant_user_valid?
    if !user_valid?
      redirect_to user_plants_path(current_user)
    end
  end

  def update
    plant_user_valid?
    if user_valid? && @plant.update(plant_params)
        redirect_to user_plants_path(@user)
    elsif !@plant.update(plant_params)
        render 'edit'
    else
      redirect_to user_plants_path(current_user)
    end
  end

  def destroy
     plant_user_valid?
     if user_valid? 
      @plant.destroy
      flash[:notice] = "Plant gone"
      redirect_to user_plants_path(@user)
    else
      flash[:notice] = "Try Again"
      redirect_to user_plants_path(current_user)
    end
  end

  def index
    @plants = @user.plants
  end

  def show

    # @plant = @user.plants.find(params[:id])
      # @plant = Plant.find(params[:id])

    plant_user_valid?

    render 'plants/show', :layout => false
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

  def set_plant
    @plant = Plant.find_by_id(params[:id])
     if !@plant 
      flash[:notice] = "Try Again"
      redirect_to user_plants_path(current_user)
     end
  end

  def plant_user_valid?
    unless @plant.user_id == current_user.id
      flash[:notice] = "Unauthorized"
      redirect_to user_plants_path(current_user)
    end
  end


  
end
