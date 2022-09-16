class Answer < ApplicationRecord
  has_many :commentanswers
  belongs_to :question
  belongs_to :user

  validates :body, presence: true, length: {minimum: 2}
  
  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end
end
