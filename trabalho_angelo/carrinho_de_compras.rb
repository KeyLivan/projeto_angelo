
class CarrinhoDeCompras
    attr_accessor :desconto_strategy
  
    def initialize
      @itens = []
    end
  
    def adicionar_item(nome, valor)
      @itens << { nome: nome, valor: valor }
    end
  
    def calcular_valor_com_desconto
      total = @itens.sum { |item| item[:valor] }
      @desconto_strategy.calcular(total)
    end
  
    def processar_pagamento(pagamento_strategy)
      pagamento_strategy.processar(calcular_valor_com_desconto)
    end
  end
  