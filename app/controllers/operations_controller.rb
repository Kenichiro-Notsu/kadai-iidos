class OperationsController < ApplicationController
  def index
    @operations = Operation.order(updated_at: :desc).all
  end
end
