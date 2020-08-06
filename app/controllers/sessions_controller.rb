class SessionsController < ApplicationController
    include SessionsHelper
    # before_action :authenticate_user, only: [:index]
    
    # on code quelque chose qui permet d'afficher le dashboard de l'utilisateur
    # def index
        
    # end

        #new correspond à la page de login
        def new
            @user=User.new
            # @user = User.create(params.require(:user).permit(:username,        
            # :password))
            # session[:user_id] = @user.id
            # redirect_to '/welcome'
        end
    
        #create effectue l'authentification (traitement des informations saisies dans la page login et sauvegarde de l'info de l'utilisateur connecté dans session)
        def create
            # cherche s'il existe un utilisateur en base avec l’e-mail
            user = User.find_by(email: params[:user][:email])
            # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                # redirige où tu veux, avec un flash ou pas
                flash.now[:success] = 'Welcome!'
                redirect_to gossips_path
            else
                @user=User.new
                flash.now[:info] = 'Invalid email/password combination'
                render 'new'
            end
        end
    
        #destroy correspond au logout
        def destroy
            # session.delete(:user_id)
            session[:user_id] = nil
            #redirect_to accueil_path
            flash.now[:info] = 'goodbye :('
            redirect_to gossips_path
        end 
    
    private
    
    # def authenticate_user
    #     unless current_user
    #         flash[:info] = "Please log in."
    #         redirect_to new_session_path
    #     end
    # end

end
