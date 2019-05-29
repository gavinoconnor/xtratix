class Venue < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  validates :name, presence: true

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
      else
        all
      end
  end


end
