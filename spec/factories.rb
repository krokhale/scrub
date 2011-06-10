Factory.sequence :question do
  Faker::Lorem.words(3).join(' ') + "?"
end


Factory.define :scrible do |s|
  s.question { Factory.next(:question) }
end

Factory.define :comment do |c|
  c.content "first comment"
  c.association(:scrible)
end

Factory.define :branch do |b|
  b.content "first branch"
  b.association(:scrible)
end

Factory.define :poll do |p|
  p.question "what's up?"
  p.active true
  p.association(:scrible)
end

Factory.define :poll_option do |b|
  b.content "first option"
  b.association(:poll)
end









