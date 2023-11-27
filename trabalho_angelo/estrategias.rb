
module Estrategia
    class Base
      def processar(valor)
        raise NotImplementedError, "#{self.class} deve implementar o método 'processar'."
      end
    end
  
    class Desconto < Base
      def calcular(valor)
        raise NotImplementedError, "#{self.class} deve implementar o método 'calcular'."
      end
    end
  
    class Pagamento < Base
      def processar(valor)
        raise NotImplementedError, "#{self.class} deve implementar o método 'processar'."
      end
    end
  end
  
  # Estratégias de desconto
  module Desconto
    module Padrao
      def self.calcular(valor)
        valor
      end
    end
  
    module Silver
      def self.calcular(valor)
        valor * 0.9
      end
    end
  
    module Gold
      def self.calcular(valor)
        valor * 0.8
      end
    end
  end
  
# Estratégias de pagamento
module Pagamento
  module Cartao
    def self.processar(valor)
      format('%.2f', valor)
    end
  end

  module Boleto
    def self.processar(valor)
      format('%.2f', valor)
    end
  end
end
  