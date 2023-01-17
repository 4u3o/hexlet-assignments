# frozen_string_literal: true

# BEGIN
class String
  alias_method :string, :to_s
  alias_method :integer, :to_i

  def datetime
    DateTime.parse(self)
  end

  def boolean
    self == 'true' ? true : false
  end
end

class Integer
  alias_method :integer, :to_i
end

class TrueClass
  def boolean
    true
  end
end

module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  def attributes
    self.instance_variables.each_with_object({}) do |var, obj|
      obj[var.to_s[1..].to_sym] = instance_variable_get var
    end
  end

  def initialize(options={})
    options.each do |k, v|
      self.send("#{k.to_s}=", v)
    end
  end

  module ClassMethods
    def attribute(name, **options)
      define_method name do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        value = value.send(options[:type]) unless options[:type].nil?
        instance_variable_set "@#{name}", value
      end
    end
  end
end
# END
