// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract A {
    uint256 public value;

    // Public: callable internally and externally.
    function myFunc() public {
        value += 1;
    }

    function myFunc2() public {
        myFunc();
    }

    // External: intended for external calls.
    function myFunc3() external {
        value += 1;
    }

    // Internal: accessible within this contract and derived contracts.
    function myFunc4() internal {
        value += 1;
    }

    // Private: accessible only within contract A.
    function myFunc5() private {
        value += 1;
    }

    function callPrivateFunction() public {
        myFunc5();
    }
}

contract B is A {
    function foo() public {
        myFunc();
        myFunc4();
    }

    // myFunc5() cannot be called directly here because it is private.
}