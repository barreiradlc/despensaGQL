module Types
  class UserType < Types::BaseObject

    field :id, ID, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :username, String, null: true

    field :items, [Types::ItemType], null: true
    field :despensas, [Types::DespensaType], null: true
    field :convites, [Types::ConviteType], null: true

    field :full_name, String, null: true

    def full_name
      # `object` references the user instance
      [object.first_name, object.last_name].compact.join(" ")
    end

  end
end
