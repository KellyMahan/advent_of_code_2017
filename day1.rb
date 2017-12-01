def day1(number)

  @val=0
  @lastnumber = "*"
  @numberarray = number.split("")
  @numberarray.each do |n|
    if @lastnumber==n
      @val += n.to_i
    end
    @lastnumber=n
  end
  if @numberarray[0]==@numberarray.last
    @val+=@numberarray[0].to_i
  end
  return @val
end

def day1_2(number)

  @val=0
  @numberarray = number.split("")
  length = @numberarray.count
  @numberarray.each_with_index do |n,i|
    loopspot = (i <= length/2) ? length/2 : -1*length/2
    if n==@numberarray[i+loopspot]
      @val += n.to_i
    end
  end
  return @val
end

def day1_alternative(number)
  @val=0
  @numberarray = number.split("")
  @numberarray.each_cons(2) do |a|
    if a[0]==a[1]
      @val+=a[0].to_i
    end
  end
  if @numberarray[0]==@numberarray.last
    @val+=@numberarray[0].to_i
  end
end

