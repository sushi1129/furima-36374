FactoryBot.define do
  factory :order_address do
    postal_cade      {'123-4567'}
    prefectures_id      {1}
    city             {'名古屋市'}
    house_number     {'1-2-34'}
    building_name    {'ライオンズマンション'}
    telephone_number {12345678901}
  end
end
