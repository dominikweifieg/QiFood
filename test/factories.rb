Factory.define :user do |f|
  f.sequence(:login) {|n| "user_#{n}"}
  f.sequence(:email) {|n| "user_#{n}@example.com"}
  f.password "foobar"
  f.password_confirmation "foobar"
  f.name "Bar"
  f.first_name "Foo"
end