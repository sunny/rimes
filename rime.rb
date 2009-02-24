#!/usr/bin/env ruby
# Rime
# Small cli to find rhymes. These are found using two dictionaries:
#
# - DICT: a dictionary of words and their phonetic equivalent
# - SYL: a dictionary of syllables and their phonetic equivalent
#
# Usage:
#   $ rime.rb cho
#   artichaut (arti/o)
#   poncho (pôt/o)
#   réchaud (ré/o)
#   bouchot (bu/o)
#   manchot (mâ/o)
#
# By Sunny Ripert
# Under some kind of GPL
# Thanks to bohwaz's http://tilt.eu.org/rimes/
# Using french lex from http://www.barbery.net/lebarbery/noindex/pourlesnuls-standard.htm

DICT = File.dirname(__FILE__)+'/dict.dat'
SYL = File.dirname(__FILE__)+'/syl.dat'

def words_from_file(file)
  words = {}
  open(file).each_line do |line|
    value, phonetic = line.chomp.split(' ')
    words[value] = phonetic
  end
  words
end

# save a new phonetic
if !ARGV[1].nil? and !ARGV[2].nil? and ['--add-syllable', '--add-word'].include?(ARGV[0])

  cmd, word, phonetic = ARGV
  file = cmd == "--add-word" ? DICT : SYL

  words = words_from_file(file)
  if words.has_key?(word)
    abort "Phonetic for '#{word}' already exists as '#{words[word]}' in #{file}"
  end

  open(file, 'a') { |f| f.puts "#{word} #{phonetic}" }
  puts "Saved '#{word}' phonetic in '#{file}'"
  exit

# print usage
elsif ARGV.size != 1
  abort "Usage: #{$0} rhyme\n" + \
        "       #{$0} --add-syllable syllable phonetic\n" + \
        "       #{$0} --add-word word phonetic"
end

# find the phonetic for the given rhyme
syllables = words_from_file(SYL)
words = words_from_file(DICT)
rhyme = ARGV[0]
phonetic = syllables[rhyme] || words[rhyme]

abort "No phonetic found for '#{rhyme}' (#{$0} --add-syllable #{rhyme} phonetic)" if phonetic.nil?

# print words ending with that phonetic
words.each do |w, p|
  puts "#{w} (#{p})" if p[-phonetic.length, phonetic.length] == phonetic
end

