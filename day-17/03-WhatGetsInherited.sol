// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ParentMembers {
    uint256 public publicValue = 10;
    uint256 internal internalValue = 20;
    uint256 private privateValue = 30;

    function publicFunction()
        public
        pure
        returns (string memory)
    {
        return "Public function";
    }

    function internalFunction()
        internal
        pure
        returns (string memory)
    {
        return "Internal function";
    }

    // Private members can be accessed inside the parent itself.
    function getPrivateValue()
        public
        view
        returns (uint256)
    {
        return privateValue;
    }

    function privateFunction()
        private
        pure
        returns (string memory)
    {
        return "Private function";
    }
}

contract ChildMembers is ParentMembers {

    // Public and internal state variables are accessible here.
    function readInheritedValues()
        public
        view
        returns (uint256, uint256)
    {
        return (publicValue, internalValue);
    }

    // Public and internal functions can be called from the child.
    function callInheritedFunctions()
        public
        pure
        returns (string memory, string memory)
    {
        return (publicFunction(), internalFunction());
    }

    // privateValue and privateFunction() cannot be accessed
    // directly from this child contract.
    // The inherited public getter can still be called.
}