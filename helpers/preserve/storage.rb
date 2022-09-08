require 'json'

class Storage
  def initialize(file_name)
    @file_name = file_name
  end

  def save(data)
    hash = data.map(&:to_hash)
    serialzed = JSON.pretty_generate(hash)
    file_name = "#{@file_name}.json"
    File.write(file_name, serialzed)
  end

  def load_data
    file_name = "#{@file_name}.json"
    return [] unless File.exist? file_name

    data = File.read(file_name)
    JSON.parse(data)
  end
end
