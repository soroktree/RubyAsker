class Commentanswer < ApplicationRecord
  include Authorship
  belongs_to :answer
end
