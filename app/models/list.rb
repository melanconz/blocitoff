class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

  enum permissions: [ :not_public, :public ]  


end
