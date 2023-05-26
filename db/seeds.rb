# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account = Account.create!(name: "tester@test.co")
project = Project.create!(title: "test project", account:)
bucket = Bucket.create!(account:, bucketable: project)

2.times do |i|
  message = Message.create!(subject: "message #{i}", content: "hello world")
  recording = Recording.create!(bucket:, recordable: message)

  2.times do |j|
    comment = Comment.create!(content: "message #{i} comment #{i}#{j}")
    Recording.create!(bucket:, recordable: comment, parent_id: recording.id)
  end
end

message = Message.create!(subject: "message 3", content: "Mixing")
recording = Recording.create!(bucket:, recordable: message)
Comment.find_each do |comment|
  Recording.create!(bucket:, recordable: comment, parent_id: recording.id)
end
