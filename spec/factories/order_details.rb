FactoryGirl.define do
  factory :order_detail, class: 'Order::Detail' do
    association :order, factory: :order_order
    association :product, factory: :product_product
    quantity 1
    price_per_count 10.00
  end
end
