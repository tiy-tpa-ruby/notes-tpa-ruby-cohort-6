
scores = [100, 50, 12, 34]

total = 0
scores.each do |score|
  total = total + score
end

total = scores.inject { |accumulator, element| accumulator + element }
total = scores.inject (                                   "+"        )

multi = scores.inject { |accumulator, element| accumulator * element }
multi = scores.inject (                                   "*"        )

p total
p multi
