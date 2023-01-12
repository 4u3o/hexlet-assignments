# frozen_string_literal: true

# BEGIN
def anagramm?(first, second)
  first.chars.sort == second.chars.sort
end

def anagramm_filter(word, data)
  return [] if data.empty?

  data.filter { |w| anagramm?(word, w) }
end
# END
