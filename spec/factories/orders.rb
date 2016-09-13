FactoryGirl.define do
  factory :order do
    buyer "John"
    description "a file offer description"
    unit_price 1.5
    quantity 14
    address "Saint Louis 6 - Street 4"
    supplier "Subway"
  end
end
