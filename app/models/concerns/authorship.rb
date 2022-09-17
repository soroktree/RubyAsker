module Authorship
    extend ActiveSupport::Concern 

    included do 
        def autored_by?(user)
            self.user == user
        end
    end
end