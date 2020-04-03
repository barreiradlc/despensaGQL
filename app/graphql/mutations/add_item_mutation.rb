module Mutations
  class AddItemMutation < Mutations::BaseMutation

    argument :attributes, Types::ItemInputType, required: true

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(attributes:)
      check_authentication!

      item = Item.new(attributes.to_h.merge(user: context[:current_user]))

      puts item

      if item.save
        GqlDespensaSchema.subscriptions.trigger("itemAdded", {}, item)
        { item: item }
      else
        { errors: item.errors }
      end

    end
  end
end