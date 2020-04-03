module Types
  class ItemType < Types::BaseObject
        
        field :id, ID, null: true
        field :quantidade, Integer, null: true
        field :validade, GraphQL::Types::ISO8601Date, null: true

        # field :created_at, GraphQL::Types::ISO8601Date, null: true
        # field :updated_at, GraphQL::Types::ISO8601Date, null: true

        field :despensa, Types::DespensaType, null: true
        field :provimento, Types::ProvimentoType, null: true
        # field :user_id, Integer, null: true

  end
end

