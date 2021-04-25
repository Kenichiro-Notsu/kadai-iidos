class Node < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :kind, presence: true, length: { maximum: 30 }
  validates :ipaddress, presence: true, length: { maximum: 30 }
  validates :hostname, presence: true, length: { maximum: 30 }

  has_many :operations
end
