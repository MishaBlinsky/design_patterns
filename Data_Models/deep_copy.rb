module DeepCopy
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