class GqlDespensaSchema < GraphQL::Schema
  default_max_page_size 10


  use GraphQL::Subscriptions::ActionCableSubscriptions
  # use GraphQL::Subscriptions::ActionCableSubscriptions, redis: Redis.new


  mutation(Types::MutationType)
  query(Types::QueryType)
  subscription(Types::SubscriptionType)
  
  
  # # Opt in to the new runtime (default in future graphql-ruby versions)
  # use GraphQL::Execution::Interpreter
  # use GraphQL::Analysis::AST
  
  # # Add built-in connections for pagination  
  use GraphQL::Pagination::Connections
end
