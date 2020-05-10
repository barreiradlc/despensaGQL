# module Mutations
#   class BaseMutation < GraphQL::Schema::RelayClassicMutation
#     argument_class Types::BaseArgument
#     field_class Types::BaseField
#     input_object_class Types::BaseInputObject
#     object_class Types::BaseObject
#   end
# end

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation

    def check_authentication!
      return if context[:current_user]

      raise GraphQL::ExecutionError,
            "Precisas estar autenticado para performar tal ação"

      # puts 'Sem Autenticação para testes'
    end
    
  end
end