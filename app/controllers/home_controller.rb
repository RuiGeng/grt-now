class HomeController < ApplicationController
  # Create by Rui Geng
  skip_before_filter :authenticate_user!
  def index
  end
end