class CreateChoices < ActiveRecord::Migration
  def change
  	create_table :choices do |choice|
  		choice.text :choice_desc
  		choice.belongs_to :question
  		choice.timestamps
  	end
  end
end
