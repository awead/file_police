class FilePolice::Judge

  attr_accessor :case, :violations

  def initialize path
    self.case = path
    self.violations = Hash.new
    Dir.glob(path+"**/*").each do |file|
      unless File.directory?(file)
        hearing = FilePolice::BacklogFile.new(file) 
        self.violations[File.basename(file)] = hearing.errors unless hearing.errors.empty?
      end
    end
  end

  def ruling file = "ruling.csv"
    File.delete(file) if File.exists?(file)
    unless violations.empty?
      CSV.open(file, "w") do |csv|
        self.violations.each do |k,v|
          csv << [k] + v
        end
      end
    end
  end

end