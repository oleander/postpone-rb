require "rspec"
require_relative "../lib/postpone"

module Helpers
  def translate(hash, type = "symbol")
    args = Marshal.dump(hash[:args])
    object = Marshal.dump(hash[:object])
    method = hash[:method]
    
    case type
    when "symbol"
      { args: args, object: object, method: method }
    when "string"
      { "args" => args, "object" => object, "method" => method }
    end
  end
end

class Example
  def method1; end
  def method2(value1, value2); end
  def self.method3; end
  def self.method4(value1, value2); end
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Helpers
end