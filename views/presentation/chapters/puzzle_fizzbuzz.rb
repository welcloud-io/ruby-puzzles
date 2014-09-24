#encoding: utf-8

MIME_TYPE_PUZZLE =
%Q{
<div style="font-size: 0.55em">
<p>
<h2>
Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” 
instead of the number and for the multiples of five print “Buzz”. 
For numbers which are multiples of both three and five print “FizzBuzz”.
</h2>
</p>

<p>
<h2>
Ecrire un programme qui affiche les nombres de 1 à 100. Mais pour les multiples de trois 
affichez "Fizz" à la place du nombre et pour les multiples de cinq affichez "Buzz".
Pour les nombres qui sont à la fois multiples de trois et cinq, affichez "FizzBuzz".
</h2>
</p>


<p>
<h2>
EXEMPLE :
</br>
</br>
1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz, 16, 17,..
</h2>
</p>

</div>
}

SOLUTION =
%Q{
class FizzBuzz
  def translate_number(number)
      if number.modulo(3) == 0 and number.modulo(5) == 0 then
        return "FizzBuzz"
      elsif number.modulo(3) == 0 then 
        return "Fizz" 
      elsif number.modulo(5) == 0 then
        "Buzz"
      else
        return number 
      end
  end
  
  def evaluate(range)
    range.to_a.map do |number|
      translate_number(number)
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
    FizzBuzz.new.evaluate(1..3)
  end

  def test02
    assert_equal [
      1, 
      2,
      "Fizz", 
      4, 
      "Buzz"], 
    FizzBuzz.new.evaluate(1..5)
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
      FizzBuzz.new.evaluate(1..15)
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
      FizzBuzz.new.evaluate(1..15)
  end   

end
}

$slides += [
Slide.new(
  :subtitle => "FIZZBUZZ", 
  :section => [
    "#{ MIME_TYPE_PUZZLE}"
  ],
),  
Slide.new(
  :subtitle => "FIZZBUZZ TDD (One Step)", 
  :section => [
    "#{ MIME_TYPE_PUZZLE}"
  ],
  :code_to_add => TESTS_NIVEAU_2
),
Slide.new(
  :subtitle => "FIZZBUZZ TDD (Three Steps)", 
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