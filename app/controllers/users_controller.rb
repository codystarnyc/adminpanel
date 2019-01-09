class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :delete, :destroy]
  
  
  
  def show

  end

  def edit
 
  end

  def index
    @users = User.all
  end



# PATCH/PUT /students/1
# PATCH/PUT /students/1.json
def update
  respond_to do |format|
    if @users.update(user_params)
      format.html { redirect_to @student, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @student }
    else
      format.html { render :edit }
      format.json { render json: @users.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @users.destroy
  respond_to do |format|
    format.html { redirect_to userts_url, notice: 'Users was successfully destroyed.' }
    format.json { head :no_content }
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :admin)
    end
end
