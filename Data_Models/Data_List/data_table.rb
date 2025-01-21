require_relative 'deep_copy'
class DataTable
  include DeepCopy
  def initialize(data)
    @data = data
  end
  def row_count
    @data.size
  end
  def col_count
    @data.empty? ? 0 : @data.first.size
  end
  def get_element(r, c)
    raise IndexError, "Incorrect index" unless r.between?(0, row_count-1) && c.between?(0, col_count-1)
    deep_copy(@data[r][c])
  end
  private
  attr_reader :data
  def data=(data)
    raise ArgumentError, "Incorrect data" unless data.is_a?(Array) && data.all? {|r| r.is_a?(Array)}
    @data = data.map {|r| r.dup}
  end
end