class MyArray
  attr_reader :arr
  def initialize(arr)
    @arr = arr.dup()
  end
  def chunk() # 04)
    result, current_chunk, last_key = [], [], nil
    arr.each do |e|
      key = yield(e)
      if key != last_key
        result << [last_key, current_chunk] if last_key != nil
        current_chunk, last_key = [e], key
      else
        current_chunk << e
      end
    end
    result << [last_key, current_chunk] if last_key != nil
    result
  end
  def include?() # 16)
    arr.each {|e| return true if yield(e)}
    false
  end
  def reduce(initial = nil) # 28)
    if initial.nil?
      initial = arr.first
      arr[1..-1].each {|e| initial = yield(initial, e)}
    else
      arr.each {|e| initial = yield(initial, e)}
    end
    initial
  end
  def sum() # 33)
    sum = 0
    arr.each {|e| sum += yield(e)}
    sum
  end
  def member?() # 21)
    arr.each {|e| return true if yield(e)}
    false
    #are include? and member? the same mehtod???
  end
  def filter() # 09)
    result = []
    arr.each {|e| result << e if yield(e)}
    result
  end
end