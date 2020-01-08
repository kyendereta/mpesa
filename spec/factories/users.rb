FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    id_number { "12345678" }
    phone_number { "0707065562" }
    password { "Verystrong.123" }
    password_confirmation{ "Verystrong.123" }
  end
end 

