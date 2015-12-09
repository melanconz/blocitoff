class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :name, presence: true
  validates :list, presence: true
  validates :user, presence: true
end
