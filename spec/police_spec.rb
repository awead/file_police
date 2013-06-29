require 'spec_helper'

describe FilePolice do
  
  describe "::patrol" do
    it "should return an array of tickets with violations" do
      tickets = FilePolice.patrol("spec/fixtures/bad")
      tickets.should be_kind_of Array
      tickets.first.should be_kind_of FilePolice::Ticket
      tickets.collect { |t| t.file unless t.violations.empty? }.should include "ARC0001_box11_FL1_name_001.tif"
    end

    it "should return an array of tickets without violations" do
      tickets = FilePolice.patrol("spec/fixtures/good")
      tickets.collect { |t| t.file unless t.violations.empty? }.compact.should be_empty
    end
  end

end