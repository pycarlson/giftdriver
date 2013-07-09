class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def about
  end

  def team
  end

  def home
    return redirect_to drives_path if user_signed_in?
    render layout: 'home'
  end
end
