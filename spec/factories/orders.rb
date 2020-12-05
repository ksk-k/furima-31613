FactoryBot.define do
  factory :order_form do
    postal_code {"660-0052"}
    prefecture_id {2}
    municipality {"尼崎市"}
    address {"1-1"}
    phone_number {12345678909}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
