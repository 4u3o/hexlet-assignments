# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    req = Rack::Request.new(env)
    locale = req.get_header('HTTP_ACCEPT_LANGUAGE')&.scan(/^[a-z]{2}/)&.first
    I18n.locale = locale || I18n.default_locale
    @app.call(env)
  end
  # END
end
