require 'faye/websocket'

module Blog
  class BlogBackend
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app     = app
      @clients = []
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })
        open(ws)
        message(ws)
        close(ws)
        ws.rack_response
      else
        @app.call(env)
      end
    end

    private

    def open(ws)
      ws.on :open do |event|
        p [:open, ws.object_id]
        @clients << ws
      end
    end

    def message(ws)
      ws.on :message do |event|
        p [:message, event.data]
        @clients.each {|client| client.send(event.data) }
      end
    end

    def close(ws)
      ws.on :close do |event|
        p [:close, ws.object_id, event.code, event.reason]
        @clients.delete(ws)
        ws = nil
      end
    end
  end
end
