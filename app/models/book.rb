class Book < ApplicationRecord
  has_many :tags, through: :middle_of_tags
  has_many :middle_of_tags, dependent: :destroy
  accepts_nested_attributes_for :middle_of_tags, allow_destroy: true
end
