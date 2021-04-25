class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :operations
  
  def create_node(node_params)
    node = Node.new(node_params)
    node.save
    operation = self.operations.build(node: node, operation_type: :create_node)
    operation.save
  end
  
  def update_node(node, node_params)
    node.update(node_params)
    operation = self.operations.build(node: node, operation_type: :update_node)
    operation.save
  end
  
  def delete_node(node)
    node.update(deleted: true)
    operation = self.operations.build(node: node, operation_type: :delete_node)
    operation.save
  end
end
