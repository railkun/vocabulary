class LandingsController < ApplicationController
  layout "landing"
    def index
      if user_signed_in?
        redirect_to words_path
      end

    end
    
end
