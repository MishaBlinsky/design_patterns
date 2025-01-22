require_relative 'data_table.rb'
class DataList
  include DeepCopy
  def initialize(data)
    self.data, self.selected = data.freeze, []
  end
  def select(n)
    element = data[n]
    self.selected << element unless self.selected.include?(element)
  end
  def get_selected
    deep_copy(self.selected)
  end
  def data_row(index)
    raise ArgumentError, "The method data_row is not implemented"
  end
  def get_names
    raise ArgumentError, "The method get_names is not implemented"
  end
  def get_data
    data4table = self.data.map.with_index {|student, index| self.data_row(index)}
    DataTable.new(data4table)
  end
  protected
  attr_reader :data
  attr_accessor :selected
  def data=(data)
    @data = data.map {|r| deep_copy(r)}
  end
end