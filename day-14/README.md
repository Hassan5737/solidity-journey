# Student Result Checker

A beginner-friendly Solidity smart contract for managing student records and checking academic results.

This mini project applies Solidity fundamentals through a simple, practical use case. It was built as part of my ongoing Solidity learning journey.

## Overview

The Student Result Checker allows an administrator to register students, update their grades, and retrieve their academic results using each student's wallet address.

A student passes when their grade is 50 or higher. Otherwise, the result is marked as failed.

## Features

- Register students with a name, wallet address, and grade.
- Assign a registration status to each student.
- Prevent duplicate student registrations.
- Validate wallet addresses and student names.
- Restrict registration and grade updates to the contract owner.
- Update the grade of an existing student.
- Retrieve a student's name, grade, and result status.
- Enforce a grade range from 0 to 100.

## Concepts Practiced

- **Structs:** Group related student information into a single data structure.
- **Mappings:** Associate wallet addresses with student records.
- **State Variables:** Store student records and the contract owner.
- **Constructor:** Set the owner during contract deployment.
- **Modifiers:** Restrict administrative functions to the owner.
- **Functions:** Register students, update grades, and retrieve results.
- **Require Statements:** Validate inputs and reject invalid operations.
- **Visibility and Mutability:** Control function access and distinguish read operations from state-changing operations.
- **Conditional Logic:** Determine whether a student passes or fails.

## How to Run

1. Open `StudentResultChecker.sol` in Remix IDE.
2. Select a Solidity compiler compatible with `^0.8.31`.
3. Compile the contract.
4. Deploy it using Remix VM.
5. Register a student using a test wallet address, name, and grade.
6. Update the student's grade if needed.
7. Call `getResult` with the student's address to retrieve the name, grade, and result status.
8. Test invalid inputs and access restrictions using different Remix VM accounts.

## Result Rules

| Grade | Result |
|---|---|
| 50 to 100 | Passed |
| 0 to 49 | Failed |

## Testing

The contract was tested in Remix, including student registration, duplicate registration rejection, input validation, grade updates, result retrieval, and owner-only access restrictions.

## Limitations

This is an educational project intended to practice Solidity fundamentals. It is not a production-ready academic records system.

Blockchain data can be publicly inspected, even when a mapping is declared `private`. Only test data should be used. The contract has not undergone a professional security audit.

## License

This project is released under the MIT License.