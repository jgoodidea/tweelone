class User
    include ActiveModel::SecurePassword

    include Mongoid::Document
    include Mongoid::Timestamps
    field :username, type: String
    field :email, type: String
    field :password_digest, type: String

    has_secure_password

    has_many :tweets

    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    before_save { self.email = email.downcase }
end
