AdminUser.destroy_all if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Product.destroy_all
ProductCategory.destroy_all
ProductStatusCode.destroy_all

normal = ProductStatusCode.create(name: 'Normal', description: 'This marks a normal product.')
new = ProductStatusCode.create(name: 'New', description: 'This marks a new product.')
sale = ProductStatusCode.create(name: 'Sale', description: 'This marks a product on sale.')

proton = Spicy::Proton.new
10.times do
  cat = ProductCategory.create(
    name: proton.adjective,
    description: proton.format("%a %b %n")
  )
  10.times do
    cat.products.create(
      name: proton.format('%b %v').titleize + ' Mealdog',
      description: 'A ' + proton.adjective + ' mealdog.',
      price: rand(500..2999),
      product_status_code: ProductStatusCode.order("RANDOM()").first
    )
  end
end

Page.create(title: "About", content: "This is the About page.")
Page.create(title: "Contact", content: "This is the Contact page.")
