#language: pt
# Author: Marcelo Ribelato
# Version: 1.0

@Correios @regressivo
Funcionalidade: Calcular o valor do Frete.
  A fim de calcular o valor do frete
  Eu como usuario da api dos correios envio request com dados de origem e destino e caracteristicas do
  Para saber o valor do frete e tempo de entrega

  @frete
  Cenario: Calculando o valor do frete com dados validos
    Dado que possuo um token valido
    Quando envio um request com dados validos
    Entao o valor do frete deve ser calculado
    E o status code deve ser 200

  @freteDataTable
  Cenario: Calculando valor do frete com dados validos usando DataTable
    Dado que possuo um token valido
    Quando envio um request com dados validos datatable
      | sCepOrigem | sCepDestino | nVlPeso | nVlComprimento | nVlAltura | nVlLargura |
      | 74371520   | 13175613    | 1.00    | 36.00          | 18.00     | 12.00      |
    Então o valor do frete deve ser "31,00"
    E o status code deve ser 200

  @freteEsquemaDeCenario
  Esquema do Cenario: Calculando valor do frete com dados validos Esquema de Cenario
    Dado que possuo um token valido
    Quando envio um request com dados "<sCepOrigem>", "<sCepDestino>"
    Entao o valor do frete deve ser "<valorFrete>"
    E o status code deve ser 200

    Exemplos:
      | sCepOrigem | sCepDestino | valorFrete |
      | 13175613   | 74371520    | 24,80      |
      | 74371520   | 13175613    | 31,00      |

  @freteEsquemaCenario
  Esquema do Cenario: Calculando valor do frete com dados validos Esquema de Cenario
    Dado que possuo um token valido
    Quando envio um request com dados "<sCepOrigem>", "<sCepDestino>"
    Entao deve ser exibida a mensagem "<msg>"
    E o status code deve ser 200

    @freteEsquemaCenarioOrigem
    Exemplos:
      | sCepOrigem | sCepDestino | msg                                                                                                    |
      | 1317561X   | 74371520    | Não foi encontrada precificação. MSG-101: O valor do(s) parâmetro(s) cepOrigem é(são) inválido(s)(-1). |

    @freteEsquemaCenarioDestino
    Exemplos:
      | sCepOrigem | sCepDestino | msg                                                                                                     |
      | 13175613   | 7437152x    | Não foi encontrada precificação. MSG-101: O valor do(s) parâmetro(s) cepDestino é(são) inválido(s)(-1). |


