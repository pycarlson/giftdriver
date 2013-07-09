class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def about
  end

  def team
  end

  def home
    @drives = Drive.all
    render layout: 'home'
  end
end
