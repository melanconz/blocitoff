class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: {in: 1..70}
  validates :user_id, presence: true
  
end
