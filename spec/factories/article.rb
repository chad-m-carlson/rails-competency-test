FactoryBot.define do
  factory :user, class: User do
    email {"test@test.com"}
    password {"password"}
  end
end

FactoryBot.define do
  factory :article, class: Article do
    # user_id { @user.id }
    category { "Food" }
    title { "Literally everything is better with butter"}
    content { "Of course it is, butter is awesome" }
  end
end