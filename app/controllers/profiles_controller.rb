class ProfilesController < ApplicationController
  def show
	 @user = User.find(params[:id])
  end

   def not_found
    raise ActionController::RoutingError.new('User Not Found')
   end
end
