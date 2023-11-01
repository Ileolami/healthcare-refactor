// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;


contract details{

    
    struct Patient {
        address patientsAddress;
        string name;
        uint age;
        uint userId;
        Case caseType;
    } 

    enum Case{
        surgery,
        emergency,
        childbirth,
        unresolved,
        consulting
    }


    Patient[] internal patients;

      function addDetails(address _patientsAddress, string memory _name, uint _age, uint _userId, Case _caseType) public{     
        
        Patient memory patientLists;
    
    patientLists.patientsAddress = _patientsAddress;
     patientLists.name = _name;
     patientLists.age = _age;
     patientLists.userId = _userId;
     patientLists.caseType = _caseType;

     patients.push(patientLists);
     }

       function getPatientDetails(uint _index) view public returns (address, string memory, uint, uint, Case) {
         Patient storage  PatientLists = patients[_index];
         return (PatientLists.patientsAddress, PatientLists.name, PatientLists.age, PatientLists.userId, PatientLists.caseType);
         }

  function hasPatientRegistered(address _patientsAddress) view public returns (bool) {
        for (uint i = 0; i < patients.length; i++) {
            if (patients[i].patientsAddress == _patientsAddress) {
                return true;
            }
        }
        return false;
    }
}
