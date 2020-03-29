module Mutations
  class AddItemMutation < Mutations::BaseMutation

    # argument :title, String, required: true
    # argument :description, String, required: false
    # argument :image_url, String, required: false

    argument :attributes, Types::ItemInputType, required: true
    # argument :attributes, Types::ItemAttributes, required: true # new argument


    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    def resolve(attributes:)
    #   if context[:current_user].nil?
    #     raise GraphQL::ExecutionError,
    #           "You need to authenticate to perform this action"
    #   end

      item = Item.new(
        title: attributes.title,
        description: attributes.description,
        image_url: attributes.image_url,
        user: context[:current_user]
      )

      if item.save
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end