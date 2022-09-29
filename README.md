Integrating Biconomy Gasless method in your dApp

Mood Contract Address: 0x6Ae6d0Bc842E9Cee00d3Ba395df2243d7c17b02c

1. Customize the smart contract first

With BaseRelayRecipient

```
import "@opengsn/gsn/contracts/BaseRelayRecipient.sol";

contract Lock is BaseRelayRecipient {

    constructor(address _trustedForwarder) public {
        trustedForwarder = _trustedForwarder;
    }

    modifier onlyOwner() {
        /// Instead of msg.sender , we are using msgSender()
        msgSender() == owner;
        _;
    }


    function setTrustedForwader(address _trustedForwader) public onlyOwner {
        trustedForwarder = _trustedForwader;
    }

    function versionRecipient() external view override returns (string memory) {
        return "1";
    }

    /// Remaining contract Code
}

```

2. Use `msgSender()` , wherever using `msg.sender` if using BaseRelayRecipient. OtherWise Use `_msgSender` in case of ERC2771Context

3. Deploy the contract with the respective Trusted Forwarder of each chain .Find the address here : https://docs.biconomy.io/misc/contract-addresses

4. Now configure it with Biconomy Dashboard. Connect Wallet and Register the dApp

5. Go to Smart Contracts Tab , add the contract name , address & ABI and select the Meta Tx type

6. Select the Smart Contract methods to be used for gasless transaction , and then Get the API key for the respective method .

7. Integrate the Frontend dApp with Biconomy SDK .

Install the SDK with this command

```
npm install @biconomy/mexa
yarn add @biconomy/mexa

```

Intialize the SDK :

```
const biconomy = new Biconomy(window.ethereum as ExternalProvider, {
  apiKey: config.apiKey.prod,
  debug: true,
  contractAddresses: [<contractAddress1>, <contractAddress2>], // list of contract address you want to enable gasless on
});

// The first argument of the Biconomy class is an EIP 1193 type provider that has to be passed.
// If there is a type mismatch you'll have to set the type of the provider as
// External Provider
export type ExternalProvider = {
  isMetaMask?: boolean;
  isStatus?: boolean;
  host?: string;
  path?: string;
  sendAsync?: (request: { method: string, params?: Array<any> }, callback: (error: any, response: any) => void) => void
  send?: (request: { method: string, params?: Array<any> }, callback: (error: any, response: any) => void) => void
  request?: (request: { method: string, params?: Array<any> }) => Promise<any>
}

// To create contract instances you can do:
const contractInstance = new ethers.Contract(
  config.contract.address,
  config.contract.abi,
  biconomy.ethersProvider
);

```

Initialize the dApp that fetches the data from the biconomy backend we registered

```
await biconomy.init();

```

8. Boom , we successfully integrated the Biconomy Gasless tx method into our dApp . We can call all the function we want to now with ethers.js
