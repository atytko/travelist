class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :login
 
    def login
        if(user_signed_in?)
            redirect_to notes_path
        end
    end
end
