#encoding: utf-8
def ________________________________________________________________________________
  puts "_" * 80;
end

puts "A Quick Executable Lesson on Unicode Strings"
________________________________________________________________________________
puts "Identity with ASCII strings is pretty straightforward. If two strings *look*"
print "the same, they *are* the same. Here, does 'John' == 'John'? "

puts "John" == "John"
________________________________________________________________________________
puts "But with UTF-8 it's not so straightforward, because there are often several"
print "ways to encode non-ASCII characters. Does 'João' == 'João'? "
puts "João" == "João"
________________________________________________________________________________

print 'For example, this "ã" is made up of two bytes: '
p "ã".unpack("C*")
print 'And is a single Unicode character ("ã"): '
p "ã".unpack("U*")

________________________________________________________________________________
print 'But this "ã" has three bytes: '
p "ã".unpack("C*")
print 'And is two Unicode characters ("a" and "˜"): '
p "ã".unpack("U*")

________________________________________________________________________________
puts "This can make using UTF-8 encoded strings as hash keys risky."

users = {}
users["João"] = "authorized"
users["João"] = "not authorized"

print "How many users are in the hash we just created?\n\n"
p users

________________________________________________________________________________
print <<-EOM
Unicode libraries such as "Unicode" and "Active Support" provide support for
*normalizing* UTF-8 strings to ensure that two strings that look the same
are the same. If you're ever going to use UTF-8 characters as hash keys, or
search against them in a database, make sure you normalize them first.

EOM

begin
  puts "So let's loop through the hash keys and normalize them."
  require "unicode"
  users.keys.each do |key|
    value = users.delete(key)
    key = Unicode.normalize_KC(key)
    users[key] = value
  end
  print "Now how many users will we have? "
  p users
rescue LoadError
  puts "Oops, you don't have the unicode gem installed, so we can't run this part of the demo."
end
________________________________________________________________________________
puts "So if you only remember one thing from this presentation, remember this:"
puts "\n\nNormalizing your Unicode data before you save it!!!"
