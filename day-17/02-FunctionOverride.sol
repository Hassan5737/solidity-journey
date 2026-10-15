// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// Parent contract defining the default behavior.
contract Animal {
    function makeSound()
        public
        pure
        virtual
        returns (string memory)
    {
        return "Unknown sound";
    }
}

// Dog provides its own implementation of makeSound().
contract Dog is Animal {
    function makeSound()
        public
        pure
        override
        returns (string memory)
    {
        return "Woof";
    }
}

// Cat overrides the same inherited function differently.
contract Cat is Animal {
    function makeSound()
        public
        pure
        override
        returns (string memory)
    {
        return "Meow";
    }
}