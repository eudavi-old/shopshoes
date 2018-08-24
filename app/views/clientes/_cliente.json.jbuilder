json.extract! cliente, :id, :cpf, :nome, :data_nasc, :login, :senha, :cep, :logradouro, :debito, :num_logradouro, :bairro, :cidade, :uf, :pais, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
