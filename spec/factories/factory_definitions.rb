Factory.define :case_study do |f|
  f.title "MyString"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password  "MyString"
  f.password_confirmation "MyString"
end

Factory.sequence :email do |n|
  "somebody#{n}@whatevs.com"
end
