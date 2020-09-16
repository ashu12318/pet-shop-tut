pragma solidity ^0.5.0;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/Adoption.sol';

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    uint expectedPetId = 8;

    address expectedAdoptor = address(this);

    function testUserCanAdoptPet() public {
        uint returnedPetId = adoption.adopt(expectedPetId);

        Assert.equal(returnedPetId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    function testGetAdopterAddressByPetId() public {
        address adopterAddress = adoption.adopters(expectedPetId);

        Assert.equal(adopterAddress, expectedAdoptor, "Owner of the expected pet should be this contract");
    }

    function testGetAdopterAddressByPetIdInArray() public {
        address[16] memory addresses = adoption.getAdopters();

        Assert.equal(addresses[expectedPetId], expectedAdoptor, "Owner of the expected pet should be this contract");
    }
}