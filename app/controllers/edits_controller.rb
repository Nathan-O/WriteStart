class EditsController < ApplicationController
   before_action :logged_in?, only: [:new]
   require "differ"

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
      editInfo = params.require(:edit).permit(:notes, :line_edits, :user_id, :submission_id)
      subId = editInfo[:submission_id]
      @submission = Submission.find(subId)
      # p editInfo[:line_edits]
      #
      @story = @submission.content
      @edit = editInfo[:line_edits]
      #
      # edit_paragraphs = edit.split('<br />')
      # story_paragraphs = story.split(/[\n]/)
      #
      # p edit_paragraphs
      # p story_paragraphs
      Differ.format = :color
      @diff = Differ.diff_by_word(@edit, @story)
      #@diff.format_as(:color)
      p @diff
      editInfo[:notes] = @diff
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


# FOR NOW I CAN'T FIX THIS, TRY ASKING AROUND TOMORROW!!

# if not done by tomorrow ask Justin:
#
#    Is there a way you and I could sit down for a minute tomorrow and try to figure out (litterally) the last hurdle in my Project 1 revamp?




# //assuming "b" contains a subsequence containing
# //all of the letters in "a" in the same order
# function getDifference(a, b)
# {
#     var i = 0;
#     var j = 0;
#     var result = "";
# ​
#     while (j < b.length)
#     {
#         if (a[i] != b[j] || i == a.length)
#             result += b[j];
#         else
#             i++;
#         j++;
#     }
#     return result;
# }
# ​
# console.log(getDifference("test fly", "test xy flry"));


# def compare(*params)
#    params.sort! {|x,y| y <=> x}
#    diff = params[0].split(' ') - params[1].split(' ')
#    if diff === []
#       true
#    else
#       diff
#    end
# end






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
