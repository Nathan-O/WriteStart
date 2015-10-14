class SubmissionsController < ApplicationController
   before_action :logged_in?, only: [:new]

   def index
      @submissions = Submission.all
      render :index
   end

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
      @submission = Submission.find(params[:id])
      @author = User.find(@submission.user_id)
      @user = current_user
      render :show
   end

   def edit
   end

   def update
   end

   def destroy
   end

end
