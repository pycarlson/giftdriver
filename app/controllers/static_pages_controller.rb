class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def about
  end

  def faq
  end

  def home
  end

  def how_it_works
  end
end
