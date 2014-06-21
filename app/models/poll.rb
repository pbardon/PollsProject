# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  author_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Poll < ActiveRecord::Base
  
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many(
    :questions,
    class_name: "Question",
    foreign_key: :poll_id,
    primary_key: :id
  )
  
  # has_many :answer_choices, :through => :questions, :source => :answer_choices
 #  has_many :responses, :through => :answer_choices, :source => :responses
  
  validates(:title, presence: true, uniqueness: true)
  validates(:author_id, presence: true)
  
end
