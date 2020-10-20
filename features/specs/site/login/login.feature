# encoding: utf-8
# language:pt

@desafio
@login

Funcionalidade: Login
  Eu como usuário do site
  Quero realizar login
  Para poder acessar as funcionalidades do sistema

  @realizar_login
  Cenário: Realizar login com sucesso 
    Dado que esteja na página de login do site
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @realizar_login_cabecalho
  Cenário: Realizar login com sucesso pelo link do cabeçalho
    Dado que esteja na página de login acessando pelo link do cabeçalho
    Quando preencher o usuário e senha 
    E clicar em entre
    Então deverá redirecionar para a página de empregados

  @realizar_login_usuario_invalido
  Cenário: Realizar login com usuário inválido
    Dado que esteja na página de login do site 
    Quando preencher o nome com um usuário inválido e senha correta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"

  @realizar_login_senha_incorreta
  Cenário: Realizar login com senha incorreta
    Dado que esteja na página de login do site 
    Quando preencher o usuário e a senha incorreta
    E clicar em entre
    Então deverá retornar a mensagem "ERRO! Usuário ou Senha inválidos"
