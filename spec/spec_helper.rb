require "rspec"
require_relative "../lib/postpone"

class Example
  def method1; end
  def method2(value1, value2); end
  def self.method3; end
  def self.method4(value1, value2); end
end

RSpec.configure do |config|
  config.mock_with :rspec
end