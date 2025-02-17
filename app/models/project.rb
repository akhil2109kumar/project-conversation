class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy
end
