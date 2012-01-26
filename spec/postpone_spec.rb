describe Postpone do  
  describe "instance" do
    subject { Example.new }
    it "should invoke stalker, without arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", {
        args: Marshal.dump([]),
        object: Marshal.dump(subject),
        method: :method1
      })

      subject.postpone.method1
    end

    it "should invoke stalker, with arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", {
        args: Marshal.dump(["value1", "value2"]),
        object: Marshal.dump(subject),
        method: :method2
      })

      subject.postpone.method2("value1", "value2")
    end
  end
  
  describe "class method" do
    subject { Example }
    it "should invoke stalker, without arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", {
        args: Marshal.dump([]),
        object: Marshal.dump(subject),
        method: :method3
      })

      subject.postpone.method3
    end

    it "should invoke stalker, with arguments" do
      Stalker.should_receive(:enqueue).with("postpone.worker", {
        args: Marshal.dump(["value1", "value2"]),
        object: Marshal.dump(subject),
        method: :method4
      })

      subject.postpone.method4("value1", "value2")
    end
  end
  
end