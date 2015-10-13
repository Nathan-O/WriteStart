class SubmissionsController < ApplicationController
   before_action :logged_in?, only: [:new]

   def new
      @user = current_user
      @submission = Submission.new
   end

   def create
      subInfo = params.require(:submission).permit(:title, :content, :genre, :summary)
      @user = current_user
      @submission = Submission.new(subInfo)
      if @submission.save
         @user.submissions << @submission
         redirect_to "/users/#{@user.id}"
      else
         render :new
      end
   end


   def show
   end

   def edit
   end

   def update
   end

   def destroy
   end

end
