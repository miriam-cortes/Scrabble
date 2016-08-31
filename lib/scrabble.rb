require_relative '../Scrabble'
require 'awesome_print'

class Scrabble::Scoring
  @@hash_of_scores = {} # This will hold all the scores and words (words= keys; points = values)


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
    # hash_of_scores = {} #not sure if this needs to be a class variable or not

    #This makes a hash of the words => scores
    array_of_words.each do |word|
      @@hash_of_scores["#{word}"] = "#{scoring(word)}".to_i
    end

    #This finds the word that has the highest score
    max = 0
    best_word = ""
    @@hash_of_scores.each do |wrd,sco|
      max = sco if sco > max
      best_word = wrd if sco == max
    end

    return best_word.upcase
  end


end



# puts Scrabble::Scoring.scoring("poop")
# the_array = ["qui","qi","jazzman"]
# ap Scrabble::Scoring.highest_score_from(the_array)
