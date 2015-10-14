class EditsController < ApplicationController

   def new
      id = params[:id]
      @submission = Submission.find(id)
      @author = User.find(@submission.user_id)
      @editor = current_user
      @edit = Edit.new
      render :new
   end

   def create
      p params
   end

   def destroy
   end

end


# create reference (from submissions controller)
# subInfo = params.require(:submission).permit(:title, :content, :genre, :summary)
# @user = current_user
# @submission = Submission.new(subInfo)
# if @submission.save
#    @user.submissions << @submission
#    redirect_to "/users/#{@user.id}"
# else
#    render :new
# end
