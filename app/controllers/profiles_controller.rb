class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.create_profile(profile_params)
    if @profile.save
      flash[:notice] = "Profile Saved"
      redirect_to profiles_path
    else
      flash[:error] = "Error Saving Profile"
      render action: :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      flash[:notice] = "Profile Saved"
      redirect_to profiles_path
    else
      flash[:error] = "Error Saving Profile"
      render action: :edit
    end
  end

  def destroy
    @profile = current_user.profile
    if @profile.destroy
      flash[:notice] = "Profile Removed"
    else
      flash[:error] = "Error Removing Profile"
    end
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :website, :twitter, :git_app,
                                    :crud_project, :api_project, :tested_project,
                                    :why, :goals)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
