require_relative 'spec_helper.rb'
require_relative '../lib/scrabble.rb'

describe 'Testing Score' do

  it 'Correct points given' do
    expect( Scrabble::Scoring.scoring('QI')).must_equal(11)
    expect( Scrabble::Scoring.scoring('JAZZMAN')).must_equal(84)
    expect( Scrabble::Scoring.scoring('jazzman')).must_equal(84)
  end

  it 'Must raise an ArgumentError' do
    # if given a non-string:
    expect (proc {Scrabble::Scoring.scoring(4)}).must_raise ArgumentError
    # if given a combination of String & Fixnum
    expect (proc {Scrabble::Scoring.scoring('4J')}).must_raise ArgumentError
    #if a word longer than 8 characters is entered' do
    expect (proc  {Scrabble::Scoring.scoring('elizabethtown')}).must_raise ArgumentError
  end

end

describe 'Testing Player' do # Wave 2
  it 'Player name should return players name' do
    expect (Scrabble::Player.new("Miriam").name).must_equal("Miriam")
  end

  it 'play(word) returns the score of the word' do
    bob = Scrabble::Player.new("Bob")
    expect (bob.play("get")).must_equal(4)
    expect (bob.play("jazzman")).must_equal(84)
  end

  it 'play(word thats too long) raises ArgumentError' do
    joe = Scrabble::Player.new("Joe")
    expect (joe.play("more words")).must_raise ArgumentError
  end

  it 'all plays function' do
    bob = Scrabble::Player.new("Bob")
    bob.play("get")
    bob.play("jazzman")
    expect (bob.plays).must_equal(["get","jazzman"])
  end

end
