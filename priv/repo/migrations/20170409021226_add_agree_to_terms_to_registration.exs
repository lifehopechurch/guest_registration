defmodule GuestRegistration.Repo.Migrations.AddAgreeToTermsToRegistration do
  use Ecto.Migration

  def change do
    alter table(:registrations) do
      add :agree_to_terms, :boolean, null: true
    end
  end
end
