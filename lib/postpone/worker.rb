require "stalker"

module Postpone
  class Worker
    def initialize(args)
      Marshal.load(args["object"]).
        send(args["method"], *Marshal.load(args["args"]))
    end
  end  
end

Stalker::job "postpone.worker" do |args|
  Postpone::Worker.new(args)
end
