class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # render plain: params
    @owner = User.find_by_id(params[:id])
    # render plain: @owner.first_name
    @owner_pet =@owner.pets
    # if @owner_pet.exists?
    #   render plain: @owner_pet[0].name
    # else
    #   render plain: "This user has no pets :("
    # end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def adopt
    # render plain: params
    @pet = Pet.find_by_id(params[:pet_id])
    # render plain: @pet.name
    # redirect_to 'users/finish_adoption'
    # redirect_to '/finish_adoption'

    # @user = User.find(6)
    # render plain: @user.first_name

    # @pet.user = User.find(6)
    # render plain: @pet.user.first_name

  end
  def finish_adoption
    @user = User.find(params[:pet][:user])
    @pet =Pet.find(params[:pet][:id])

    @pet.user = @user
    @pet.save
    redirect_to pets_path
   end
   def abandon_pet
    @pet = Pet.find(params[:format])
   # render plain: @pet.user.first_name

    @pet.user =nil
    @pet.save
    # render plain: @pet.user.first_name
    redirect_to pets_path

  end
  def danger
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password )
    end
end
