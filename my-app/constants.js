export const config = {
  apiKey: {
    prod: "4-qmuODmm.cf59130b-053e-4b3c-9e2f-5472d1d1aee8",
  },
  contract: {
    address: "0x6ae6d0bc842e9cee00d3ba395df2243d7c17b02c",
    abi: [
      {
        inputs: [
          {
            internalType: "address",
            name: "_trustedForwarder",
            type: "address",
          },
        ],
        stateMutability: "nonpayable",
        type: "constructor",
      },
      {
        inputs: [],
        name: "getMood",
        outputs: [
          {
            internalType: "string",
            name: "",
            type: "string",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "forwarder",
            type: "address",
          },
        ],
        name: "isTrustedForwarder",
        outputs: [
          {
            internalType: "bool",
            name: "",
            type: "bool",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "string",
            name: "_mood",
            type: "string",
          },
        ],
        name: "setMood",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
      },
    ],
  },
};
