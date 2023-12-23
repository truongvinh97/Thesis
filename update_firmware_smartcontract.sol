// FirmwareUpdate.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirmwareUpdate {
    address public server;
    string public latestFirmware;
    string public firmwareMetadata;

    event FirmwareUpdated(string newFirmware, string metadata, address updater);

    modifier onlyServer() {
        require(msg.sender == server, "Not authorized");
        _;
    }

    constructor() {
        server = msg.sender;
    }

    function updateFirmware(string memory newFirmware, string memory newMetadata) external onlyServer {
        latestFirmware = newFirmware;
        firmwareMetadata = newMetadata;
        emit FirmwareUpdated(newFirmware, newMetadata, msg.sender);
    }
}