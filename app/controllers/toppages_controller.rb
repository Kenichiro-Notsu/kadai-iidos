class ToppagesController < ApplicationController
  def index
    if logged_in?
    redirect_to '/nodes'
    end
  end
end
