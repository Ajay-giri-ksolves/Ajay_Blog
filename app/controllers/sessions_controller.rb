class SessionsController < Devise::SessionsController
  def new
    super
  end
  def create
    super do |user|
      # user=User.find_by(email:params["email"]).try(:authenticate,params["email"]["password"])
      if user.active != false
        super
        if current_user
          break
        end
      else
        flash.now[:alert]="User marked inactive. contact admin."
        reset_session
        @_current_user = session[:current_user_id] = nil
        redirect_to '', notice:'Cannot login. please contact admin'


        break
      end
    end
  end
end
