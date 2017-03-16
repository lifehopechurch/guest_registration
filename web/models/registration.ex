defmodule GuestRegistration.Registration do
  use GuestRegistration.Web, :model

  schema "registrations" do
    field :first_name, :string
    field :last_name, :string
    field :number_of_additional_guests, :integer
    field :address_1, :string
    field :address_2, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string
    field :email_address, :string
    field :phone_number, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :number_of_additional_guests, :address_1, :address_2, :city, :state, :postal_code, :email_address, :phone_number])
    |> validate_required([:first_name, :last_name, :email_address])
  end
end
