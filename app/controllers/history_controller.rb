class HistoryController < ApplicationController
  def index
    @operations = Operation.order(updated_at: :desc).all

#    I18n.t("enums.operation.operation_type.#{o.operation_type}")
  end
end
