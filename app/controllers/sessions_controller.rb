class SessionsController < Devise::SessionsController
  def create
    super do |user|
      # user=User.find_by(email:params["email"]).try(:authenticate,params["email"]["password"])
      if user.active != false
        super
        if current_user
          break
        end
      else
        reset_session
        @_current_user = session[:current_user_id] = nil

        break
      end
    end
  end
end
