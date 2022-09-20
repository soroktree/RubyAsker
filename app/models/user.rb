class User < ApplicationRecord
    include Recoverable
    include Rememberable

    attr_accessor :admin_edit
    enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role 

    has_secure_password
    
    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy

    validates :email, presence: true, uniqueness: true

    def author?(obj)
        obj.user == self 
    end

    def guest?
        false
    end

    def authenticated?(remember_token)
        BCrypt::Password.new(remember_token_digest) == remember_token
    end
        # BCrypt::Password.new(remember_token_digest).is_password?(remember_token)

    private

    def digest(string)
        cost = ActiveModel::SecurePassword.
            min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)    
    end

end
