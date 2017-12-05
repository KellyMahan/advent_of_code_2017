def day5
  index=0
  steps = 0
  max = @input.length
  while index<=max
    move = jump(index) rescue break
    steps+=1
    index = index + move
  end
  return steps
end


def jump(i)
  offset = @input[i]
  @input[i]+=1
  return offset
end

def day5_2
  index=0
  steps = 0
  max = @input.length
  while index<=max
    move = jump_2(index) rescue break
    steps+=1
    index = index + move
  end
  return steps
end

def jump_2(i)
  offset = @input[i]
  if @input[i]>=3
    @input[i]-=1
  else
    @input[i]+=1
  end
  return offset
end
