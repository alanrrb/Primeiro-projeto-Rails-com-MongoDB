# Diferente do ActiveRecord com o MongoMapper usamos inclusão ao inves de herança
class User
  include MongoMapper::Document
  
  # cada atributo deve ter o nome (como um Symbol) e seu tipo
  key :nome, String
  key :email, String
  key :nickname, String
  
  # para utilizar os Helper do ActionView é importante sobrescrever o metodo "to_s"
  def to_s
    self._id
  end
end

class User 
  REGEX_EMAIL = /[a-zA-Z0-9_.]+@([a-z0-9_]+\.)+[a-z]{2,5}\z/
  # obrigatoriedade +++++++++++++++++++++++++++++++++++++
  validates_presence_of :nome
  validates_presence_of :nickname
  # validando o formato +++++++++++++++++++++++++++++++++
  # nao use essa REGEX em seus projetos, é mto simples!!!
  validates_format_of :email, :with => REGEX_EMAIL, :allow_blank => false
end