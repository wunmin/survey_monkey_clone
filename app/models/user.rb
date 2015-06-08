class User < ActiveRecord::Base
  has_many :surveys
  has_many :questions, through: :surveys
  has_many :responses, through: :user_surveys

  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    if @user == []
      nil
    elsif @user.password == password
      @user
    else
      nil
    end
  end

end
