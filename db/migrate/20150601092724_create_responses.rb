class CreateResponses < ActiveRecord::Migration
  def change
  	create_table :responses do |response|
  		response.belongs_to :user
  		response.belongs_to :question
      response.belongs_to :choice
  		response.timestamps
  	end
  end
end
