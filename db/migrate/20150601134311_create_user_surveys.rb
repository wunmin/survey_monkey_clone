class CreateUserSurveys < ActiveRecord::Migration
  def change
    create_table :user_surveys do |user_survey|
      user_survey.belongs_to :user
      user_survey.belongs_to :survey
      user_survey.timestamps
    end
  end
end
