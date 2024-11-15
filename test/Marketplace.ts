import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre from "hardhat";


describe("Marketplace Test", function () {

    async function deployMarketplaceFixture() {
      const [owner, otherAccount] = await hre.ethers.getSigners();
  
      const Marketplace = await hre.ethers.getContractFactory("Marketplace");
      const marketplace = await Marketplace.deploy();
  
      return { marketplace, owner, otherAccount };
    }
  
    describe("Deployment", () => {
      it("Should check if it deployed ", async function () {
        const { marketplace, owner } = await loadFixture(deployMarketplaceFixture);
  
        expect(await marketplace.owner()).to.equal(owner.address);
      });
    });


    it("Should be able to register Item", async function () {
        const { marketplace, owner } = await loadFixture(deployMarketplaceFixture);
        const name = "pencil";
        const description = "From Team";
        const price = 2000;
        await marketplace.connect(owner).registerItem(name, description,price);
    
        expect(await marketplace.getItem(0)).to.be.deep.equal(name, description);
    
        
    });
})