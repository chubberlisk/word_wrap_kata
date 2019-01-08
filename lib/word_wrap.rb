# The Word Wrap Kata
#
# Design a word_wrap function, which takes a string
# and a number for the maximum length of a line.
#
# Return the string, broken up by newlines, so that
# each line is no longer than the max length. Prefer
# to break words on spaces.

def word_wrap(str, max_len)
  return str if str.length <= max_len
  break_col = str[0...max_len].rindex(' ') || max_len
  str[0...break_col].strip << "\n" <<  word_wrap(str[break_col..-1].strip, max_len)
end