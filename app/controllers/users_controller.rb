class UsersController < ApplicationController
    # def show
    #     redirect_to '/'
    # end
    # def user_params
    #     params.require(:user).permit(:email, :password)
    # end
    
    # def login
    #     email = params['user']['email']
    #     user = User.find_by(:email => email)
    #     if user
    #         if user.password != params['user']['password']
    #             flash[:warning] = 'Incorrect password.'
    #             redirect_to '/login'
    #         else
    #             session[:user] = user.id
    #             flash[:notice] = 'Login successful.'
    #             redirect_to '/'
    #         end
    #     else
    #         flash[:warning] = 'Invalid email.'
    #         redirect_to '/login'
    #     end
    # end
end
