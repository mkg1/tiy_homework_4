require 'byebug'

class DifferentCurrencyCodeError < StandardError
end

class Currency
  def initialize (amount, code)
    @amount = amount
    @code = code
  end

  def amount
    @amount
  end

  def code
    @code
  end

  def ==(other)
    if @code == other.code && @amount == other.amount
      return true
    else
      raise DifferentCurrencyCodeError, "Not equal"
      return false
    end
  end

  def +(other)
    if @code == other.code
      return @amount + other.amount
    else
      raise DifferentCurrencyCodeError, "Can't add different currencies directly"
    end
  end

  def -(other)
    if @code == other.code
      return @amount - other.amount
    else
      raise DifferentCurrencyCodeError, "Can't subtract different currencies directly"
    end
  end

  # def method that lets you mutliply * by a float
  # end
end


wad1 = Currency.new(2, "$")
wad2 = Currency.new(1, "$")
puts "You have #{wad1.amount}#{wad1.code}"
#puts wad1 + wad2
begin
  puts wad1 == wad2
ensure
  puts wad1 + wad2
  puts wad1 - wad2
end
# # method
# # 5usd * 2 = 10usd, not ¥
# #
# # 5usd + 800¥ = ERROR
#
# my_money == other_money
#
#
# two = Apple.new(3)
# three = Apple.new(3)
# puts two + three #method error
#
# puts two == three #returns false
#
# puts two #puts memory location
# puts three #puts different memory location so they're not equal
# #if you put two = three, then they would point to the same spot in memory
