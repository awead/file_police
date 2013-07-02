# Checks the name of a file in our backlog for proper format.
#
# Ex. 
# >  good = BacklogFile.new(filepath)
# >  good.errors
# => []
# >  bad = BacklogFile.new(filepath)
# >  bad.errors
# => ["This is bad", "That is bad"]
#
class FilePolice::BacklogFile

  attr_accessor :collection, :box, :folder, :name, :number, :errors

  def initialize path
    parts = File.basename(path, File.extname(path)).split("_")
    self.errors = Array.new
    if parts.length == 5
      validate_collection(parts[0])
      validate_box(parts[1])
      validate_folder(parts[2])
      self.name = parts[3]
      validate_number(parts[4])
    else
      self.errors << "Filename does not have 5 segments separated by underscores (_)"
    end
  end

  # Should match strings like ARC0001
  def validate_collection collection = String.new
    self.errors << "#{collection} does not match ARC#### format" unless collection.match(/^ARC[0-9]{4,4}$/)
    self.collection = collection
  end

  # Should match strings like BX1
  def validate_box box = String.new
    self.errors << "#{box} does not match BX# format" unless box.match(/^[A-Z]{2,2}[0-9]{1,3}$/)
    self.box = box
  end

  # Should match strings like FL1
  def validate_folder folder = String.new
    self.errors << "#{folder} does not match FL# format" unless folder.match(/^FL[0-9]{1,3}$/)
    self.folder = folder
  end

  # Sould be numbers only
  def validate_number number = String.new
    self.errors << "#{number} does not match number format" unless number.match(/^[0-9]{1,4}[a-z]{0,1}$/)
    self.number = number
  end

end