// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// Abstract contracts cannot be deployed directly.
abstract contract Shape {

    // Declares a function that derived contracts must implement.
    function area()
        public
        view
        virtual
        returns (uint256);
}

// Rectangle provides the implementation of area().
contract Rectangle is Shape {
    uint256 public width;
    uint256 public height;

    constructor(uint256 _width, uint256 _height) {
        width = _width;
        height = _height;
    }

    function area()
        public
        view
        override
        returns (uint256)
    {
        return width * height;
    }
}