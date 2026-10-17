## Summary

Explain the purpose of this change and the agent behavior it adds, changes or fixes.

## Validation

- [ ] `bash scripts/check-public-tree.sh` passes.
- [ ] When a Claude Code manifest changed: `claude plugin validate --strict .` passes.
- [ ] I installed the changed plugin or skill in the agents listed below and describe what I tested.

Agents and versions tested:

## Contract

Confirm that every command, flag, MCP tool and documentation page mentioned in the change exists in the current BladeCP CLI, BladeCP MCP or BladeCP Developers documentation.

## Security and privacy

Confirm that the change does not expose credentials, customer data or other sensitive information, and that the skills still never ask for a key in the chat or approve, cancel or retry a migration without an explicit instruction.
