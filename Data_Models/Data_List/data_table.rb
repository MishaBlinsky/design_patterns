require_relative 'deep_copy.rb'
class DataTable
  include DeepCopy
  def initialize(data)
    self.data = data
  end
  def row_count
    self.data.size
  end
  def col_count
    self.data.empty? ? 0 : self.data.first.size
  end
  def get_element(r, c)
    raise IndexError, "Incorrect index" unless r.between?(0, row_count-1) && c.between?(0, col_count-1)
    deep_copy(self.data[r][c])
  end
  private
  attr_reader :data
  def data=(data)
    raise ArgumentError, "Incorrect data" unless data.is_a?(Array) && data.all? {|r| r.is_a?(Array)}
    @data = data.map {|r| r.dup}
  end
end