## Teste Inmetrics

Versões utilizadas:
------------------------
ChromeDriver 85.0.4183.83
Ruby: ruby 2.5.7p206

Gems utilizadas:
-----------------
capybara
cucumber
rspec
selenium-webdriver
site_prism
pry
faker
httparty


Estrutura de pastas do projeto
------------------------------
Features:
	page_objects: Pasta definida para armazenar as pages objects referente a automação web e api.
			 api: Esta pasta tem a função de armazenar os arquivos com os principais métodos das apis.
		    page: O objetivo dessa pasta é armazenar as funções que serão utilizadas para a automação web.
	
	specs:
	  api: pasta principal para armazenar as features que por sua vez contém os bdds das apis.
	 site: pasta principal para armazer as features que por sua vez contém os bdds das páginas web.

	steps_definitions:
	  api: o objetivo dessa pasta é armazenar os steps em ruby para testes de apis
	 site: o objetivo dessa pasta é armazenar os steps em ruby para testes das páginas web. 
	 
Support: Algumas pastas e arquivos foram utilizados como destacado abaixo:
   data: contém o arquivo test_data.yaml que sua funcionalidade é armazer as massas de dados para serem utilizada nos testes
 env.rb: este arquivo é utilizado para fazer o require das gems, e também possui a configuração do apphost e baseurl_api
	     default_driver: possui a configuração do selenium_chrome
		        apphost: contém a url principal do site para realizar os testes web
		    baseurl_api: possui o link principal do serviço para realizar os testes de apis.
 
 hooks.rb:
	Este arquivo faz a referência para as classes tanto para web quanto para api instanciando as classes no Before 
	e permitindo as mesmas serem utilizadas em qualquer parte do projeto

 
 pasta report: sua funcionalidade é poder armazenar os relatórios gerados durante a execução dos testes.
 
Configuração do do arquivo cucumber.yaml
----------------------------------------
Esse arquivo possui as configurações para executar os testes em api e em web
default: configuração padrão para executar teste utilizando o navegador chrome
api_log: informa o perfil de testes que será utilizado, sendo nese caso o perfil de api
api: contém o ENVIRONMENT_TYPE_API, devemos informar a tag api para executar os testes de apis

Configuração para gerar relatório cucumber.yaml
-----------------------------------------------
<%time = Time.now.strftime('%d%m%Y_%H%M%S').to_s%>
A linha acima é utilizada para pegar a data e a hora do sistema, e adicionar no nome do relatório gerado durante os testes.

html_report_api: possui a configuração para gerar os relatórios dos testes
	--out=report/report_api_<%=time%>.html
	Irá armazenar o relatório destacando que é um relatório de api_ mais a data e a hora que foi gerado
	
html_report: possui a configuração para gerar os relatórios dos testes web. 
	Irá armazenar o relatório mais a data e a hora que foi gerado
	

Execuções para api e Web
-------------------------

API E WEB
Tag principal para execução de todos os testes: @desafio
cucumber -t @desafio

API
Tag principal para execução dos testes web: @api
Para executar os testes de api devemos informar o comando abaixo:
cucumber -p api -t@api -p html_report ou cucumber -t @api


WEB
Tag principal para execução dos testes web de funcionario: @funcionario
Para executar os testes web devemos informar o comando abaixo:
cucumber -t@funcionario -p html_report ou cucumber -t @funcionario

Tag principal para execução dos testes web de login: @login
Para executar os testes web devemos informar o comando abaixo:
cucumber -t@login -p html_report ou cucumber -t @login

Tag principal para execução dos testes web de cadastro de usuário: @cadastrar_usuario
Para executar os testes web devemos informar o comando abaixo:
cucumber -t@cadastrar_usuario -p html_report ou cucumber -t @cadastrar_usuario
