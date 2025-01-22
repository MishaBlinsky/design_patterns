require 'json'
require_relative 'file_base.rb'
class JSON_strategy < File_strategy
  def self.read(file_path)
    File.exist?(file_path) ? JSON.parse(File.read(file_path), symbolize_names: true) : []
  end
  def self.write(file_path, data)
    File.write(file_path, JSON.pretty_generate(data))
  end
end