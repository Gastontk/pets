class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    # render plain: Pet.find(params[:id])
    @pet = Pet.find(params[:id])
    # render plain: @pet.name
  end

  def new
    @pet = Pet.new
  end

  def create

    # render plain: params[:pet][:name]
    # render plain: params
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to '/pets/index'
    # render plain: @pet.name

  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to '/pets/index'

  end

  def destroy
    @pet = Pet.find(params[:format])
    if @pet.destroy
      session[:flash] =@pet.name + " Euthanized"
    else
      render plain: @pet.name
    end
  end


  private
    def pet_params
      params.require(:pet).permit(:name, :breed)
    end
end
