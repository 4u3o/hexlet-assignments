require 'csv'

namespace :hexlet do
  desc "imports users from test/fixtures/files/users.csv"
  task import_users: :environment do
    _, *users_data = CSV.read(Rails.root.join('test', 'fixtures', 'files', 'users.csv'))
    users_data.each do |row|
      data = {
        first_name: row[0],
        last_name: row[1],
        birthday: Date.strptime(row[2], '%m/%d/%Y'),
        email: row[3]
      }
      User.create!(data)
    end
  end
end
