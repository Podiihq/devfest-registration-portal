defmodule DevfestRegistrationApp.Accounts.Attendee do
	use Ecto.Schema
	import Ecto.Changeset

	schema "attendees" do
		field :first_name, :string
		field :last_name, :string
		field :email, :string
		field :password, :string, virtual: true
		field :password_hash, :string
		field :experience_level, :string
		field :institution, :string

      timestamps()
	end

	 def changeset(attendees, params \\%{}) do
	 	attendees
	 	|> cast(params, [:first_name, :last_name, :email, :password, :experience_level, :institution])
	 	|> validate_required([:first_name, :last_name, :email, :password, :experience_level, :institution])
	 	|> validate_format(:email, ~r/@/)
	 	|> validate_length(:password, min: 1, max: 16)
	 end
	
end
