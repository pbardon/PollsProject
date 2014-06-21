# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  
  belongs_to(
            :answer_choice,
            class_name: "AnswerChoice",
            foreign_key: :answer_choice_id,
            primary_key: :id
            )
            
  belongs_to(
            :respondent,
            class_name: "User",
            foreign_key: :user_id,
            primary_key: :id
            )
            
  
            
  delegate :question, :to => :answer_choice
  # delegate :poll, :to => :question
#   delegate :author, :to => :poll
#
  
            
  validates(:user_id, presence: true)
  validates(:answer_choice_id, presence: true)
  validate :respondent_has_not_already_answered_question
       
       
  def respondent_has_not_already_answered_question
    if existing_responses.empty?
      return true 
    elsif existing_responses.length == 1 && existing_responses.first.id == self.id
      return true
    else
      errors[:user_id] << "question has already been answered"
      return false
    end
  end 
  
  
  def author_cant_respond_to_own_poll
    if self.respondent == self.answer_choice.question.poll.author
      errors[:respondent] << "cant respond to own poll" 
    end
  end
  
  def existing_responses
    self.question.responses
    
    
    
    
    # has_many :zs, through: :ys, source: :x
    # has_one :z, through: y, source: :x
    
    ## 1. response -> answer_choice, answer_choice -> question (BT)
    ## 2. question -> answer_choices, answer_choice -> responses (HM)
    # 3. HMT question -> responses, HOT response -> question

    # 4. self.question.responses
    # This does involve two queries.
    
       # #
    # question_id = Response.find_by_sql([
    #                                     "SELECT
    #                                       question_id
    #                                     FROM
    #                                       answer_choices
    #                                     WHERE
    #                                       answer_choices.id = 2"
    #                                 #    self.answer_choice_id
    #                                   ]
    #                                   )
    #
    #                                   print question_id
    #
    #
    #
    # Response.joins(:answer_choice)
    #         .where("responses.user_id = ? AND responses.question_id = ?",
    #          self.user_id, question_id
    #          )
  end     
end
