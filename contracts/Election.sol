pragma solidity ^0.5.0;

contract Election {
	//Model a Candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
		string candi;
	}

	//Store Candidate
	mapping(uint => Candidate) public candidates;
	mapping(address => bool) public voters;
	//Store Candidate Count
	uint public candidatesCount;

	event votedEvent (
        uint indexed _candidateId
    );

	constructor() public {
		addCandidate("Pratham");
		addCandidate("Ajay");
		addCandidate("Vrinda");
		addCandidate("Rishi");
	}

	function addCandidate (string memory _name) private {
		string[4] memory arrayy=["42b7c0b2c66c9c4f549a422707ee86b4b7724bee20b7e05d169d02897f572b8d","6186cf14e75107b7a09dc16b4d0fb7b4a6d8ccb7b3e714b1f80008cdbb071310","d482cd953e118a8701a1f836858e72a4ef3515da10f4d0a0fbdbc7127370434b","0305dcf6bb6109caff7e38329c75d9d39dfea5e18b5456d57bad1ac964be8466"];
		candidatesCount ++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, arrayy[candidatesCount-1]);
	}

	function vote (uint _candidateId) public {
		require(!voters[msg.sender]);
		require(_candidateId>0 && _candidateId<=candidatesCount);
		voters[msg.sender]=true;

		candidates[_candidateId].voteCount ++;

		emit votedEvent(_candidateId);
	}

}