
Factory.define :scrible do |s|
  s.question "how are you?"
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