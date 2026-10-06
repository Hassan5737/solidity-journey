// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// tx.origin = the EOA that started the transaction.
// msg.sender = the immediate caller of the current function.

interface IContractB {
    function getCallers() external view returns (address, address);
}

contract A {
    function callB(address contractB)
        public
        view
        returns (address, address)
    {
        return IContractB(contractB).getCallers();
    }
}

contract B {
    function getCallers()
        public
        view
        returns (address, address)
    {
        return (msg.sender, tx.origin);
    }
}