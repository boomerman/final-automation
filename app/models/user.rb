class User < ApplicationRecord
  enum role: [:student, :guide, :admin, :coordinator]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end

validates :college_roll, :presence => true, :uniqueness => true
validates_length_of :college_roll, :is => 6, :wrong_length => "incomplete"
validates_length_of :uni_roll, :is => 7, :wrong_length => "incomplete"

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  def remove_friend(friend)
    current_user.friends.destroy(friend)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
