# Solidity Functions

Functions define the operations a smart contract can perform. They can receive inputs, read or update contract state, and return values.

## 1. Function Basics

A Solidity function generally consists of:

- `function` — declares a function.
- Function name — identifies the operation.
- Parameters — receive input values.
- Visibility — determines how the function can be accessed.
- State mutability — describes how the function interacts with state and Ether.
- `returns` — declares the return type.
- Function body — contains the code to execute.

For example, a setter updates a state variable, while a getter returns its current value.

## 2. Function State Mutability

State mutability describes what a function is allowed to do.

- `view` — can read contract state but cannot modify it.
- `pure` — cannot read or modify contract state.
- `payable` — allows a function to receive Ether.
- Default (nonpayable) — a function without a mutability keyword cannot receive Ether.

A regular function without `view` or `pure` can modify contract state when its logic requires it.

## 3. Function Visibility

Visibility determines where a function can be accessed.

| Visibility | Same Contract | Derived Contract | External Calls |
|---|---|---|---|
| `public` | Yes | Yes | Yes |
| `external` | Not directly by name | Not directly by name | Yes |
| `internal` | Yes | Yes | No |
| `private` | Yes | No | No |

Important notes:

- `public` functions can be called internally and externally.
- `external` functions are intended for external calls. A contract can call one through `this.functionName()`, which makes an external call.
- `internal` functions are available within the contract and derived contracts.
- `private` functions are accessible only within the contract where they are defined.

Visibility controls access to functions; it does not make on-chain data secret.

## 4. Function Modifiers

Modifiers add reusable checks or behavior to functions.

They are useful for conditions such as checking the caller, validating an address, or requiring a minimum payment.

The special placeholder `_;` marks where the modified function's body executes. Statements before it run before the function body; statements after it run after the body completes successfully.

## 5. Constructor

A constructor is a special function that runs once when a contract is deployed.

It is commonly used to initialize state variables, such as assigning the deployer's address as the contract owner using `msg.sender`.

## Key Takeaways

- Functions define contract behavior.
- Visibility controls access.
- State mutability describes interaction with state and Ether.
- Modifiers provide reusable conditions and behavior.
- Constructors initialize contracts during deployment.