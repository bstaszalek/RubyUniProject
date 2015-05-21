class Ticket < ActiveRecord::Base
  belongs_to :project
  vaildates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :priority, presence: true
end
