require_relative '../Scrabble'
require 'awesome_print'

class Scrabble::Scoring

  def self.scoring(word)
    if word.class != String || word.length > 7
      raise ArgumentError
    end
    word_array = word.upcase.split(//)
    points = 0
    i = 0
    word_array.each do
      letter = word_array[i]
      if Scrabble::LETTER_POINTS[letter] == nil # if there's no key raise the Argument
        raise ArgumentError
      end
      points += Scrabble::LETTER_POINTS[letter]
      i += 1
    end
    if word.length == 7
      points += 50
    end
    return points
  end


  def self.highest_score_from(array_of_words)
    #This finds the word that has the highest score
    max = 0
    best_word = ""
    array_of_words.each do |wrd|
      if scoring(wrd) > max
        max = scoring(wrd)
        best_word = wrd
      elsif scoring(wrd) == max #same points; winner should be shorter word
        if wrd.length < best_word.length
          best_word = wrd
        end
      end
    end
    return best_word.upcase
  end

end

class Scrabble::Player
  attr_accessor :name
  def initialize(name)
    @array_of_words = []
    @name = name
    @won = false
    @player_total_score = 0
  end

  def play(word) #Adds the input word to the plays Array
    return false if @won == true #Returns false if player has already won
    @array_of_words << word
    return Scrabble::Scoring.scoring(word)# Returns the score of the word
  end

  def plays #Returns an Array of the words played by the player
    return @array_of_words
  end

  def total_score #Returns the sum of scores of played words
    words = self.plays
    words.each do |word|
      a = Scrabble::Scoring.scoring(word)
      @player_total_score += a
    end
  end

  def won?
    @won = true if @player_total_score > 100
    return @won
  end

  def highest_scoring_word #Returns the highest scoring played word
    return Scrabble::Scoring.highest_score_from(@array_of_words)
  end

  def highest_word_score #Returns the highest_scoring_word score
    return Scrabble::Scoring.scoring(self.highest_scoring_word)
  end

end


bob = Scrabble::Player.new("Bob")
ap bob.name
ap bob.play("get")
ap bob.play("jazzman")
ap bob.plays
