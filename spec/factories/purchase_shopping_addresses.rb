FactoryBot.define do
  factory :purchase_shopping_address do
    token              {"tok_abcdefghijk00000000000000000"}
    postal_code        {"123-4567"}
    prefecture_id      {rand(1..47)}
    city               {"横浜市緑区"}
    address            {"青山１−１−１"}
    phone_number       {"09012345678"}
  end
end
