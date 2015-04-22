class Chizel
  attr_accessor :document  # => nil

  def initialize(document)
    @document = document.split("\n\n")  # => ["# My Life in Desserts", "", "## Chapter 1: The Beginning", "", "'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in", "**Food & Wine** this place has been packed every night.", "", "* here's", "* an", "* unordered", "* list", "", "1. here's", "2. an", "3. ordered", "4. list"]
  end

  def hash!
    @document.each do |line|                      # => ["# My Life in Desserts", "\n<p>\n</p>\n", "## Chapter 1: The Beginning", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
      hash_count = line.count("#")                # => 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      line.delete!("#")                           # => " My Life in Desserts", nil, " Chapter 1: The Beginning", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
        if hash_count > 0                         # => true, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false
          line.insert(0, "<h#{hash_count}>")      # => "<h1> My Life in Desserts", "<h2> Chapter 1: The Beginning"
          line.insert(-1, "</h#{hash_count}>\n")  # => "<h1> My Life in Desserts</h1>\n", "<h2> Chapter 1: The Beginning</h2>\n"
        end                                       # => "<h1> My Life in Desserts</h1>\n", nil, "<h2> Chapter 1: The Beginning</h2>\n", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    end                                           # => ["<h1> My Life in Desserts</h1>\n", "\n<p>\n</p>\n", "<h2> Chapter 1: The Beginning</h2>\n", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
    self                                          # => #<Chizel:0x007ff959181050 @document=["<h1> My Life in Desserts</h1>\n", "\n<p>\n</p>\n", "<h2> Chapter 1: The Beginning</h2>\n", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]>
  end

  def paragraph!
    @document.each do |line|         # => ["# My Life in Desserts", "", "## Chapter 1: The Beginning", "", "'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in", "**Food & Wine** this place has been packed every night.", "", "* here's", "* an", "* unordered", "* list", "", "1. here's", "2. an", "3. ordered", "4. list"]
      hash_count = line.count("#")   # => 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        if hash_count == 0           # => false, true, false, true, true, true, true, true, true, true, true, true, true, true, true, true
          line.insert(0, "\n<p>\n")  # => "\n<p>\n", "\n<p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in", "\n<p>\n**Food & Wine** this place has been packed every night.", "\n<p>\n", "\n<p>\n* here's", "\n<p>\n* an", "\n<p>\n* unordered", "\n<p>\n* list", "\n<p>\n", "\n<p>\n1. here's", "\n<p>\n2. an", "\n<p>\n3. ordered", "\n<p>\n4. list"
          line.insert(-1, "</p>\n")  # => "\n<p>\n</p>\n", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"
        end                          # => nil, "\n<p>\n</p>\n", nil, "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"
      end                            # => ["# My Life in Desserts", "\n<p>\n</p>\n", "## Chapter 1: The Beginning", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
    self                             # => #<Chizel:0x007ff959181050 @document=["# My Life in Desserts", "\n<p>\n</p>\n", "## Chapter 1: The Beginning", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]>
  end

  def star!
    @document.each do |line|                                 # => ["<h1> My Life in Desserts</h1>\n", "\n<p>\n</p>\n", "<h2> Chapter 1: The Beginning</h2>\n", "\n<p>\n</p>\n", "\n<p>\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n**Food & Wine** this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
      line.gsub!(/\*\*([^*]+)\*\*/, "<strong>\\1</strong>")  # => nil, nil, nil, nil, nil, "\n<p>\n<strong>Food & Wine</strong> this place has been packed every night.</p>\n", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
      line.gsub!(/\*([^*]+)\*/, "<em>\\1</em>")              # => nil, nil, nil, nil, "\n<p>\n'You just <em>have</em> to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
    end                                                      # => ["<h1> My Life in Desserts</h1>\n", "\n<p>\n</p>\n", "<h2> Chapter 1: The Beginning</h2>\n", "\n<p>\n</p>\n", "\n<p>\n'You just <em>have</em> to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n<strong>Food & Wine</strong> this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
    self.document                                            # => ["<h1> My Life in Desserts</h1>\n", "\n<p>\n</p>\n", "<h2> Chapter 1: The Beginning</h2>\n", "\n<p>\n</p>\n", "\n<p>\n'You just <em>have</em> to try the cheesecake,' he said. 'Ever since it appeared in</p>\n", "\n<p>\n<strong>Food & Wine</strong> this place has been packed every night.</p>\n", "\n<p>\n</p>\n", "\n<p>\n* here's</p>\n", "\n<p>\n* an</p>\n", "\n<p>\n* unordered</p>\n", "\n<p>\n* list</p>\n", "\n<p>\n</p>\n", "\n<p>\n1. here's</p>\n", "\n<p>\n2. an</p>\n", "\n<p>\n3. ordered</p>\n", "\n<p>\n4. list</p>\n"]
  end

  def link!
  end

  def unordered_list!
    @document.each do |line|
      line.gsub!(/\\n<p>\\n\*/, "<ul>\n<li>")
      line.gsub!(/<\/p>/, "</li>\n</ul>")
    end
    self
  end

  def ordered_list!
  end

  def format
    self.paragraph!.hash!.star!.join(" ")  # => "<h1> My Life in Desserts</h1>\n \n<p>\n</p>\n <h2> Chapter 1: The Beginning</h2>\n \n<p>\n</p>\n \n<p>\n'You just <em>have</em> to try the cheesecake,' he said. 'Ever since it appeared in</p>\n \n<p>\n<strong>Food & Wine</strong> this place has been packed every night.</p>\n \n<p>\n</p>\n \n<p>\n* here's</p>\n \n<p>\n* an</p>\n \n<p>\n* unordered</p>\n \n<p>\n* list</p>\n \n<p>\n</p>\n \n<p>\n1. here's</p>\n \n<p>\n2. an</p>\n \n<p>\n3. ordered</p>\n \n<p>\n4. list</p>\n"
  end

end

x = "# My Life in Desserts

## Chapter 1: The Beginning

'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in
**Food & Wine** this place has been packed every night.

* here's
* an
* unordered
* list

1. here's
2. an
3. ordered
4. list"  # => "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\n'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in\n**Food & Wine** this place has been packed every night.\n\n* here's\n* an\n* unordered\n* list\n\n1. here's\n2. an\n3. ordered\n4. list"

chizel = Chizel.new(x)  # => #<Chizel:0x007ff959181050 @document=["# My Life in Desserts", "", "## Chapter 1: The Beginning", "", "'You just *have* to try the cheesecake,' he said. 'Ever since it appeared in", "**Food & Wine** this place has been packed every night.", "", "* here's", "* an", "* unordered", "* list", "", "1. here's", "2. an", "3. ordered", "4. list"]>
chizel.format           # => "<h1> My Life in Desserts</h1>\n \n<p>\n</p>\n <h2> Chapter 1: The Beginning</h2>\n \n<p>\n</p>\n \n<p>\n'You just <em>have</em> to try the cheesecake,' he said. 'Ever since it appeared in</p>\n \n<p>\n<strong>Food & Wine</strong> this place has been packed every night.</p>\n \n<p>\n</p>\n \n<p>\n* here's</p>\n \n<p>\n* an</p>\n \n<p>\n* unordered</p>\n \n<p>\n* list</p>\n \n<p>\n</p>\n \n<p>\n1. here's</p>\n \n<p>\n2. an</p>\n \n<p>\n3. ordered</p>\n \n<p>\n4. list</p>\n"
