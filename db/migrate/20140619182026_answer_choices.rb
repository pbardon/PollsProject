class AnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :answer_choice, null: false
      
      t.timestamps
    end
    
    add_index(:answer_choices, :question_id)
  end
end
