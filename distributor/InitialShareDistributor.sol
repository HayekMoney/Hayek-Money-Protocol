pragma solidity ^0.6.0;

import '@openzeppelin/contracts/math/SafeMath.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

import '../interfaces/IDistributor.sol';
import '../interfaces/IRewardDistributionRecipient.sol';

contract InitialShareDistributor is IDistributor {
    using SafeMath for uint256;

    event Distributed(address pool, uint256 cashAmount);

    bool public once = true;

    IERC20 public share;
    IRewardDistributionRecipient public daihacLPPool;
    uint256 public daihacInitialBalance;
    IRewardDistributionRecipient public daihcsLPPool;
    uint256 public daihcsInitialBalance;

    constructor(
        IERC20 _share,
        IRewardDistributionRecipient _daihacLPPool,
        uint256 _daihacInitialBalance,
        IRewardDistributionRecipient _daihcsLPPool,
        uint256 _daihcsInitialBalance
    ) public {
        share = _share;
        daihacLPPool = _daihacLPPool;
        daihacInitialBalance = _daihacInitialBalance;
        daihcsLPPool = _daihcsLPPool;
        daihcsInitialBalance = _daihcsInitialBalance;
    }

    function distribute() public override {
        require(
            once,
            'InitialShareDistributor: you cannot run this function twice'
        );

        share.transfer(address(daihacLPPool), daihacInitialBalance);
        daihacLPPool.notifyRewardAmount(daihacInitialBalance);
        emit Distributed(address(daihacLPPool), daihacInitialBalance);

        share.transfer(address(daihcsLPPool), daihcsInitialBalance);
        daihcsLPPool.notifyRewardAmount(daihcsInitialBalance);
        emit Distributed(address(daihcsLPPool), daihcsInitialBalance);

        once = false;
    }
}
