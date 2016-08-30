
require_relative '../Scrabble'

class Scrabble::Scoring

  def self.scoring(word)
    if word.class != String
      raise ArgumentError #unless word.is_a?(String)
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
  end
end

# Scrabble::Scoring.scoring("QI")
