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
  pathway = Pathway.create!(subject: "pathway #{i + 1}", content: "hello world #{i + 1}")
  recording = Recording.create!(bucket:, recordable: pathway)

  2.times do |j|
    comment = Comment.create!(content: "pathway #{i + 1} comment #{i * 1 + j}")
    Recording.create!(bucket:, recordable: comment, parent_id: recording.id)
  end
end

pathway3 = Pathway.create!(subject: "pathway 3", content: "pathway 3 - Mixing comments of other pathways")
recording_msg3 = Recording.create!(bucket:, recordable: pathway3)

# pathway 3 shares the same first comment with pathway 1
pathway1 = Pathway.first
comment1 = pathway1.recordings.sole.children.first.comment
Recording.create!(bucket:, recordable: comment1, parent_id: recording_msg3.id)

# pathway 3 shares the same third comment with pathway 1
pathway2 = Pathway.second
comment3 = pathway2.recordings.sole.children.first.comment
Recording.create!(bucket:, recordable: comment3, parent_id: recording_msg3.id)

# account_dev has the same project as the
account_dev = Account.create!(name: "dev@abc.co")
bucket_dev = Bucket.create!(account: account_dev, bucketable: project)

pathway4 = Pathway.new(subject: "pathway 4", content: "pathway 4 - hi there!")
bucket_dev.record(pathway4)
# recording_msg4 = Recording.create!(bucket: bucket_dev, recordable: pathway4)

pathway2 = Pathway.second
comment2 = pathway2.recordings.sole.children.second.comment
bucket_dev.record(comment2, parent: pathway4.recordings.sole)
# Recording.create!(bucket: bucket_dev, recordable: comment2, parent_id: recording_msg4.id)
