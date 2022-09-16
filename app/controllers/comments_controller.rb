class CommentsController < ApplicationController
    include QuestionsAnswers 

    def create 
        @comment = @commentable.comments.build comment_params 
       if @comment.save 
           flash[:success] = "Your comment successfully added!"
           redirect_to @commentable
       else
           @comment = @comment.decorate
           load_question_answers do_render: true
       end
    end

    private 

    def comment_params 
       params.require(:comment).permit(:body).merge(user: current_user) 
    end

end