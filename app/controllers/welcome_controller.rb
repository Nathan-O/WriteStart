class WelcomeController < ApplicationController

   def index
      @submissions = Submission.all
      render :index
   end

end
