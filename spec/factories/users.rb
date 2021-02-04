
FactoryBot.define do
  factory :user do
    name { 'france' }
    email { 'france@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
  factory :admin_user, class: User do
    name { 'admin_user' }
    email { 'admin@example.com' }
    password { 'jones999' }
    password_confirmation { 'jones999' }
    admin { true }
  end
end
