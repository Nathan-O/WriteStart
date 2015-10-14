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

      #subId = params[:submission_id]
      @user = current_user
      editInfo = params.require(:edit).permit(:line_edits, :user_id, :submission_id)

      subId = editInfo[:submission_id]
      p subId
      @submission = Submission.find(subId)
      @edit = Edit.new(editInfo)
      if @edit.save
         redirect_to "/submissions/#{@submission.id}"
      else
         render :new
      end
   end

   def show
      @edit = Edit.find(params[:id])
      @submission = @edit.submission
      @author = @submission.user
      @editor = @edit.user
   end

   def destroy
   end

end


# create reference (from submissions controller)
#
# editInfo = params.require(:edit).permit(:line_edits)
# @user = current_user
# @edit = Edit.new(editInfo)
# if @submission.save
#    @user.edits << @user
#    @submission.edits << @submission
#    redirect_to "/submissions/#{@submission.id}"
# else
#    render :new
# end

# @edit.user << @user
# @edit.submission << @submission
#@user.edits << @user
#@submission.edits << @submission
