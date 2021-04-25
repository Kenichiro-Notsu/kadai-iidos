class Operation < ApplicationRecord
  belongs_to :user
  belongs_to :node
  
  enum operation_type: { create_node: 0, update_node: 1, delete_node: 2 }
end
