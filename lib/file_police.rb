require 'csv'

module FilePolice

  def self.version
    FilePolice::VERSION
  end

  # Patrol a directory and return tickets for any violations
  def self.patrol path, tickets = Array.new
    Dir.glob(File.join(path, "**/*")).each do |file|
      tickets << Ticket.new(File.basename(file), FilePolice::BacklogFile.new(file).errors) unless File.directory?(file)
    end
    return tickets
  end

end

require 'file_police/backlog_file'
require 'file_police/ticket'