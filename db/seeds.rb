# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account = Account.create!(name: "test@abc.co")
Community.create!(title: "community 1")
Community.create!(title: "community 2")

num = 2
last_idx = num - 1
num.times do |i|
  pathway = Pathway.create!(subject: "pathway #{i + 1}", content: "hello world #{i + 1}")
  pathway_recording = Recording.create!(account:, recordable: pathway)

  num = 1 if i == last_idx

  num.times do |j|
    skill = Skill.create!(content: "skill #{i * j + 1}")
    skill_recording = Recording.create!(account:, recordable: skill)

    Edge.create!(source_id: pathway_recording.id, dest_id: skill_recording.id)

    Relationship.create!(source: pathway, dest: skill)

    if i == last_idx
      Edge.create!(source_id: Recording.first.id, dest_id: skill_recording.id)

      Relationship.create!(source: Pathway.first, dest: skill)
    end

    num.times do |k|
      learning_module = LearningModule.create!(title: "module #{i * j * k + 1}")
      learning_module_recording = Recording.create!(account:, recordable: learning_module)

      Edge.create!(source_id: skill_recording.id, dest_id: learning_module_recording.id)

      Relationship.create!(source: skill, dest: learning_module)
    end
  end
end
