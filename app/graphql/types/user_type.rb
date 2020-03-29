module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :email, String, null: true
    field :full_name, String, null: true


    def full_name
      # `object` references the user instance
      [object.first_name, object.last_name].compact.join(" ")
    end
    
  end
end
