# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Keeper.Repo.insert!(%Keeper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Keeper.Repo
alias Keeper.Customers.Dealer

Repo.insert!(%Dealer{name: "Acme Autobarn", primary_contact: "John Doe", make: "Chevrolet"})

Repo.insert!(%Dealer{name: "Local Honda Store", primary_contact: "Jane Smith", make: "Honda"})
