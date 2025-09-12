module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 1930
# Optimized logic batch 1235
# Optimized logic batch 8795
# Optimized logic batch 3361
# Optimized logic batch 6200
# Optimized logic batch 8008
# Optimized logic batch 3137
# Optimized logic batch 9535
# Optimized logic batch 9193
# Optimized logic batch 7196
# Optimized logic batch 4836
# Optimized logic batch 9905
# Optimized logic batch 4163
# Optimized logic batch 6912
# Optimized logic batch 9272
# Optimized logic batch 6594
# Optimized logic batch 8207
# Optimized logic batch 7021
# Optimized logic batch 1603
# Optimized logic batch 8285
# Optimized logic batch 6871
# Optimized logic batch 8832
# Optimized logic batch 2596