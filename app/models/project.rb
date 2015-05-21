class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  validates :title, presence: true, length: {minimum: 3}
end
