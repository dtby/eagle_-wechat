class Customer < ActiveRecord::Base
  has_many :machines, dependent: :destroy
  validates :name, presence: true
end
