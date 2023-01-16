# frozen_string_literal: true
require 'uri'
require 'forwardable'

# BEGIN
class Url
  include Comparable
  extend Forwardable
  def_delegators :@uri, :scheme, :host

  def <=>(other)
    to_s <=> other.to_s
  end

  def initialize(string)
    @uri = URI::parse(string)
  end

  def query_params
    return {} if @uri.query.nil?

    @uri.query.split('&').each_with_object({}) do |param, acc|
      key, value = param.split('=')
      acc[key.to_sym] = value
    end
  end

  def query_param(key, default=nil)
    query_params.fetch(key, default)
  end

  def to_s
    @uri.to_s
  end
end
# END
