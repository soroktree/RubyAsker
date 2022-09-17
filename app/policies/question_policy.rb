class QuestionPolicy < ApplicationPolicy
    def create?
        !user.guest?
    end

    def update?
        can_moderate?
    end

    def destroy?
        user.admin_role? || user.author?(record)
    end

    def index?
      true
    end
  
    def show?
      true
    end

    private 

    def can_moderate? 
        user.admin_role? || user.moderator_role? || user.author?(record)
    end
end