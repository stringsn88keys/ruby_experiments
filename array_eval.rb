class Module
  attr_accessor :array

	def array_accessor( *symbols )
	  self.array||=[]
	  puts symbols
	  symbols.each { |symbol|
	    self.array << symbol
	    attr_accessor symbol
	  }
	end
end

module ArrayAccessor
  def []= (index, value)
    message = self.class.array[index]
    send "#{message}=", value
  end 

  def [](index)
    message = self.class.array[index]
    send message
  end
end


class TestyTest
  include ArrayAccessor
  array_accessor :a, :b, :c
  array_accessor :d, :e, :f
end

tt = TestyTest.new
tt.a = 5
tt.b = 6
tt.c = 7

puts tt[0]
puts tt[0]

puts tt[1]
puts tt[2]
puts tt[3]
tt[3]='f'
puts tt.d
