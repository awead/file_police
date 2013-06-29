require 'spec_helper'

describe FilePolice::Ticket do

  before :each do
    @ticket = FilePolice::Ticket.new("foo", ["issue1", "issue2"])
  end

  it "should have a file" do
    @ticket.file.should == "foo"
  end

  it "should violations" do
    @ticket.violations.should == ["issue1", "issue2"]
  end

end