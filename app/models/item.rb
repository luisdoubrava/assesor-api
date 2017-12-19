class Item < ApplicationRecord
  belongs_to :language
  has_many :translations, class: 'Item'
end
