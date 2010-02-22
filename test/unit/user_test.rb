require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "validar a presença do nome" do
    user = User.new
    user.save
    assert_equal "can't be empty", user.errors.on(:nome)
  end
  
  test "validar a presença do email" do
    user = User.new
    user.save
    assert_equal "is invalid", user.errors.on(:email)
  end
  
  test "ter o e-mail com letrar minusculas" do 
    user = User.new
    user.save
    user.email = "ALAN@EMAIL.COM"
    assert_equal "is invalid", user.errors.on(:email)
  end
  
  test "ter um email valido" do
    user = User.new
    user.save
    user.email = "123alan@email"
    assert_equal "is invalid", user.errors.on(:email)
  end
  
  test "gravar o usuario quando estiver corretamente preenchido" do
    user = User.new
    user.email = "alan@email.com"
    user.nickname = "alan"
    user.nome = "Alan"
    user.save
    assert_equal true, user.errors.empty?
  end
end