# trabalho2.rb
require_relative 'estrategias'
require_relative 'produtos'
require_relative 'carrinho_de_compras'

# Exibir produtos disponíveis
puts "Produtos disponíveis:"
PRODUTOS.each { |nome, valor| puts "#{nome}: #{format('%.2f', valor)} reais" }

puts "======================================="
puts "\n"

# Adicionar itens dinamicamente
carrinho = CarrinhoDeCompras.new

puts "Deseja adicionar itens ao carrinho? (s/n)"
resposta = gets.chomp.downcase

while resposta == 's'
  puts "Digite o nome do produto que deseja adicionar:"
  escolha_produto = gets.chomp.capitalize

  if PRODUTOS.key?(escolha_produto)
    carrinho.adicionar_item(escolha_produto, PRODUTOS[escolha_produto])
    puts "#{escolha_produto} adicionado ao carrinho."
    puts "======================================="
    puts "\n"
  else
    puts "Produto inválido. Por favor, escolha um produto válido."
    puts "======================================="
    puts "\n"
  end

  puts "Deseja adicionar mais itens ao carrinho? (s/n)"
  resposta = gets.chomp.downcase
  puts "\n"
end

unless carrinho.instance_variable_get(:@itens).empty?
    # Escolher estratégias
    puts "Escolha a estratégia de desconto (Padrao, Silver, ou Gold):"
    carrinho.desconto_strategy = Desconto.const_get(gets.chomp.capitalize)
    puts "\n"

    puts "Escolha a estratégia de pagamento (Cartao ou Boleto):"
    estrategia_pagamento = Pagamento.const_get(gets.chomp.capitalize)
    puts "\n"

    # Exibir resultados
    total_com_desconto = carrinho.calcular_valor_com_desconto
    pagamento_processado = carrinho.processar_pagamento(estrategia_pagamento).to_f
    puts "\n"

    puts "Itens no carrinho:"
    carrinho.instance_variable_get(:@itens).each { |item| puts "#{item[:nome]}: #{format('%.2f', item[:valor])} reais" }
    puts "\nTotal com desconto: #{format('%.2f', total_com_desconto)} reais"
    puts "Processando pagamento: #{format('%.2f', pagamento_processado)} reais"

else
    puts "\n"
    puts "xxxxxxxxxxxxxxxx"
    puts "compra cancelada"
    puts "xxxxxxxxxxxxxxxx"
end