const { ethers } = require("hardhat");

async function main() {
  const Moodcontract = await ethers.getContractFactory("Mood");

  const trustedForwarder = "0x86C80a8aa58e0A4fa09A69624c31Ab2a6CAD56b8";
  // deploy the contract
  const deployedMoodContract = await Moodcontract.deploy(trustedForwarder);

  // wait for it to finish deploying
  await deployedMoodContract.deployed();

  // print the address of the deployed contract
  console.log("Mood Contract Address:", deployedMoodContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
