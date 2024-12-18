class HTML_Tree
  include Enumerable
  attr_reader :root
  def initialize(html)
    if  html.is_a?(String)
      @root = parse_main(html)
    elsif html.is_a?(Tag)
      @root = html
    else
      raise ArgumentError, 'Error!'
    end
  end
  def dfs_root(&block)
    dfs_tag(@root, &block)
  end
  def dfs_tag(tag, &block)
    yield tag
    tag.children.each {|child| dfs_tag(child, &block)}
  end
  def bfs_root
    queue = [@root]
    until queue.empty?
      tag = queue.shift
      yield tag
      queue.concat(tag.children)
    end
  end
  def each(type: :dfs_root, &block)
    self.send(type, &block)
  end
  def parse_main(html)
    elements = parse_html(html.strip)
    return elements[0] if elements.size == 1
    root = Tag.new(name: 'root')
    elements.each {|e| root.add_child(e)}
    return root
  end
  def parse_html(html)
    tags = []
    while !html.empty?
      break unless html =~ /\A<(\w+)(.*?)>(.*?)<\/\1>/m
      full_tag_text, tag_name, attributes, tag_content = $&, $1, $2, $3.strip
      attributes_parsed = parse_attributes(attributes)
      tag = Tag.new(name: tag_name, attributes: attributes_parsed)
      if tag_content =~ /\A<(\w+)(.*?)>(.*?)<\/\1>/m
        tag.add_child(parse_html(tag_content))
      else
        tag = Tag.new(name: tag_name, attributes: attributes_parsed, content: tag_content)
      end
      tags << taghtml.sub!(full_tag_text, '').strip
    end
    return tags
  end
  def parse_attributes(attr_string)
    attributes = {}
    attr_string.scan(/(\w+)=["'](.*?)["']/).each {|key, val| attributes[key] = val}
    return attributes
  end
  def to_html
    @root.to_html
  end
end
class Tag
  attr_reader :name, :children, :attributes, :content
  def initialize(name: "", attributes: {}, content: "")
    @name, @attributes, @content, @children = name, attributes, content, []
  end
  def add_child(tag)
    if tag.is_a?(Tag)
      @children << tag
    elsif tag.is_a?(Array)
      tag.each {|child| @children << child}
    end
  end
  def content_length
    @content.length
  end
  def has_children?
    !@children.empty?
  end
  def children_count
    @children.size
  end
  def to_html(indent_lvl = 0)
    indent = "  " * indent_lvl
    attributes = @attributes.map {|key, val| "#{key}=\"#{val}"}.join(" ")
    opening_tag = "#{indent}<#{@name}#{' ' unless attributes.empty?}#{attributes}>"
    if @children.any?
      content_tag = "#{indent}  #{@content}\n" if @content != ""
      inner_html = @children.map {|child| child.to_html(indent_lvl + 1)}.join("\n")
      "#{opening_tag}\n#{content_tag || nil}#{inner_html}\n#{indent}</#{@name}>"
    elsif @content
      "#{opening_tag}\n#{indent}  #{@content}\n#{indent}</#{name}>"
    else
      "#{opening_tag}</#{@name}>"
    end
  end
end

html = Tag.new(name:'html')
body = Tag.new(name:'body')
div = Tag.new(name:'div', attributes:{class:'A'}, content:'1')
div2 = Tag.new(name:'div', attributes:{class:'A'}, content:'2')
span = Tag.new(name:'span', content:'3')
html.add_child(body)
body.add_child([div,span])
div.add_child(div2)

tree = HTML_Tree.new(html)
puts tree.root.name
puts tree.to_html
