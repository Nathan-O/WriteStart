class EditsController < ApplicationController

   def new
      p params
      id = params[:id]
      @submission = Submission.find(id)
      @edit = Edit.new
      render :new
   end
end
