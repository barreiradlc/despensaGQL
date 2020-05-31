module Mutations
    class DeleteReceitaMutation < Mutations::BaseMutation
      
      argument :id, ID, required: true
      
      field :errors, Types::ValidationErrorsType, null: true
      field :id, Integer, null: true
      field :receita, Types::ReceitaType, null: true
      
      def resolve(id:)
        # check_authentication!

        # user = User.find(context[:current_user].id)
        # user = User.find(1)
        
        @receita = Receitum.find(id)

        if @receita.destroy # && user.id == @receita.user_id
            {id: id}
        else
            {errors: @receita.errors}
        end


    end
  end
end