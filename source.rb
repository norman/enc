# encoding: utf-8
# Yes, this is valid Ruby 1.9 - even though your text editor's
# syntax highlighting will probably not think so.
class Canção
  GÊNEROS = [:forró, :carimbó, :afoxé]
  attr_accessor :gênero
end
asa_branca = Canção.new
asa_branca.gênero = :forró
p asa_branca.gênero
