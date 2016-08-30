require_relative 'spec_helper.rb'
require_relative '../lib/scrabble.rb'

describe 'Testing Score' do

  it 'QI => 10 + 1 = 11 points' do
    expect( Scrabble::Scoring.scoring('QI')).must_equal(11)
  end

  it 'JAZZMAN = 84 points' do
    expect( Scrabble::Scoring.scoring('JAZZMAN')).must_equal(84)
  end

  it 'jazzman = 84 points' do
    expect( Scrabble::Scoring.scoring('jazzman')).must_equal(84)
  end

  it 'Must raise an ArgumentError if given a non-string' do
    expect (proc {Scrabble::Scoring.scoring(4)}).must_raise ArgumentError
  end

  it 'Raises an ArgumentError if given a combination of String & Fixnum' do
    expect (proc {Scrabble::Scoring.scoring('4J')}).must_raise ArgumentError
  end








end
