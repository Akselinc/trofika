class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = current_user

    if @user.update_attributes(current_user_params)
      flash[:notice] = "Successfully saved..."    
    else
      flash[:alert] = "Did not update. Something went wrong"
    end

    redirect_to dashboard_path

  end
 
  def dashboard
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = Users.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def current_user_params
      params.require(:user).permit(:about, :location, :status, :language)
    end

end
