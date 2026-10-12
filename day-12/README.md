# Solidity Events

## Introduction

Events allow smart contracts to emit logs that external applications can observe.

They are useful for tracking important actions such as student registration, token transfers, or ticket purchases.

## How Events Work

An event is declared inside a contract and emitted when a specific action occurs.

- `event` declares the event's name and parameters.
- `emit` writes an event log during execution.
- The transaction receipt contains the logs emitted by the contract.
- External applications can listen for events or query logs to track contract activity.

## Why Use Events?

Events help applications track contract activity without repeatedly reading the contract's state.

For example, a frontend can listen for a `TicketSold` event to display a purchase notification.

Events are logs, not a replacement for contract storage. A smart contract cannot read past event logs directly as if they were ordinary state variables.

## Indexed Parameters

The `indexed` keyword makes an event parameter searchable through event-log topics.

For a non-anonymous event, up to three parameters can be indexed, in addition to the event signature topic.

Indexed parameters are useful for filtering logs by values such as an account address or an ID.

For dynamic types such as strings, indexed values are represented by a hash in the topics rather than the original readable value.

## Key Takeaways

- Declare events with `event`.
- Emit them with `emit`.
- Use event logs to observe contract activity.
- Use `indexed` for parameters that applications may need to filter by.
- Events do not make blockchain data private.