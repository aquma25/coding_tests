# フィボナッチ数列：2つ前の項と1つ前の項を足し合わせていくことでできる数列を実装
# ex: 1, 1, 2, 3, 5, 8, 13, 21…

# n番目の計算結果を出力する
def fibonacci(n)
  return 1 if n < 0
  return n if n < 2

  fibonacci(n - 2) + fibonacci(n - 1)
end

puts Range.new(1, 10).map { |num| fibonacci(num) }
