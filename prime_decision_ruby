#素数判定: 1とその数自身以外には約数がない正の整数を抽出する

num_range = Range.new(-3, 300)
prime_numbers = []

num_range.each do |num|
  #整数のみかつ1は素数ではないので除外
  next if num < 2
  
  #2は素数
  if num == 2
    prime_numbers << num
    next
  end

  #2以外の偶数は除外
  next if num.even?

  #自身以外の約数があるかどうかの判定
  prime_flg = true
  prime_numbers.each do |prime|
    if num % prime == 0
      prime_flg = false
      break
    end
  end
  prime_numbers << num if prime_flg

end

#素数を出力
puts prime_numbers
