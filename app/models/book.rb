class Book < ApplicationRecord
  has_many :tags, through: :middle_of_tags
  has_many :middle_of_tags, dependent: :destroy
end
