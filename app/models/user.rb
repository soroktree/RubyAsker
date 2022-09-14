class User < ApplicationRecord
    attr_accessor :remember_token

    has_secure_password
    
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy

    validates :email, presence: true, uniqueness: true

    def remeber_me
        self.remember_token = SecureRandom.urlsafe_base64
        update_column :remember_token_digest, digest(remember_token)
    end

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_token_digest) == remember_token
    end
        # BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
    def forget_me 
        update_column :remeber_token_digest, nil
    end

    private

    def digest(string)
        cost = ActiveModel::SecurePassword.
            min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)    
    end


end
