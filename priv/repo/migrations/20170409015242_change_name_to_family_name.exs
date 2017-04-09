defmodule GuestRegistration.Repo.Migrations.ChangeNameToFamilyName do
  use Ecto.Migration

  def change do
    alter table(:registrations) do
      add :family_name, :string
      remove :first_name
      remove :last_name
    end
  end
end
