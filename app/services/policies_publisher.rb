require 'bunny'

class PoliciesPublisher
  class << self
    RABBITMQ_HOST = 'rabbitmq'

    def publish(message = {})
      queue.publish(message.to_json, persistent: true, routing_key: 'policies')
    end

    def channel
      @channel ||= connection.create_channel
    end

    def connection
      @connection ||= Bunny.new(host: RABBITMQ_HOST).tap(&:start)
    end

    def queue
      @queue ||= channel.queue('policies', durable: true)
    end
  end
end