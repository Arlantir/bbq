FactoryBot.define do
  factory :event do
    title { "Шашлыки_#{rand(999)}" }
  end
end