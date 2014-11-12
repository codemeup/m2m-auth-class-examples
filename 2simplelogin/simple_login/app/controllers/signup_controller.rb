class SignupController < ApplicationController

  #note the signup controller is inheriting from application controller, the big parent. So remember DRY - if you're using code across diff controllers use the application controller. 
  before_action :confirm_logged_in, only: [:home]
  before_action :prevent_login_signup, only: [:signup, :login]
  #the above specifies the actions below which apply to certain pages so the top, the action confirm_logged_in applies to the homepage


  def login

  end
  def signup
    @user = User.new
  end

  def home
  end

  def logout

  end

  def attempt_login
      if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if !found_user
      flash.now[:alert] = "Invalid username"
      render :login
    elsif !authorized_user
      flash.now[:alert] = "Invalid password"
    else
      session[:user_id] = authorized_user.id
      flash[:success] = "You are now logged in."
      redirect_to home_path
    end
  end

  #note the syntax !found_user = there is no user found, rather than using != as I attempted below!

  #     if params[:username].present? && params[:password].present?
  #     found_user = User.where(username: params[:username]).first
  #     if found_user === authorized_user &&
  #       authorized_user = found_user.authenticate(params[:password])
  #       flash[:notice] = "You have successfully logged in"
  #       redirect_to home_path
  #     else
  #       found_user != authorized_user
  #       flash[:notice] = "You are not currently an authorized user"
  #       render :signup
  #     end
  #   end
  # end


  def create
      @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully created a new user"
      redirect_to home_path
    else
      render :signup
      #we explicitly choose to render the signup page rather than redirecting because we don't want to show errors in a flas message - it'd be too long
      #when we render it again it's storing the user and saving that instance of a user, because we have the instance variable on the signup page
    end
  end

  private
  def user_params
    #this stops users putting in params that are disallowed. this is v important for security. 
    params.require(:user).permit(:username, :password, :password_digest)
  end

  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

  def prevent_login_signup
    
  end





  
end
