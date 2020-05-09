class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 before_create :set_default_username
    def set_default_username
        self.username = self.email.split('@')[0] if self.email
    end
    has_and_belongs_to_many :items
end
