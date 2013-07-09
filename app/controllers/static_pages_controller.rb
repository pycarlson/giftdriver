class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def about
  end

  def team
  end

  def home
    # @drive 
    # @drives = Drive.all
  end
end
