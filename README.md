# allowance-race-01

[![CI](https://github.com/datto95/tetrade-execution-lab-allowance-race-01/actions/workflows/ci.yml/badge.svg)](https://github.com/datto95/tetrade-execution-lab-allowance-race-01/actions/workflows/ci.yml)

Didactic proof of concept for the Tetrade execution lab.

This lab demonstrates the classic allowance race condition:

- vulnerable path: owner updates allowance directly from non-zero to non-zero.
- attacker can consume old allowance and then consume the new one after update ordering.
- fixed path: require zero-reset before setting a new non-zero allowance.

## Lab scope

- src/VulnerableAllowanceVault.sol: direct non-zero to non-zero allowance updates.
- src/FixedAllowanceVault.sol: safe-approve pattern with zero-reset guard.
- src/AllowanceRaceAttacker.sol: simulator for two-step allowance consumption.
- test/AllowanceRaceExploit.t.sol: exploit, fix, negative control, and fuzz tests.
- scripts/generate_evidence.py: reproducible JSON evidence generation and schema check.

## Didactic docs

- `docs/GUIA_ALUNO.md`
- `docs/GUIA_INSTRUTOR.md`
- `docs/CHECKLIST_AUDITORIA.md`
- `docs/ROTEIRO.md`

## Prerequisites

- Foundry installed (forge --version)
- Python 3.10+

## Quick start

```bash
forge build
forge test -vvv
python3 scripts/generate_evidence.py
python3 scripts/generate_evidence.py --validate-only evidence/evidence.json
```

## Expected signals

- vulnerable vault allows spending old allowance plus newly approved allowance.
- fixed vault rejects non-zero to non-zero allowance updates.
- negative control demonstrates zero-reset then re-approve works as expected.

## Useful commands

```bash
make build
make test
make gas-report
make evidence
make validate
```
