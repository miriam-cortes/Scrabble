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

  it 'The array ["qi", "jazzman"] should return jazzman' do
    expect (Scrabble::Scoring.highest_score_from(["qi","jazzman"])).must_equal("JAZZMAN")
  end

  # it 'The array ["qi", "jazzman"] should return jazzman' do
  #   expect (Scrabble::Scoring.highest_score_from(["qi","jazzman"])).mmust_equal("JAZZMAN")
  # end

end
