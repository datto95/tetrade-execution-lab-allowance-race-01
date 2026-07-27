# Guia do Instrutor - allowance-race-01

## Objetivo da atividade

Demonstrar o risco classico de allowance race em fluxos de approve/spend e como o padrao de zero-reset reduz a superficie de abuso.

## Roteiro sugerido

1. Apresente o vault vulneravel e a regra de allowance.
2. Mostre o ciclo de gasto do allowance antigo e do novo.
3. Execute o teste do vault corrigido.
4. Discuta o papel do zero-reset antes de reaprovar.
5. Feche com a evidencia em JSON.

## Perguntas para debate

- Por que uma atualizacao de allowance pode ser corrida?
- O que acontece se spender e owner agirem em ordens diferentes?
- O zero-reset e suficiente ou apenas mitigador?
- O negative control evita qual falso positivo?
- Como o fuzz ajuda a validar limites de allowance e gasto?

## Resultado esperado

O participante deve concluir que:

- approve direto de non-zero para non-zero e arriscado;
- zero-reset antes da nova aprovacao reduz a janela de corrida;
- testes positivos e negativos precisam coexistir;
- evidencia automatizada reduz ambiguidade na avaliacao.

## Materiais de apoio

- `README.md`
- `docs/ROTEIRO.md`
- `docs/CHECKLIST_AUDITORIA.md`
