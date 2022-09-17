30.times do
    User.create do |user|
        user.name = Faker::Name.first_name
        user.email = Faker::Internet.email
    end
end

#130.times do
    # Answer.create do |answer|
        # answer.body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
        # answer.user_id = User.order('RANDOM()').first.id
        # answer.question_id = Question.order('RANDOM()').first.id
    # end
# end

# 130.times do
#     title = Faker::Hipster.sentence(word_count: 3)
#     body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
#     user_id = User.order('RANDOM()').first.id
#     Question.create title: title, body: body, user_id: user_id
# end

# 30.times do 
#     title = Faker::Hipster.word
#     Tag.create title: title
# end