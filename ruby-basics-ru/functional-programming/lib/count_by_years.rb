# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  users.each_with_object(Hash.new(0)) do |user, acc|
    acc[user[:birthday].split('-').first] += 1 if user[:gender].eql?('male')
  end
end
# END
