class ProfileController < ApplicationController
  before_action :find_profile, only: %i[show update edit]

  def update
    if @profile.update(profile_params)
      redirect_to user_profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def find_profile
    @profile = User.find(params[:id]).profile
  end

  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :last_name, :age)
  end
end
