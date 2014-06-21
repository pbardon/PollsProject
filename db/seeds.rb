# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 
# 
users = User.create!([{ user_name: "user1" },
                      { user_name: "user2" },
                      { user_name: "user3" }])

questions = Question.create!([{ body: "Question # 1", poll_id: 1 },
                              { body: "Question # 2", poll_id: 1 },
                              { body: "Question # 3", poll_id: 1 },
                              { body: "Question # 4", poll_id: 2 }])
                              
polls = Poll.create!([{ title: "This is Poll # 1", author_id: 1 },
                      { title: "This is Poll # 2", author_id: 2 },
                      { title: "This is Poll # 3", author_id: 1 }])
                      
responses = Response.create!([
                            { user_id: 2, answer_choice_id: 2 },
                            { user_id: 1, answer_choice_id: 1 },
                            { user_id: 2, answer_choice_id: 3 },
                            { user_id: 3, answer_choice_id: 2 },
                            { user_id: 2, answer_choice_id: 3 }])
                              
answer_choices = AnswerChoice.create!([ 
                          { question_id: 1, answer_choice: "Answer choice #1" },
                          { question_id: 1, answer_choice: "Answer choice #2" },
                          { question_id: 1, answer_choice: "Answer choice #3" },
                          { question_id: 2, answer_choice: "Answer choice #1" },
                          { question_id: 2, answer_choice: "Answer choice #2" },
                          { question_id: 2, answer_choice: "Answer choice #3" },
                          { question_id: 3, answer_choice: "Answer choice #1" },
                          { question_id: 3, answer_choice: "Answer choice #2" },
                          { question_id: 3, answer_choice: "Answer choice #3" },
                          { question_id: 4, answer_choice: "Answer choice #1" },
                          { question_id: 4, answer_choice: "Answer choice #2" },
                          { question_id: 4, answer_choice: "Answer choice #3" }])
