require IEx
defmodule GuestRegistration.WelcomeController do
  use GuestRegistration.Web, :controller
  alias GuestRegistration.Registration

  def new(conn, _params) do
    IEx.pry
    changeset = Registration.changeset(%Registration{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"registration" => registration_params}) do
    changeset = Registration.changeset(%Registration{}, registration_params)
    case Repo.insert(changeset) do
      {:ok, _registration} ->
        conn
        |> put_flash(:info, "Registration created successfully.")
        |> redirect(to: welcome_path(conn, :thanks))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def thanks(conn, _params) do
    render conn, "thanks.html"
  end
end
