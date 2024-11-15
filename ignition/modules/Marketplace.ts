import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MarketplaceModule = buildModule("MarketplaceModule", (c) => {
  const marketplace = c.contract("Marketplace");

  return { marketplace };
});

export default MarketplaceModule;


// MarketplaceModule#Marketplace - 0x5FbDB2315678afecb367f032d93F642f64180aa3
