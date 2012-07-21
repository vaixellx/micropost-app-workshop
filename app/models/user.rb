class User < ActiveRecord::Base
  has_many :relationships, :foreign_key => :follower_id
  has_many :following_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :class_name => "Relationship", :foreign_key => :followed_id
  has_many :follower_users, :through => :reverse_relationships, :source => :follower
  has_many :microposts

  acts_as_authentic

  validates :name, :presence => true
  validates :email, :presence => true

end
