defmodule GuestRegistration.RegistrationTest do
  use GuestRegistration.ModelCase

  alias GuestRegistration.Registration

  @valid_attrs %{address_1: "some content", address_2: "some content", city: "some content", family_name: "some content", number_of_additional_guests: 42, postal_code: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Registration.changeset(%Registration{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Registration.changeset(%Registration{}, @invalid_attrs)
    refute changeset.valid?
  end
end
