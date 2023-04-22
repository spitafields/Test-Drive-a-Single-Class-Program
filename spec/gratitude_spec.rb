Require "gratitudes"

RSpec.require Gratitudes do
  it "adds and provides a list of attitudes" do 
    gratitudes = Gratitudes.new
    gratitudes.add("your cat")
    gratitudes.add("nice people")
    expect(gratitudes.format).to eq "Be grateful for: your cat, nice people"
  end
end
