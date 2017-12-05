
def day3(position)
  @g =  build_graph(position)
  return @g[position-1][0].abs+@g[position-1][1].abs
end

def day3_2(position)
  val=0
  @g = build_graph(position)
  @positionarray.each_value do |x| 
    if x>=position
      val = x
      break
    end
  end
  return val
end


def max_side_length(position)
  msl = Math.sqrt(position).ceil
  if msl.even?
    msl+=1
  end
  return msl
end

def build_graph(position)
  @msl = max_side_length(position)
  @maximum = @msl**2
  @direction = :up
  @grapharray = []
  @grapharray[0]=[0,0,1]
  @positionarray = Hash.new
  @positionarray[[0,0]] = 1
  @x+=1
  (3..@msl).each do |x|
    next if x.even?
    up((x-2)**2+1, x)
  end
  return @grapharray
end

def up(start, length)
  @x=(length-1)/2
  @y=(length-1)/-2
  (0..length-2).each  do |x|
    @y+=1
    @positionarray[[@x,@y]] = neighbors(@x,@y)
    @grapharray[start+x-1]=[@x,@y,start+x]
  end
  left(start+length-1, length)
end

def left(start, length)
  (0..length-2).each  do |x|
    @x-=1
    @positionarray[[@x,@y]] = neighbors(@x,@y)
    @grapharray[start+x-1]=[@x,@y,start+x]
  end
  down(start+length-1, length)
end

def down(start, length)
  (0..length-2).each  do |x|
    @y-=1
    @positionarray[[@x,@y]] = neighbors(@x,@y)
    @grapharray[start+x-1]=[@x,@y,start+x]
  end
  right(start+length-1, length)
end

def right(start, length)
  (0..length-2).each  do |x|
    @x+=1
    @positionarray[[@x,@y]] = neighbors(@x,@y)
    @grapharray[start+x-1]=[@x,@y,start+x]
  end
end

def neighbors(x,y)
  sum = 0
  sum+=@positionarray[[x-1,y]  ]||0
  sum+=@positionarray[[x-1,y-1]]||0
  sum+=@positionarray[[x-1,y+1]]||0
  sum+=@positionarray[[x,y-1]  ]||0
  sum+=@positionarray[[x,y+1]  ]||0
  sum+=@positionarray[[x+1,y+1]]||0
  sum+=@positionarray[[x+1,y]  ]||0
  sum+=@positionarray[[x+1,y-1]]||0
  return sum
end

# puts day3(325489)
puts day3_2(325489)

  