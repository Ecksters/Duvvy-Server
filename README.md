# Duvvy Server
A simple example budgeting application API server using the Phoenix Framework for the Elixir language.

Requires:

  * Development PostgreSQL server, with no username/password requirements (project will use postgres/postgres)

To start the Duvvy Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate the database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

API calls can be made to [`localhost:4000/api`](http://localhost:4000/api) now.

Endpoints include `/api/budgets`, `/api/categories`, and `/api/transactions`. API follows normal REST conventions.

Currently the dev Duvvy server has CORS enabled for all hosts, so the Duvvy client
served through `npm start` should be able to access the API without throwing any errors.