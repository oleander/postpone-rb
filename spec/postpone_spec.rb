
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

describe Postpone::Worker do
  describe "instance" do
    subject { Example.new }
    
    before(:all) { $method1, $method2 = nil, nil }
    
    it "should call instance method, without arguments" do
      Postpone::Worker.new(translate({
        args: [],
        object: subject,
        method: :method1
      }, "string"))
      
      $method1.should_not be_nil
    end
    
    it "should call instance method, with arguments" do
      Postpone::Worker.new(translate({
        args: ["value1", "value2"],
        object: subject,
        method: :method2
      }, "string"))
      
      $method2.should_not be_nil
    end    
  end
  
  describe "class method" do
    subject { Example }
    
    before(:all) { $method3, $method4 = nil, nil }
    
    it "should call instance method, without arguments" do
      Postpone::Worker.new(translate({
        args: [],
        object: subject,
        method: :method3
      }, "string"))
      
      $method3.should_not be_nil
    end
    
    it "should call instance method, with arguments" do
      Postpone::Worker.new(translate({
        args: ["value1", "value2"],
        object: subject,
        method: :method4
      }, "string"))
      
      $method4.should_not be_nil
    end
  end
end