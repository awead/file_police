require 'spec_helper'

describe FilePolice::BacklogFile do
  
  describe "valid filenames" do

    before :each do
      @sample = FilePolice::BacklogFile.new("ARC0001_BX1_FL1_name_001.tif")
    end

    it "must have no errors" do
      @sample.errors.should be_empty
    end

    it "must have a collection" do
      @sample.collection.should == "ARC0001"
    end

    it "must have a box" do
      @sample.box.should == "BX1"
    end

    it "must have a folder" do
      @sample.folder.should == "FL1"
    end

    it "must have some kind of name" do
      @sample.name.should == "name"
    end

    it "must have a number for the file" do
      @sample.number.should == "001"
    end

    it "can have numbers at the end" do
      FilePolice::BacklogFile.new("ARC0001_BX1_FL1_name_001b.tif").errors.should be_empty
    end

    it "can have OS instead of BX" do
      FilePolice::BacklogFile.new("ARC0001_OS1_FL1_name_001.tif").errors.should be_empty
    end

    it "can have folders with letter designations" do
      FilePolice::BacklogFile.new("ARC0001_OS1_FL33b_name_001.tif").errors.should be_empty
    end

  end

  describe "an invalid filename" do

    it "has too many parts" do
      invalid = FilePolice::BacklogFile.new("ARC0001_BX1_FL4_name_extra_001.tif")
      invalid.errors.should include "Filename does not have 5 segments separated by underscores (_)"
    end

    its "has not enough parts" do
      invalid = FilePolice::BacklogFile.new("ARC0001_BX1_001.tif")
      invalid.errors.should include "Filename does not have 5 segments separated by underscores (_)"
    end

    it "has an incorrect collection" do
      ["ARC-001_x_x_x_x", "ARC1_x_x_x_x", "ARC 001_x_x_x_x" ].each do |file|
        invalid = FilePolice::BacklogFile.new(file)
        invalid.errors.should include "#{invalid.collection} does not match ARC#### format"
      end
    end

    it "has an incorrect box" do
      invalid = FilePolice::BacklogFile.new("ARC0001_box2_FL4_name_001.tif")
      invalid.errors.should include "box2 does not have the correct format"
    end

    it "has an incorrect folder" do
      invalid = FilePolice::BacklogFile.new("ARC0001_BX1_folder3_name_001.tif")
      invalid.errors.should include "folder3 does not have the correct format"
    end

  end

end 