class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :verify_profile!

  protected
  def verify_profile!
    if user_signed_in?
      return if current_user.profile
      redirect_to new_profile_path
    end
  end
end
