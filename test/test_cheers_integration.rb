require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "KC"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... K
Give me a... C
KC's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "Aimee"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... I
Give me a... M
Give me an... E
Give me an... E
AIMEE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_keeps_asking_for_name_when_the_name_is_nil
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts ""
        pipe.puts "Aimee"
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Please enter your name (it shouldn't be blank or have numbers)
What's your name?
Give me an... A
Give me an... I
Give me a... M
Give me an... E
Give me an... E
AIMEE's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_keeps_asking_for_name_when_the_name_is_a_number
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts ""
        pipe.puts "Aimee"
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Please enter your name (it shouldn't be blank or have numbers)
What's your name?
Give me an... A
Give me an... I
Give me a... M
Give me an... E
Give me an... E
AIMEE's just GRAND!
EOS
    assert_equal expected_output, shell_output

  end

  def test_a_name_ending_in_an_s
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts "Aimers"
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Give me an... A
Give me an... I
Give me a... M
Give me an... E
Give me a... R
Give me a... S
AIMERS is just GRAND!
EOS
    assert_equal expected_output, shell_output
  end
end
