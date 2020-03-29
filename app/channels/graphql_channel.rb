class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @subscription_ids = []
  end

  def execute(data)
    puts 'subscriptions'
    puts data
    result = execute_query(data)
    puts result
    
    payload = {
      result: result.subscription? ? { data: nil } : result.to_h,
      more: result.subscription?
    }
    puts payload
    puts 'subscriptions'

    @subscription_ids << context[:subscription_id] if result.context[:subscription_id]

    transmit(payload)
  end

  

  def unsubscribed
    @subscription_ids.each do |sid|
      GqlDespensaSchema.subscriptions.delete_subscription(sid)
    end
    # Any cleanup needed when channel is unsubscribed
  end
  private

  def execute_query(data)
    GqlDespensaSchema.execute(
      query: data["query"],
      context: context,
      variables: data["variables"],
      operation_name: data["operationName"]
    )
  end

  def context
    {
      current_user_id: current_user&.id,
      current_user: current_user,
      channel: self
    }
  end

end
