class User < ApplicationRecord
  include Roleable

  validates :first_name, :last_name,
            :id_number, :role, presence: true

end
