AdminUser.destroy_all if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Product.destroy_all
ProductCategory.destroy_all

normal = ProductStatusCode.create(name: 'Normal', description: 'This marks a normal product.')
new = ProductStatusCode.create(name: 'New', description: 'This marks a new product.')
sale = ProductStatusCode.create(name: 'Sale', description: 'This marks a product on sale.')

standard = ProductCategory.create(name: "Standard", description: "The standard mealdog category.")
# .products.create(name: "The Standard", description: "The standard mealdog.", price: 9.99, product_status_code: normal)

standard.products.create(name: Spicy::Proton.format('%b %v').titleize + ' Mealdog', description: 'A ' + Spicy::Proton.adjective + 'tasting mealdog.')
