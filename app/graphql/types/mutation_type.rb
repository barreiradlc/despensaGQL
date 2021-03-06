module Types
  class MutationType < Types::BaseObject
    
    field :sign_in, mutation: Mutations::SignInMutation
    field :sign_up, mutation: Mutations::SignUpMutation
    field :update_perfil_mutation, mutation: Mutations::UpdatePerfilMutation

    field :handle_despensa_mutation, mutation: Mutations::HandleDespensaMutation
    field :add_despensa, mutation: Mutations::AddDespensaMutation
    field :update_despensa_mutation, mutation: Mutations::UpdateDespensaMutation
    field :delete_despensa_mutation, mutation: Mutations::DeleteDespensaMutation
    
    field :add_item, mutation: Mutations::AddItemMutation
    field :update_item, mutation: Mutations::UpdateItemMutation
    
    field :add_receita_mutation, mutation: Mutations::AddReceitaMutation
    field :update_receita_mutation, mutation: Mutations::UpdateReceitaMutation
    field :delete_receita_mutation, mutation: Mutations::DeleteReceitaMutation
    
    field :add_convite_mutation, mutation: Mutations::AddConviteMutation
    field :response_convite_mutation, mutation: Mutations::ResponseConviteMutation
  end
end