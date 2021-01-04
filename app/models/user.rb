class User < ApplicationRecord

    has_secure_password

    validates :first_name, :last_name, :username, :password, presence: true
    validates :first_name, format: { with: /\A([a-zA-Z]|-){2,30}\Z/, message: "only allows letters or hyphens."}
    validates :last_name, format: { with: /\A([a-zA-Z]|-){2,30}\Z/, message: "only allows letters or hyphens."}
    validates :username, uniqueness: true
    validates :username, format: { with: /\A\w{6,30}\Z/, message: "allows 6-30 characters - using only letters, numbers, and underscores(_)."}
    validates :password, format: { with: /\A\S{5,15}\Z/, message: "allows 5-15 characters."}

    def full_name
        "#{first_name} #{last_name}"
    end
    
end