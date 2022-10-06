class Vote
    include Mongoid::Document
    include Mongoid::Timestamps

    belongs_to :votable, polymorphic: true
    belongs_to :voter, polymorphic: true

    validates_presence_of :votable_id
    validates_presence_of :voter_id
    validates :voter_id, uniqueness: { scope: [:votable_id] }
end
