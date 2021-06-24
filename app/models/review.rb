class Review < ApplicationRecord
  belongs_to :vet
  validates :content, length: { minimum: 20 }
end
