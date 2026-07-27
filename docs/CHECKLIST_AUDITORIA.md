# Checklist Rapida de Auditoria - Fluxos de Approve/Spend

## Superficie de risco

- [ ] O contrato permite atualizar allowance diretamente de non-zero para non-zero?
- [ ] Existe algum spender que possa consumir allowance antigo durante uma transicao?
- [ ] O fluxo depende de ordem de transacoes ou mempool timing?

## Robustez do allowance

- [ ] Existe zero-reset antes de reaprovar?
- [ ] A reducao de allowance acontece antes da transferencia externa?
- [ ] O contrato trata allowance zero e valores extremos de forma consistente?

## Controle de acesso

- [ ] Somente o owner legitimo pode aprovar allowance?
- [ ] O spender tem escopo claramente definido?
- [ ] Existem caminhos alternativos que contornem a aprovacao esperada?

## Cobertura de teste

- [ ] Existe exploit de allowance race?
- [ ] Existe teste do caminho protegido com zero-reset?
- [ ] Existe negative control demonstrando reaprovar com zero funciona?
- [ ] Existe fuzz para allowance e gasto?

## Evidencia

- [ ] O resultado e reproduzivel em ambiente limpo?
- [ ] A evidencia distingue exploit, fix e controle negativo?
- [ ] A documentacao explica claramente o risco do approve direto?
