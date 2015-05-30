class Ticket < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :priority, presence: true
  
end
