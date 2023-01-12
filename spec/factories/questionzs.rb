FactoryBot.define do
  factory :questionz do
    title { "MyString" }
    body { "MyText" }
    solved_check { false }
    user { nil }
  end
end
