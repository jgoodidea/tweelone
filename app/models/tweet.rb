class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String

  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end
