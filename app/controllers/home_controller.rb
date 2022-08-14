class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.profile
        redirect_to statuses_url
      else
        redirect_to new_profile_url
      end
    end

    unless user_signed_in? or admin_signed_in?
      redirect_to new_user_session_url
    end
  end
end
