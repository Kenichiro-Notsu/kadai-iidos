class OperationsController < ApplicationController
  def index
    @operations = Operation.order(updated_at: :desc).all.page(params[:page]).per(25)
  end
end
