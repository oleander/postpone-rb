
describe Postpone::Invoke do  
  describe "instance" do
    subject { Example.new }
    it "should invoke stalker, without arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", translate({
        args: [],
        object: subject,
        method: :method1
      }))

      subject.postpone.method1
    end

    it "should invoke stalker, with arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", translate({
        args: ["value1", "value2"],
        object: subject,
        method: :method2
      }))

      subject.postpone.method2("value1", "value2")
    end
  end
  
  describe "class method" do
    subject { Example }
    it "should invoke stalker, without arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", translate({
        args: [],
        object: subject,
        method: :method3
      }))

      subject.postpone.method3
    end

    it "should invoke stalker, with arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", translate({
        args: ["value1", "value2"],
        object: subject,
        method: :method4
      }))

      subject.postpone.method4("value1", "value2")
    end
  end  
end

# describe Postpone::Worker do
#   describe "instance" do
#     it "should call method" do
#       Postpone::Worker.new(args)
#     end
#   end
# end