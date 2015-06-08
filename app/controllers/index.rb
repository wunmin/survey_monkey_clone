enable :sessions

get '/' do
	if !session[:id].nil?
		@surveys = Survey.all
		redirect to "/surveys"
	else
		# No session found
		erb :index
	end
end

# User authentication or creation
post "/login" do
	@user = User.find_or_create_by(params[:user])
	# @user will be nill or an User object
	@user = User.authenticate(params[:user][:username], params[:user][:password])
	if @user == nil
		redirect to("/")
	else
		session[:id] = @user.id
		redirect to("/surveys")
	end
end

# List all surveys
get "/surveys" do
	@surveys = Survey.all
	erb :surveys
end

# Display page to create new survey
get '/surveys/new' do
	erb :survey_new
end

# Create new survey
post '/surveys' do
	@survey_title = params[:survey][:survey_title]
	@new_survey = Survey.create(survey_title: @survey_title, user_id: session[:id]
		)

	@questions = params[:questions]
	@questions.each do |question, value|
		@question_desc = value[:question_desc]
		@new_question = Question.create(question_desc: @question_desc, survey_id: @new_survey.id)

		value[:choices].each do |choice, value|
			@choice_desc = value
			@new_choice = Choice.create(choice_desc: @choice_desc, question_id: @new_question.id)
		end
	end

	redirect to "/surveys/#{@new_survey.id}"
end

# Get page for one particular survey
get "/surveys/:survey_id" do
	@survey = Survey.find(params[:survey_id])
	erb :survey
end

# Answer survey
post '/surveys/:survey_id' do
	@user_id = session[:id]
	@questions = params[:survey][:question]

	UserSurvey.create(user_id: @user_id, survey_id: params[:survey_id])
	@questions.each do |question, value|
		@question_id = question
		@choice_id = value[:choices]
		@new_response = Response.create(user_id: @user_id, question_id: @question_id, choice_id: @choice_id)
	end
	redirect to "/surveys"
end


# Display results for one particular survey
get "/surveys/:survey_id/results" do
	@survey = Survey.find(params[:survey_id])
	erb :survey_results
end

# Logout and clear session
get "/logout" do
	session.clear
	redirect to "/"
end




