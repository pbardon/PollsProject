# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  has_many(
    :polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many :questions, :through => :polls
  
  has_many(
    :responses,
    class_name: "Response", 
    foreign_key: :user_id,
    primary_key: :id
  )

  validates(:user_name, presence: true, uniqueness: true)
  
end