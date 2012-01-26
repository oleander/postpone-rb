require "stalker"

module Postpone
  def postpone; Invoke.new(self); end
  def self.postpone; Invoke.new(self); end
  
  class Invoke
    def initialize(object)
      @object = object
    end
    
    def method_missing(method, *args)
      !! Stalker.enqueue("postpone.worker", {
        method: method,
        args: Marshal.dump(args),
        object: Marshal.dump(@object)
      })
    end
  end
end