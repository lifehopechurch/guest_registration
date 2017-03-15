defmodule GuestRegistration.Repo.Migrations.CreateRegistration do
  use Ecto.Migration

  def change do
    create table(:registrations) do
      add :first_name, :string
      add :last_name, :string
      add :number_of_additional_guests, :integer
      add :phone_number, :string
      add :email_address, :string
      add :address_1, :string
      add :address_2, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string

      timestamps()
    end

  end
end
