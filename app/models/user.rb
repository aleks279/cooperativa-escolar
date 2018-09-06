class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  include Roleable

  validates :first_name, :last_name, :role, presence: true
  validates :id_number, uniqueness: true

end
