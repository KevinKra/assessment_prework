require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/passenger.rb"

class PassengerTest < Minitest::Test
  def setup
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18}) 
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})    
  end

  def test_it_exists
    assert_instance_of Passenger, @charlie
  end

  def test_it_has_access_to_attributes
    assert_equal "Charlie", @charlie.name
  end

  def test_it_can_detect_adults
    assert_equal true, @charlie.adult?
    assert_equal false, @taylor.adult?
  end

  def test_drivers_are_false_by_default
    assert_equal false, @charlie.driver?
  end

  def test_we_can_determine_a_driver
    assert_equal false, @charlie.driver?
    @charlie.drive
    assert_equal true, @charlie.driver?
  end
end