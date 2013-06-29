class FilePolice::Ticket

  attr_accessor :file, :violations

  def initialize file, violations
    self.file = file
    self.violations = violations
  end

end