class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :comments
  has_many :status_changes
end
