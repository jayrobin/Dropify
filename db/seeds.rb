# User.delete_all
Message.delete_all
Comment.delete_all
Vote.delete_all

class UserSeeder
  def self.seed(number_of_users)
    number_of_users.times {
      User.create(
        username: Faker::Internet.user_name,
        email: Faker::Internet.email,
        password: 'password',
        password_confirmation: 'password'
        )}
  end
end

class MessageSeeder
  def self.seed(messages_per_user)
    User.all.each do |user|
      messages_per_user.times {
        user.messages.create(
          content: Faker::Lorem.sentence,
          latitude: 37.7806647 + rand() / 100,
          longitude: -122.4066077 + rand() / 100
          )}
    end
  end
end

class CommentSeeder
  def self.seed(comments_per_message)
    Message.all.each do |message|
      comments_per_message.times {
        message.comments.create(
          content: Faker::Lorem.sentence,
          user_id: rand(5) + 1
          )}
    end
  end
end

class VotesSeeder
  def self.seed(votes_per_post)
    Message.all.each do |message|
      votes_per_post.times {message.votes.create(value: [-1, 1].sample)}
    end

    Comment.all.each do |comment|
      votes_per_post.times {comment.votes.create(value: [-1, 1].sample)}
    end
  end
end

UserSeeder.seed(5)
MessageSeeder.seed(10)
CommentSeeder.seed(2)
VotesSeeder.seed(2)

