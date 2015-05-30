class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: {minimum: 3}
end
