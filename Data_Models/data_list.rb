class DataList
  def initialize(data)
    @data, @selected = data.freeze, []
  end
  def select(n)
    @selected << n unless @selected.include?(n)
  end
  def get_selected
    @selected.dup
  end
  def get_names
    raise ArgumentError, "The method get_names is not implemented"
  end
  def get_data
    raise ArgumentError, "The method get_data is not implemented"
  end
  protected
  attr_reader :data
  attr_accessor :selected
  def data=(data)
    @data = data.map {|r| deep_copy(r)}
  end
  def deep_copy(obj)
    if obj.is_a?(Array)
      obj.map {|e| deep_copy(e)}
    elsif obj.is_a?(Hash)
      obj.transform_values {|val| deep_dup(val)}
    elsif obj.respond_to?(:dup)
      obj.dup
    else
      obj
    end
  end
end