require 'spec_helper'

describe FilePolice::Judge do

  before :each do
    @bad  = FilePolice::Judge.new("spec/fixtures/bad")
    @good = FilePolice::Judge.new("spec/fixtures/good")
  end

  describe "presiding over a directory of files" do

    it "should rule on which files are invalid" do
      @bad.violations.should include "ARC 0001_BX1_FL1_name_001.tif" => ["ARC 0001 does not match ARC#### format"]
    end

    it "should rule on which files are vaild" do
      @good.violations.should be_empty
    end

  end

  describe "handing down a ruling" do

    around :each do
      File.delete("ruling.csv") if File.exists?("ruling.csv")
    end

    it "should return a csv file with the violations" do
      @bad.ruling
      File.exists?("ruling.csv").should be_true
    end

    it "should not return any ruling if there are no violations" do
      @good.ruling
      File.exists?("ruling.csv").should be_false
    end


  end

end