require_relative './chizel.rb'  # => true
#
# input_file  = ARGV[0]                # => nil
# output_file = ARGV[1]                # => nil
# markdown    = File.read(input_file)  # ~> TypeError: no implicit conversion of nil into String
# html        = Chizel.new(markdown)
# html.format
# File.write(output_file, html)

html = Chizel.new(File.read(ARGV[0]))
File.write(ARGV[1], html.format)


# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/levkravinsky/Desktop/chiselatom/lib/chizelIO.rb:5:in `read'
# ~> /Users/levkravinsky/Desktop/chiselatom/lib/chizelIO.rb:5:in `<main>'
