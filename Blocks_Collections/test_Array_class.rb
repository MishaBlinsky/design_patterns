require_relative "Array_class"
require 'minitest/autorun'
class MyArrayTest < Minitest::Test
  attr_reader :arr
  def setup
    @arr = MyArray.new([3,6,-2,6,3,5,8,2,9,-1,7,4])
  end
  def test_chunk
    assert_equal [[false, [3]], [true, [6, -2, 6]], [false, [3, 5]], [true, [8, 2]], [false, [9, -1, 7]], [true, [4]]], arr.chunk {|e| e.even?}
  end
  def test_include?
    assert arr.include? {|e| e < 0}
    assert arr.include? {|e| e != 10}
    refute arr.include? {|e| e <= -3}
  end
  def test_reduce
    assert_equal 50, arr.reduce {|acc, e| acc + e}
    assert_equal 53, arr.reduce(3) {|acc, e| acc + e}
    assert_equal 27, arr.reduce {|acc, e| e.even? ? acc + e : acc}
  end
  def test_sum
    assert_equal 25.0, arr.sum {|e| e * 0.5}
  end
  def test_member?
    assert arr.member? {|e| e < 0}
    assert arr.member? {|e| e != 10}
    refute arr.member? {|e| e <= -3}
  end
  def test_filter
    assert_equal [3, 3, 5, 9, -1, 7], arr.filter {|e| !e.even?}
  end
end