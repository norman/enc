# encoding: utf-8
require "active_support"
require "active_support/inflector"
require "unicode"

strings = ["ã", "ç", "ê", "ó"]
strings2 = ["ø", "ß", "œ"]

class String

  def to_ascii1
    # You'll often see this recommended as a way to "asciify" characters by
    # stripping off accent marks. It works ok for Portuguese, but isn't a good
    # general solution because many common Latin characters don't decompose.
    Unicode.normalize_D(self).gsub(/[^\x00-\x7F]/, '')
  end

  def to_ascii2
    # Instead, use a library that has transliteration tables to map the
    # characters to a reasonable ASCII representation.
    ActiveSupport::Inflector.transliterate(self).to_s
  end
end

# FAIL
p strings.map &:to_ascii1
p strings2.map &:to_ascii1

# OK
p strings.map &:to_ascii2
p strings2.map &:to_ascii2
