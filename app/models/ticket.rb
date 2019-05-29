class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  def std_date
  event_date.strftime('%B %d, %Y at %H:%M')
 end
end
