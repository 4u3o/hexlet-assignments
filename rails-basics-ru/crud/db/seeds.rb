# frozen_string_literal: true

require 'faker'

20.times do
  Task.create(
    name: Faker::Lorem.sentence,
    description: [Faker::Lorem.paragraph, nil].sample,
    status: %w[Started Finished Stashed].sample,
    creator: Faker::Name.name,
    performer: [Faker::Name.name, nil].sample,
    completed: Faker::Boolean.boolean,
  )
end
