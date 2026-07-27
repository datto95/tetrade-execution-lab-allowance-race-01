# Guia do Aluno - allowance-race-01

## Objetivo

Explorar como uma atualizacao de allowance de non-zero para non-zero pode ser corrida e permitir que um spender consuma mais do que o esperado.

## Requisitos

- Foundry instalado (`forge`, `cast`, `anvil`)
- Python 3.10+

## Passo a passo

1. Compile os contratos.

   ```bash
   forge build
   ```

2. Execute os testes.

   ```bash
   forge test -vvv
   ```

3. Gere a evidencia.

   ```bash
   python3 scripts/generate_evidence.py
   ```

4. Valide a evidencia gerada.

   ```bash
   python3 scripts/generate_evidence.py --validate-only evidence/evidence.json
   ```

## O que observar

- O vault vulneravel permite troca direta de allowance de um valor nao zero para outro nao zero.
- O atacante consegue gastar o allowance antigo e depois o novo.
- O vault corrigido exige zero-reset antes de reaprovar.
- O negative control mostra que zero-reset seguido de nova aprovacao funciona.

## Testes-chave

- `testAllowanceRaceDrainsOldPlusNewOnVulnerable`
- `testFixedVaultBlocksNonZeroToNonZeroApprove`
- `testNegativeControlZeroResetThenReapproveWorks`
- `testFuzzFixedAllowanceUsage`
- `testFuzzUnauthorizedSpendFails`

## Dica

Compare a logica de `approve` nos dois contratos para entender por que o zero-reset fecha a janela de corrida.
