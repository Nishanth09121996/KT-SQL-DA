create schema insurance;
use insurance;
--
-- Table structure for table coverages
--

DROP TABLE IF EXISTS coverages;
CREATE TABLE coverages (
  CoverageID varchar(100) NOT NULL,
  premium bigint DEFAULT NULL,
  sum_insured bigint DEFAULT NULL,
  name text,
  PRIMARY KEY (CoverageID)
);

--
-- Table structure for table party
--

DROP TABLE IF EXISTS party;
CREATE TABLE party (
  company text,
  email text,
  region text,
  country text,
  city text,
  dob text,
  name text,
  PartyID varchar(100) NOT NULL,
  PRIMARY KEY (PartyID)
);

--
-- Table structure for table policy
--

DROP TABLE IF EXISTS policy;
CREATE TABLE policy (
  PolicyID varchar(100) NOT NULL,
  PolicyStartDarte date DEFAULT NULL,
  region text,
  PolicyHolderID varchar(100) DEFAULT NULL,
  PolicyEndDate date DEFAULT NULL,
  country text,
  PRIMARY KEY (PolicyID),
  KEY policy_FK (PolicyHolderID),
  CONSTRAINT policy_FK FOREIGN KEY (PolicyHolderID) REFERENCES party (PartyID)
);

--
-- Table structure for table premium
--

DROP TABLE IF EXISTS premium;
CREATE TABLE premium (
  PolicyID varchar(100) DEFAULT NULL,
  CoverageID varchar(100) DEFAULT NULL,
  writtenPremium double DEFAULT NULL,
  UNIQUE KEY premium_un (PolicyID,CoverageID),
  KEY premium_FK_1 (CoverageID),
  CONSTRAINT premium_FK FOREIGN KEY (PolicyID) REFERENCES policy (PolicyID),
  CONSTRAINT premium_FK_1 FOREIGN KEY (CoverageID) REFERENCES coverages (CoverageID)
);



-- Table structure for table claims
--

DROP TABLE IF EXISTS claims;
CREATE TABLE claims (
  IncidentID varchar(100) NOT NULL,
  CoverageID varchar(100) DEFAULT NULL,  
  PolicyID varchar(100) DEFAULT NULL,
  LossIncured double DEFAULT NULL,
  lossDate date DEFAULT NULL,
  region text,
  PRIMARY KEY (IncidentID),
  UNIQUE KEY claims_un (IncidentID,CoverageID,PolicyID,lossDate),
  KEY claims_FK (PolicyID),
  KEY claims_FK_1 (CoverageID),
  CONSTRAINT claims_FK FOREIGN KEY (PolicyID) REFERENCES policy (PolicyID),
  CONSTRAINT claims_FK_1 FOREIGN KEY (CoverageID) REFERENCES coverages (CoverageID)
);

