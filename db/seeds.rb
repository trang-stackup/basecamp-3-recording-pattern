# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account_test = Account.create!(name: "test@abc.co")
project = Project.create!(title: "abc project", account: account_test)
bucket = Bucket.create!(account: account_test, bucketable: project)

2.times do |i|
  message = Message.create!(subject: "message #{i + 1}", content: "hello world #{i + 1}")
  recording = Recording.create!(bucket:, recordable: message)

  2.times do |j|
    comment = Comment.create!(content: "message #{i + 1} comment #{i * 1 + j}")
    Recording.create!(bucket:, recordable: comment, parent_id: recording.id)
  end
end

message3 = Message.create!(subject: "message 3", content: "message 3 - Mixing comments of other messages")
recording_msg3 = Recording.create!(bucket:, recordable: message3)

# message 3 shares the same first comment with message 1
message1 = Message.first
comment1 = message1.recordings.sole.children.first.comment
Recording.create!(bucket:, recordable: comment1, parent_id: recording_msg3.id)

# message 3 shares the same third comment with message 1
message2 = Message.second
comment3 = message2.recordings.sole.children.first.comment
Recording.create!(bucket:, recordable: comment3, parent_id: recording_msg3.id)

# account_dev has the same project as the
account_dev = Account.create!(name: "dev@abc.co")
bucket_dev = Bucket.create!(account: account_dev, bucketable: project)

message4 = Message.new(subject: "message 4", content: "message 4 - hi there!")
bucket_dev.record(message4)
# recording_msg4 = Recording.create!(bucket: bucket_dev, recordable: message4)

message2 = Message.second
comment2 = message2.recordings.sole.children.second.comment
bucket_dev.record(comment2, parent: message4.recordings.sole)
# Recording.create!(bucket: bucket_dev, recordable: comment2, parent_id: recording_msg4.id)
