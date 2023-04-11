class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # has_secure_password

    has_and_belongs_to_many :products

    def admin?
        admin
    end

    def generate_jwt
        JWT.encode({ id: self.id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
    end

    # attr_reader :password_digest
end
