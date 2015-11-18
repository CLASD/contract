CREATE TABLE Division (
	DivisionId AUTOINCREMENT  NOT NULL UNIQUE, 
	DivisionName VARCHAR(45) NULL UNIQUE,
	CreateDate TIMESTAMP NULL ,
  	UpdateDate TIMESTAMP NULL ,
  	CONSTRAINT Division_PK PRIMARY KEY (DivisionId),
  	CONSTRAINT u_DivName UNIQUE (DivisionId ,DivisionName)
  )


CREATE TABLE RFP_RFQ (
  RFP_RFQId AUTOINCREMENT NOT NULL  PRIMARY KEY ,
  DateReceiveRFPRFQDraftfrPM DATETIME NULL ,
  COMMENT VARCHAR(45)
)
  
  
  
CREATE TABLE CAO_CityOfAttorney (
  CAO_CityOfAttorneyId AUTOINCREMENT NOT NULL ,
  CreateDate DATETIME NULL ,
  UpdateDate DATETIME NULL ,
  DateRecPersonnelDetermination DATETIME NULL ,
  CanCityEmployeesPerformWork TINYINT(1) NULL DEFAULT 0,
  DateReceiveDeptContactDocumentationForm DATETIME NULL ,
  RF1022DeterminationfrPM DATETIME NULL ,
  DateToCAOForEconomicFeasibilityDetermination DATETIME NULL ,
  DateReceiveCAODetermination DATETIME NULL ,
  CAODetermination VARCHAR(200) NULL ,
  DateNotifyCAODeterminationToPM DATETIME NULL ,
  PRIMARY KEY (CAO_CityOfAttorneyId)
  )
 


CREATE TABLE  Comment (
  CommentId AUTOINCREMENT  NOT NULL ,
  InitialDate DATETIME NULL ,
  BoardBriefingDate DATETIME NULL ,
  CouncilCommitteeApprovalDate DATETIME NULL ,
  CityClerkAttestDate DATETIME NULL ,
  CounsilFileNo VARCHAR(45) NULL ,
  Comment VARCHAR(200) NULL ,
  PRIMARY KEY (CommentId)
  )
 


CREATE TABLE  ProjectSchedule (
  ProjectScheduleId AUTOINCREMENT NOT NULL,
  ContractId INT NULL ,
  DateNOIRecdFrPM DATETIME NULL ,
  DateNOISentToCAO DATETIME NULL ,
  Date1022RecdFrPM DATETIME NULL ,
  PRIMARY KEY (ProjectScheduleId)
  )

    
CREATE TABLE  Contract (
  ContractId AUTOINCREMENT NOT NULL PRIMARY KEY,
  DivisionId INT,
  RFP_RFQId INT,
  ProjectSummary VARCHAR(245) NULL ,
  ContractorName VARCHAR(45) NULL ,
  DivContract VARCHAR(45) NULL ,
  ContractNo VARCHAR(45) NULL ,
  Status VARCHAR(45) NULL ,
  ContractExpirationDate INT NOT NULL,
  EstLengthOfProject VARCHAR(45) NULL ,
  CostCeiling VARCHAR(45) NULL ,
  CAO_CityOfAttorneyId INT,
  CommentId INT,
  ProjectScheduleId INT ,
 	
 	CONSTRAINT Div_fk FOREIGN KEY (DivisionId) REFERENCES Division (DivisionId),
 	CONSTRAINT RFP_fk FOREIGN KEY (RFP_RFQId)  REFERENCES RFP_RFQ (RFP_RFQId), 	
 	CONSTRAINT CAO_fk FOREIGN KEY (CAO_CityOfAttorneyId) REFERENCES CAO_CityOfAttorney (CAO_CityOfAttorneyId), 	
 	CONSTRAINT COMMENT_fk FOREIGN KEY (CommentId) REFERENCES  Comment (CommentId),
 	CONSTRAINT PROSCH_fk FOREIGN KEY (ProjectScheduleId) REFERENCES ProjectSchedule (ProjectScheduleId)
 ) 
    
    
    