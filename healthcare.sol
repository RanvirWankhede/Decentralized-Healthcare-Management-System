// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HealthcareSystem {
    address public owner;

    struct Patient {
        string name;
        uint256 age;
        string gender;
        string medicalHistory;
        address[] authorizedProviders;
    }

    mapping(address => Patient) private patients;

    // Event to notify when a new patient is registered
    event PatientRegistered(address patientAddress, string name);

    // Event to notify when a medical history update occurs
    event MedicalHistoryUpdated(address patientAddress, string newHistory);

    // Modifier to ensure only the owner or authorized healthcare provider can modify records
    modifier onlyOwnerOrProvider(address patientAddress) {
        require(
            msg.sender == owner || isAuthorizedProvider(patientAddress, msg.sender),
            "Not authorized"
        );
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to register a new patient
    function registerPatient(
        address patientAddress,
        string memory name,
        uint256 age,
        string memory gender
    ) public {
        require(bytes(patients[patientAddress].name).length == 0, "Patient already registered");

        // Initialize patient data with an empty authorizedProviders array
        patients[patientAddress] = Patient({
            name: name,
            age: age,
            gender: gender,
            medicalHistory: "",
            authorizedProviders: new address[] (0)  // Inize as an empty array
        });

        emit PatientRegistered(patientAddress, name);
    }

    // Function to update medical history of a patient (only by owner or authorized providers)
    function updateMedicalHistory(address patientAddress, string memory newHistory)
        public
        onlyOwnerOrProvider(patientAddress)
    {
        patients[patientAddress].medicalHistory = newHistory;
        emit MedicalHistoryUpdated(patientAddress, newHistory);
    }

    // Function to authorize a healthcare provider
    function authorizeProvider(address patientAddress, address providerAddress) public {
        require(msg.sender == patientAddress, "Only patient can authorize provider");

        patients[patientAddress].authorizedProviders.push(providerAddress);
    }

    // Function to retrieve patient details (Only patient or owner can access)
    function getPatientDetails(address patientAddress)
        public
        view
        returns (string memory, uint256, string memory, string memory)
    {
        require(
            msg.sender == patientAddress || msg.sender == owner,
            "Not authorized to view details"
        );

        Patient memory patient = patients[patientAddress];
        return (patient.name, patient.age, patient.gender, patient.medicalHistory);
    }

    // Helper function to check if a provider is authorized
    function isAuthorizedProvider(address patientAddress, address providerAddress)
        private
        view
        returns (bool)
    {
        for (uint256 i = 0; i < patients[patientAddress].authorizedProviders.length; i++) {
            if (patients[patientAddress].authorizedProviders[i] == providerAddress) {
                return true;
            }
        }
        return false;
    }
}
