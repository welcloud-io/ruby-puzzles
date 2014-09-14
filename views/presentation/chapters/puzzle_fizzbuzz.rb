#encoding: utf-8

MIME_TYPE_PUZZLE =
%Q{
<div style="font-size: 0.55em">
<p>
Fizz Buzz is a game which helps children to learn and practice division.  
Children sit in a circle and count numbers incrementally,  
replacing multiple of 3 with Fizz and multiple of 5 with Buzz
</p>

EXEMPLE :
<p>
An Example of Fizz Buzz Game:
1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz, 16, 17,..
</p>

</div>
}

SOLUTION =
%Q{
class FizzBuzz
  def initialize(list_range)
    @list = list_range.to_a
  end

  def translate(number)
    return "FizzBuzz" if number.modulo(3) == 0 and number.modulo(5) == 0
    return "Fizz" if number.modulo(3) == 0
    return "Buzz" if number.modulo(5) == 0
    number
  end

  def list
    @list.map do |number|
      translate(number)
    end
  end
end
}

TESTS_NIVEAU_1=
%Q{
require 'test/unit'
class TestFizzBuzz < Test::Unit::TestCase

  def test01
    assert_equal [
      1, 
      2,
      "Fizz"
    ], 
    FizzBuzz.new(1..3).list
  end

  def test02
    assert_equal [
      1, 
      2,
      "Fizz", 
      4, 
      "Buzz"], 
    FizzBuzz.new(1..5).list
  end 

  def test03
    assert_equal [
      1, 
      2, 
      "Fizz", 
      4, 
      "Buzz", 
      "Fizz", 
      7, 
      8, 
      "Fizz", 
      "Buzz", 
      11, 
      "Fizz", 
      13, 
      14, 
      "FizzBuzz"], 
      FizzBuzz.new(1..15).list
  end   

end
}

TESTS_NIVEAU_2=
%Q{
require 'test/unit'
class TestFizzBuzz < Test::Unit::TestCase 

  def test01
    assert_equal [
      1, 
      2, 
      "Fizz", 
      4, 
      "Buzz", 
      "Fizz", 
      7, 
      8, 
      "Fizz", 
      "Buzz", 
      11, 
      "Fizz", 
      13, 
      14, 
      "FizzBuzz"], 
      FizzBuzz.new(1..15).list
  end   

end
}

$slides += [
Slide.new(
  :subtitle => "FIZZBUZZ TDD", 
  :section => [
    "#{ MIME_TYPE_PUZZLE}"
  ],
  :code_to_add => TESTS_NIVEAU_2
),
Slide.new(
  :subtitle => "FIZZBUZZ TDD", 
  :section => [
    "#{ MIME_TYPE_PUZZLE}"
  ],
  :code_to_add => TESTS_NIVEAU_1
),
Slide.new(
  :subtitle => "FIZZBUZZ REFACTORING",
  :section => [
    "#{ MIME_TYPE_PUZZLE}"
  ],
  :code_to_display => SOLUTION,
  :code_to_add => TESTS_NIVEAU_1
),
]