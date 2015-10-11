class SubmissionController < ApplicationController
   belongs_to :user
   has_many :edits
end
