class Question < ApplicationRecord
  include Commentable
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M')
  end
end
