class Venue < ApplicationRecord
  has_many :tickets
  has_many :users, through: :tickets

  def self.search(search)
    if search
      venue = Venue.find_by(name: search)
      if venue
        self.where(name: venue)
      else
        Venue.all
      end
    end
    Venue.all
  end
end
