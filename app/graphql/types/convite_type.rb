module Types
    class ConviteType < Types::BaseObject
          
          field :id, ID, null: true
          field :mensagem, String, null: true
            
          field :created_at, GraphQL::Types::ISO8601DateTime, null: true
          field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

  
    end
  end
  
  