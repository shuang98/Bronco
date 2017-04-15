class User < ApplicationRecord
	has_many :courses
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_secure_password
	validates :username, presence: true, length: {minimum: 5}, uniqueness: true
	validates :password, length: { in: 6..20 }
	validates_email_format_of :email, :message => 'must be a valid email'
	validates :email, uniqueness: true

end
