require_relative 'students'
class Student_Tree
  include Enumerable
  attr_reader :root
  def initialize
    @root = nil
  end
  class Node
    attr_accessor :data, :left, :right
    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end
  end
  def add(data)
    @root = add_recursive(@root, data)
  end
  def each(type: :dfs_root, &block)
    self.send(type, &block)
  end
  private
  def add_recursive(node, data)
    return Node.new(data) if node.nil?
    if data < node.data
      node.left = add_recursive(node.left, data)
    else
      node.right = add_recursive(node.right, data)
    end
    return node
  end
  def dfs_root(&block)
    dfs(@root, &block)
  end
  def dfs(node, &block)
    return if node.nil?
    dfs(node.left, &block)
    yield node.data
    dfs(node.right, &block)
  end
end
student1 = Student.new('Ahmed', 'Ahmedov', date: '1990-01-10')
student2 = Student.new('Boris', 'Borisov', date: '1990-01-08')
student3 = Student.new('Chris', 'Chromov', date: '1990-01-16')
student4 = Student.new('Danil', 'Danilov', date: '1990-01-14')
student5 = Student.new('Emily', 'Emilova', date: '1990-01-12')
tree = Student_Tree.new
tree.add(student1)
tree.add(student2)
tree.add(student3)
tree.add(student4)
tree.add(student5)
tree.each {|student| puts student}