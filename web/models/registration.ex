defmodule GuestRegistration.Registration do
  use GuestRegistration.Web, :model

  schema "registrations" do
    field :family_name, :string
    field :number_of_additional_guests, :integer
    field :address_1, :string
    field :address_2, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string
    field :email_address, :string
    field :phone_number, :string
    field :agree_to_terms, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:family_name, :number_of_additional_guests, :address_1, :address_2, :city, :state, :postal_code, :email_address, :phone_number, :agree_to_terms])
    |> validate_required([:family_name, :email_address, :agree_to_terms])
    |> validate_agree_to_terms(:agree_to_terms)
  end

  def validate_agree_to_terms(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, agree_to_terms ->
      case agree_to_terms do
        true -> []
        false -> [{field, options[:message] || "You must agree to terms in order to register"}]
      end
    end)
  end
end
