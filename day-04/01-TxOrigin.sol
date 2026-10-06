// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// tx.origin is the EOA that originally started the transaction.

contract TxOriginExample {
    function getOrigin() public view returns (address) {
        return tx.origin;
    }
}