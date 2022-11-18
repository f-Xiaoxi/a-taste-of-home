class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :meals, through: :tags

  validates :name, presence: true, uniqueness: true

  def abbrev(category_name)
    mapping = {
      'Vegetarian' => 'VG',
      'Vegan' => 'V',
      'Halal' => 'H',
      'Gluten-Free' => 'GF',
      'Refined Sugar-Free' => 'NS'
    }
    mapping[category_name]
  end
end
