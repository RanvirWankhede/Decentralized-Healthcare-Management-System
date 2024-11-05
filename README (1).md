
# Project Title

A brief description of what this project does and who it's for


## Decentralized Healthcare Management System
## Overview

 - This project implements a Healthcare Management System using a smart contract on the Ethereum blockchain. The contract allows patients to:

- Register their details.
- Authorize healthcare providers to view or update their medical records.
- Maintain data privacy and security with restricted access controls.


## Features
*  Register patients with their basic information.
* Authorized Providers: Patients can authorize specific healthcare providers.
* Medical History Management: Authorized providers can update patient's medical history.
* Secure Access: Only the patient or authorized providers can view or modify data.


## Contract Details
* Solidity Version: 0.8.0
* License: MIT
* Language: Solidity



## Functions
* registerPatient: Registers a new patient with an address, name, age and gender.
* getPatientDetails: Allows patients or the contract owner to view patient information.
* authorizeProvider: Patients can add healthcare providers to their authorized list.
* updateMedicalHistory: Allows authorized providers to update a patient's medical history.
* isAuthorizedProvider: Checks if a provider is authorized by a specific patient.

## Setup and Deployment
### Prerequisites
* Remix IDE for Solidity development.
* Solidity Compiler version 0.8.0 or later.
#### Steps to Deploy and Interact
#### Compile the Contract:

* Open the HealthcareSystem.sol file in Remix.
* Select the correct compiler version (0.8.0 or above) and compile the file.
#### Deploy the Contract:

* Go to the "Deploy & Run Transactions" tab in Remix.
* Select the "JavaScript VM" environment for a local blockchain.
* Deploy the HealthcareSystem contract.
* Interact with the Contract:

* Use the registerPatient function to add a patient.
* Retrieve patient details using the getPatientDetails function.
* Authorize providers and update medical history as required.


## Future Enhancement

* Ether Transactions: Add features to handle Ether transactions for payment between patients and providers.
* Data Encryption: Enhance data privacy by integrating encryption methods for sensitive medical information.
* Decentralized Storage: Integrate IPFS or other decentralized storage for scalable data handling.
## License

[This project is licensed under the MIT License.](https://github.com/RanvirWankhede/Decentralized-Healthcare-Management-System/blob/main/LICENSE)


## Usage/Examples

```javascript
// Example usage in Remix IDE:
registerPatient("0xPatientAddress", "John Doe", 30, "Male");
getPatientDetails("0xPatientAddress");
authorizeProvider("0xPatientAddress", "0xProviderAddress");
updateMedicalHistory("0xPatientAddress", "No known allergies, recent check-up normal.");


