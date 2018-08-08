json.extract! funcionario, :id, :cpf, :nome, :salario, :data_nasc, :login, :senha, :cep, :logradouro, :num_logradouro, :bairro, :cidade, :uf, :pais, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
