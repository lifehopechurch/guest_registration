defmodule GuestRegistration.Repo.Migrations.AddEmailPhoneToRegistrations do
  use Ecto.Migration

  def change do
    alter table(:registrations) do
      add :email_address, :string
      add :phone_number, :string
    end
  end
end
