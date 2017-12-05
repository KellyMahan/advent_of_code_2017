def day4(input)
  words_array = input.split("\n").select do |line|
    words = line.split(" ")
    words.length == words.uniq.length
  end
  return words_array.count
end

def day4_2(input)
  words_array = input.split("\n").select do |line|
    words = line.split(" ").map{|w| w.split("").sort.join}
    words.length == words.uniq.length
  end
  return words_array.count
end
