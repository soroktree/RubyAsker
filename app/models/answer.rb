class Answer < ApplicationRecord
  include Commentable
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: {minimum: 2}
  
  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end
end
