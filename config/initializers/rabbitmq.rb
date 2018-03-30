class RabbitMQ
  EXCHANGE = "schedule"
  TYPE = "direct"
  DURABLE = true
  class << self
    def connection
      @conn ||= Bunny.new(host: '182.254.138.108', user: 'woshinibaba', pass: 'nishiwoerzi').start
    end

    def channel
      @ch = connection.create_channel
    end

    def publish(msg)
      queue = @ch.queue('query_for_schedule')
      @ch.default_exchange.publish(msg, routing_key: queue.name)
      @ch.close
    end
  end
end