class Goal < ApplicationRecord
  belongs_to :user
  has_many :dos, dependent: :destroy
  
  validates :title, presence: true
end
