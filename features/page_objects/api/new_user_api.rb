# encoding: utf-8
# language:pt

class NewUserApi
    def data_new_user
        @body = {
            admissao: "26/01/2020",
            cargo: "tester",
            comissao: "550.00,00",
            cpf: "158.324.278-31",
            departamentoId: 1,
            nome: "Rosilda",
            salario: "150000.00,00",
            sexo: "f",
            tipoContratacao: "pj"
        }
    end

    def data_new_user_invalid(admissao, cargo, comissao, cpf, nome, salario, sexo, departamento, tipocontratacao)
        @body = {
            admissao: admissao,
            cargo: cargo,
            comissao: comissao,
            cpf: cpf,
            departamentoId: departamento,
            nome: nome,
            salario: salario,
            sexo: sexo,
            tipoContratacao: tipocontratacao
        }
    end

    def post_data(url)
        @response = HTTParty.post(
            "#{$baseurl_api}#{url}",
            basic_auth: {
                username: "inmetrics",
                password: "automacao",
    
            },
            headers: { 
                "Content-Type" => 'application/json'
            },
            body: @body.to_json
        )
    end

    def response_code
        @response.code
    end

    def response_data
        @response
    end

    def record_user_response
        record_user_response = YAML.load(File.read(%-#{Dir.pwd}/features/support/data/test_data.yaml-))
        record_user_response["last_id_user_api"]["nome"] = @response['nome']
        record_user_response["last_id_user_api"]["cpf"] = @response['cpf']
        record_user_response["last_id_user_api"]["id"] = @response['empregadoId']

        File.open("#{Dir.pwd}/features/support/data/test_data.yaml", 'w') {
            |f| f.write record_user_response.to_yaml 
        }
    end
end
  