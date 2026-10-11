# Student Registry

A Solidity smart contract for managing student records and grades on the Ethereum Virtual Machine (EVM).

This mini project applies core Solidity concepts through a practical example, including structs, mappings, arrays, functions, constructors, modifiers, and state variables.

## Overview

The Student Registry allows the contract owner to register students, update their names, and record grades. Each student is identified by an Ethereum address, while an automatically assigned ID distinguishes their record.

The project was built as part of a hands-on Solidity learning journey to connect individual language concepts into a single working contract.

## Features

- Register students using unique Ethereum addresses.
- Assign sequential student IDs automatically.
- Update student names.
- Record multiple grades for each student.
- Validate student addresses, names, and grades.
- Retrieve student information and grade history.
- Check whether an address is registered.
- Track the total number of students and retrieve registered addresses by index.
- Restrict administrative operations to the contract owner.

## Concepts Practiced

- **Structs:** Group student IDs, names, grades, and registration status.
- **Mappings:** Associate Ethereum addresses with student records.
- **Arrays:** Store student addresses and multiple grades.
- **Functions:** Implement registration, updates, grade management, and read operations.
- **Constructor:** Set the contract owner during deployment.
- **Modifiers:** Restrict administrative functions.
- **State Variables:** Store persistent contract data.
- **Data Locations:** Use `storage` for existing records and `memory` for temporary input and returned data.
- **Validation:** Use `require` to reject invalid operations.
- **Visibility and Mutability:** Apply appropriate visibility and `view` declarations.

## Contract Functions

| Function | Purpose | Access |
|---|---|---|
| `registerStudent` | Register a new student | Owner only |
| `updateStudentName` | Update a student's name | Owner only |
| `addGrade` | Add a grade from 0 to 100 | Owner only |
| `getStudentInfo` | Read ID, name, and grade count | Public |
| `getStudentGrades` | Retrieve a student's grades | Public |
| `isStudentRegistered` | Check registration status | Public |
| `getStudentCount` | Return the number of registered students | Public |
| `getStudentAddress` | Retrieve a registered address by index | Public |

## How to Run

1. Open `StudentRegistry.sol` in Remix IDE.
2. Select a Solidity compiler compatible with `^0.8.31`.
3. Compile the contract.
4. Deploy it using Remix VM for local testing.
5. Use the account that deployed the contract as the owner.
6. Register a student using a test address and a name.
7. Add grades and retrieve the student's information.
8. Try calling an owner-only function from another account to verify that access control works.

## Example Workflow

1. Deploy the contract.
2. Register a student with an Ethereum address and a name.
3. Add grades such as 90 and 85.
4. Retrieve the student's details and grade history.
5. Update the student's name.
6. Attempt an administrative operation from a different account and verify that it reverts.

## Design Notes

A mapping provides efficient lookup by student address, while the separate address array makes it possible to track and enumerate registered students.

The `exists` field distinguishes a registered student from an unregistered address. The grade limit is defined by the `MAX_GRADE` constant.

Administrative functions are restricted to the owner. Read functions remain publicly accessible.

## Limitations and Security Considerations

This is an educational project, not a production-ready student information system.

- Student names, grades, and other blockchain state must be treated as publicly observable, even when a mapping is declared `private`.
- Only test data should be used. Sensitive or real student records should not be placed on a public blockchain.
- The owner has administrative control over registration and grade updates.
- The contract has not undergone a professional security audit.
- Automated tests and broader security reviews are needed before any real-world use.

## Project Structure

- `StudentRegistry.sol`: The smart contract implementation.
- `README.md`: Project documentation, features, usage, and design notes.

## License

This project is released under the MIT License.