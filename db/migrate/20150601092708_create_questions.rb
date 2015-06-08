class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |question|
  		question.text :question_desc
  		question.belongs_to :survey
  		question.timestamps
  	end
  end
end
