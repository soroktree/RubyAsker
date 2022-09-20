module Rememberable
    extend ActiveSupport::Concern 
    attr_accessor :remember_token

    included do 
        def forget_me 
            update_column :remeber_token_digest, nil
        end

        def remeber_me
            self.remember_token = SecureRandom.urlsafe_base64
            update_column :remember_token_digest, digest(remember_token)
        end
    end
end