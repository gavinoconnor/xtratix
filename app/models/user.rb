class User < ApplicationRecord
  include Filterable
  has_secure_password
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :tickets
  has_many :venues, through: :tickets

  def self.search(term)
    if term
      where('username LIKE ?', "%#{term}%")
      else
        all
      end
  end

end
