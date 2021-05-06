class Book < ApplicationRecord
  belongs_to :author
  validates :author, presence: true, length: {minimum: 3}
  validates :title, presence: true, length: {minimum: 3}
end
