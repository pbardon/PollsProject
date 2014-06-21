# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  
  has_many(
            :answer_choices,
            class_name: "AnswerChoice",
            foreign_key: :question_id,
            primary_key: :id
            )
          
  belongs_to(
            :poll,
            class_name: "Poll",
            foreign_key: :poll_id,
            primary_key: :id
  
            )
            
            
            
  def results
    answers = Hash.new(0)

    answer_choices = self.answer_choices.includes(:responses)
    
    answer_choices.each do |answer_choice|
      answers[answer_choice.answer_choice] =  answer_choice.responses.count
    end
    
    
    answers
  end 
            
  has_many :responses, through: :answer_choices, source: :responses
            
  validates(:body, presence: true)
  validates(:poll_id, presence: true)
end
