class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  include Roleable

  validates :first_name, :last_name,
            :id_number, :role, presence: true
  validates :id_number, uniqueness: true

  has_many :articles
  has_many :registries

end
