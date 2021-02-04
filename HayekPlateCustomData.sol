
pragma solidity ^0.6.0;

contract HayekPlateCustomData {
    uint256 private aBoostPower = 50 * 1e18;
    uint256 private bBoostPower = 25 * 1e18;
    uint256 private cBoostPower = 64 * 1e17;
    uint256 private dBoostPower = 32 * 1e17;
    uint256 private eBoostPower = 16 * 1e17;
    uint256 private fBoostPower = 8 * 1e17;
    uint256 private gBoostPower = 4 * 1e17;
    uint256 private hBoostPower = 2 * 1e17;
    uint256 private iBoostPower = 1 * 1e17;

    function getTokenIdBoostPower(uint256 tokenId) public view returns(uint256){
        uint256 boostPower = 0;
        if (tokenId < 10000) {
            boostPower += aBoostPower;
        } else if (tokenId < 20000) {
            boostPower += bBoostPower;
        } else if (tokenId < 30000) {
            boostPower += cBoostPower;
        } else if (tokenId < 40000) {
            boostPower += dBoostPower;
        } else if (tokenId < 50000) {
            boostPower += eBoostPower;
        } else if (tokenId < 60000) {
            boostPower += fBoostPower;
        } else if (tokenId < 70000) {
            boostPower += gBoostPower;
        } else if (tokenId < 80000) {
            boostPower += hBoostPower;
        } else if (tokenId < 90000) {
            boostPower += iBoostPower;
        }
        return boostPower;
    }
}