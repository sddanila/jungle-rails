# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Make sure to run `bundle install` to load all your gems

## Versioning

Jungle version 1.2.1

## Authors

* Danila Barton-Szabo - editing author


## License

This project is licensed under the LHL License

## Acknowledgments

* To all libraries that were used to edit this project
* Mentors who double-checked my code and helped through the tough spots
* Fellow peers for offering their support

## App Flow

#### User Login:
!["User Login"](https://github.com/sddanila/jungle-rails/blob/master/public/user_login.png)

#### User SignUp:
!["User SignUp"](https://github.com/sddanila/jungle-rails/blob/master/public/user_signup.png)

#### Placing an order:
!["Place Order"](https://github.com/sddanila/jungle-rails/blob/master/public/place_order.gif)

#### Reviewing a product:
!["Review Product"](https://github.com/sddanila/jungle-rails/blob/master/public/review_product.gif)

#### Admin categories and adding a new category:
!["Admin Categories"](https://github.com/sddanila/jungle-rails/blob/master/public/admin_categories.png)
!["Admin Add New Category"](https://github.com/sddanila/jungle-rails/blob/master/public/add_new_category.png)

