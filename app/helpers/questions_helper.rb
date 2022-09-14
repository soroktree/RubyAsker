module QuestionsHelper
    def user_name_or_email(question)
        if question.user.name.present?
            question.user.name
        else
            question.user.email.split('@')[0]
        end
    end
end
