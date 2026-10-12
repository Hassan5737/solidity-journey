# Solidity Data Locations

Solidity uses different data locations to determine where reference-type data is accessed and how long it exists.

The three main data locations are `storage`, `memory`, and `calldata`.

## 1. Storage

`storage` refers to persistent contract state.

State variables are stored persistently, and a local variable declared with the `storage` location can refer directly to existing contract data.

Modifying that reference changes the underlying state.

**Typical use:** Updating an existing array or struct stored in the contract.

## 2. Memory

`memory` is temporary data used while a function executes.

For reference types, copying data from storage into memory creates a separate in-memory copy. Changes to that copy do not update the original stored data.

Memory data is discarded after the relevant execution finishes.

**Typical use:** Temporary arrays, struct values, and string data used during calculations.

## 3. Calldata

`calldata` contains input data supplied to a function call.

It is read-only, so the function cannot modify the calldata value itself. For reference-type inputs, using calldata can avoid an unnecessary memory copy when the data only needs to be read.

**Typical use:** Reading an array passed to an external function.

## Comparison

| Property | Storage | Memory | Calldata |
|---|---|---|---|
| Lifetime | Persistent contract state | Temporary | Temporary input data |
| Can modify the data? | Yes, changes persist | Yes, changes are temporary | No |
| Typical use | Stored arrays and structs | Temporary copies | Read-only function inputs |

## Important Distinction

A local variable declared as `storage` is a reference to existing contract data, not an independent copy.

A local variable declared as `memory` can hold a separate copy. Updating the copy does not automatically update the contract's stored value.

## Key Takeaways

- Use storage when you need to work directly with persistent contract data.
- Use memory for temporary, modifiable data.
- Use calldata for read-only function inputs when appropriate.
- Choose the data location based on the behavior required, not just the variable's type.