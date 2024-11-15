import hre from "hardhat";

async function main() {
  const DEPLOYED_FACTORY_CONTRACT =
    "0x5FbDB2315678afecb367f032d93F642f64180aa3";

  const myAccount = "0xac9535B43e7f652344A158FaB8e44472A1070299";

  const signer = await hre.ethers.getSigner(myAccount);

  const marketplaceInstance = await hre.ethers.getContractAt(
    "Marketplace",
    DEPLOYED_FACTORY_CONTRACT
  );

  console.log(
    "############################ Deploying claim factory ####################"
  );

  const createItemTx1 = await marketplaceInstance
    .connect(signer)
    .registerItem("pencil", "From Web 3", "10");

    createItemTx1.wait();

  console.log({
    "Item created 1 deployed successfully to": createItemTx1,
  });


  console.log(
    "############################ Get info from proposal ####################"
  );

  const listItem = await marketplaceInstance
    .connect(signer)
    .getAllItems();

  console.table(listItem);


}
