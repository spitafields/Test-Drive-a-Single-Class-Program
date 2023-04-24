class GrammarStats
  def initialize
    @num_good = 0
    @num_total = 0
  end

  def check(text) 
    capitalized = text[0] == text[0].upcase
  sentence_ending_punctuation = ".?!"

  if capitalized && sentence_ending_punctuation.include?(text[-1])
    @num_good += 1
  else
    @num_total += 1
    capitalized && sentence_ending_punctuation.include?(text[-1])
  end

  def percentage_good
    if @num_total == 0
      return 0
    else
      return (@num_good.to_f / @num_total * 100).round
    end
  end
end
