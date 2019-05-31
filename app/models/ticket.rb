class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  def std_date
  event_date.strftime('%B %d, %Y')
 end

 def self.search(term)
   if term
     where('artist_name LIKE ?', "%#{term}%")
     else
       all
     end
 end

end
