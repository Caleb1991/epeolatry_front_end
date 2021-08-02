class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :message

  helper_method :current_user, :greetings

  def greetings
    @greetings = ['Salutations', 'Bienvenidos', 'Greetings', 'Hola', 'Excelsior',
                  'Live long and prosper', 'Il saluto', 'Salve', 'May the force be with you',
                  'It was the best of times - it was the worst of times', 'Call me Ishmael',
                  'It is not in the stars to hold our destiny but in ourselves', "All the world's a stage",
                  "Congratulations! Today is your day. You're off to Great Places! You're off and away!"
                  ]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
