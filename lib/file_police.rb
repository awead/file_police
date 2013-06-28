require 'csv'

module FilePolice

  def self.version
    FilePolice::VERSION
  end

end

require 'file_police/backlog_file'
require 'file_police/ruling'