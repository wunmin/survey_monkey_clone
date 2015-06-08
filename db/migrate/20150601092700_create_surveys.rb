class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |survey|
  		survey.string :survey_title
  		survey.belongs_to :user
  		survey.timestamps
  	end
  end
end
