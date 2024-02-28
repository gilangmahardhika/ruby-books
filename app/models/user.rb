class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :email, presence: true, email: true

  ## Devise override login with email or username
  def self.find_for_database_authentication(conditions={})
    find_by(username: conditions[:email]) || find_by(email: conditions[:email])
  end
end
