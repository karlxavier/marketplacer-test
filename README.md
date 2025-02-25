# Marketplacer Technical Test

This is a Ruby on Rails API project. The project is containerized using **Docker**, making setup easy and consistent across environments.

---

## 🛠 Prerequisites

Ensure you have the following installed:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)

---

## 🚀 Setting Up the Project Locally

### 1️. **Clone the Repository**
```sh
git clone git@github.com:karlxavier/marketplacer-test.git
cd marketplacer-test
```

### 2. **Initialize docker**

Build Docker images:

- `docker-compose build`

Database creation and migration:

- `docker-compose run app rails db:create db:migrate`

Run RSpec Tests:

- `docker-compose run --rm app rspec`
- RSpec will validate the following cases:
  - `spec/models/cart_spec.rb`
  - `spec/requests/api/carts_spec.rb`
  - `spec/requests/api/products_spec.rb`

Run Rails console:

- `docker-compose run --rm app rails console`


## 🛠 Please take note the following files:
- For Issuing discounts:
  - `app/services/discount/issuer.rb`
  - `app/services/discount/validator.rb`
- API endpoints
  - `app/controllers/api/products_controller.rb`
  - `app/controllers/api/carts_controller.rb`
