class HomeController < ApplicationController
  before_action :authenticated_user!
  def index
  end
end
