class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true, uniqueness: true
    validates :last_name,  presence: true, uniqueness: true
    validates :email,      presence: true, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    has_many :recipes, :dependent => :destroy
    has_many :cuisine, :dependent => :destroy

    def editor?
        self.role == 'editor'
    end

    def admin?
        self.role == 'admin'
    end
end
