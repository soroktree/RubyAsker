class Commentquestion < ApplicationRecord
  include Authorship
  belongs_to :question
end
