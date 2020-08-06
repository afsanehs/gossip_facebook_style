module SessionsHelper
    def current_user
        User.find_by(id: session[:user_id])
    end
    def log_in(user)
        session[:user_id] = user.id
    end
    #rajouter if current_user ou oder une méthode logged_in? dans le helper. Cette méthode te retournerait true si session[:user_id] est non-nil et false dans le cas contraire.
end
