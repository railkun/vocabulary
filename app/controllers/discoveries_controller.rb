class DiscoveriesController < ApplicationController
  before_action :authenticate_user!

  def users
    @users = User.all
  end
end
