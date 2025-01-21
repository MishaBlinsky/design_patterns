require 'yaml'
require_relative 'file_base.rb'
class YAML_strategy < File_strategy
  def self.read(file_path)
    File.exist?(file_path) ? YAML.safe_load(File.read(file_path), permitted_classes: [Date, Symbol]).map { |data| Student.new(**data) } : []
  end
  def self.write(file_path, data)
    File.write(file_path, data.to_yaml)
  end
end