module Types
  class MutationType < Types::BaseObject
    
    field :sign_in, mutation: Mutations::SignInMutation
    # field :sign_up, mutation: Mutations::SignUpMutation

    # field :add_item, mutation: Mutations::AddItemMutation
    # field :update_item, mutation: Mutations::UpdateItemMutation


  end
end
