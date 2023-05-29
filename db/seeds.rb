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
    skill = Skill.create!(content: "pathway #{i + 1} skill #{i * 1 + j}")
    Recording.create!(bucket:, recordable: skill, parent_id: recording.id)
  end
end

pathway3 = Pathway.create!(subject: "pathway 3", content: "pathway 3 - Mixing skills of other pathways")
recording_msg3 = Recording.create!(bucket:, recordable: pathway3)

# pathway 3 shares the same first skill with pathway 1
pathway1 = Pathway.first
skill1 = pathway1.recordings.sole.children.first.skill
Recording.create!(bucket:, recordable: skill1, parent_id: recording_msg3.id)

# pathway 3 shares the same third skill with pathway 1
pathway2 = Pathway.second
skill3 = pathway2.recordings.sole.children.first.skill
Recording.create!(bucket:, recordable: skill3, parent_id: recording_msg3.id)

# account_dev has the same project as the
account_dev = Account.create!(name: "dev@abc.co")
bucket_dev = Bucket.create!(account: account_dev, bucketable: project)

pathway4 = Pathway.new(subject: "pathway 4", content: "pathway 4 - hi there!")
bucket_dev.record(pathway4)
# recording_msg4 = Recording.create!(bucket: bucket_dev, recordable: pathway4)

pathway2 = Pathway.second
skill2 = pathway2.recordings.sole.children.second.skill
bucket_dev.record(skill2, parent: pathway4.recordings.sole)
# Recording.create!(bucket: bucket_dev, recordable: skill2, parent_id: recording_msg4.id)
