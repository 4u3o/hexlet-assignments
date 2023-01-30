# frozen_string_literal: true

require 'rack'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, body = @app.call(env)
    finish_time = Time.now

    duration = (finish_time - start_time).to_s

    body.push("\n", duration)

    [status, headers, body]
  end
end
