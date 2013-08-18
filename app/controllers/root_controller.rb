class RootController < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def index
  end

  def home
    @user = User.new
  end
end
