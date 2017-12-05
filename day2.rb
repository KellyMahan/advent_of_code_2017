
def day2(sheet)
  checksums = get_rows_of_numbers(sheet) do |nums|
    nums.max - nums.min
  end
  return checksums
end

def day2_2(sheet)
  checksums = get_rows_of_numbers(sheet) do |nums|
    val = 0
    numsup = nums.sort
    numsdown = numsup[nums.length/2..-1]
    numsup = numsup - numsdown
    numsdown.reverse!
    numsdown.each do |x|
      numsup.each do |y|
        if x % y==0
          val = x/y
          break
        end
      end
      break if val!=0
    end
    val
  end
  return checksums
end

def get_rows_of_numbers(sheet)
  checksums = 0
  rows = sheet.split("\n")
  rows.each do |r|
    nums = r.split("\t").map(&:to_i)
    checksums += yield nums
  end
  return checksums
end
