module Mutations
    class DeleteDespensaMutation < Mutations::BaseMutation
      
      argument :id, ID, required: true
      
      field :errors, Types::ValidationErrorsType, null: true
      
      def resolve(id:)
        check_authentication!

        puts 'user'
        puts id
        puts 'user'

        user = User.find(1)
        
        @despensa = Despensa.find(id)

        if @despensa.destroy
          {id: id}
        end


    end
  end
end