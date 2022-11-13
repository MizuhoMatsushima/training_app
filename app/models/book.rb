class Book < ApplicationRecord
  has_many :tags, through: :middle_of_tags
  has_many :middle_of_tags, dependent: :destroy

  def save_tag(sent_tags)
    unless self.tags.nil?
      current_tags = self.tags.pluck(:name)
    end
    new_tags = sent_tags - current_tags
    new_tags.each do |new|
      new_book_tag = Tag.find_or_create_by(name: new)
      self.tags << new_book_tag
    end
  end

end