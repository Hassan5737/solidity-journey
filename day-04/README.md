# Global Variables

Solidity provides built-in global variables that give information about the current transaction, call, and block.

Some important examples:

- `tx.origin` — The original externally owned account (EOA) that started the transaction.
- `msg.sender` — The immediate caller of the current function.
- `msg.value` — The amount of Ether sent with the current call, measured in wei.
- `block.timestamp` — The timestamp of the current block.
- `block.number` — The number of the current block.

These variables are available globally inside Solidity contracts and provide useful context about the current execution.

A key distinction to remember:

`tx.origin` → original transaction sender

`msg.sender` → immediate caller