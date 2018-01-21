@RestResource(urlMapping='/CAAccount/*')
global with sharing class RestSampleController {

	@HttpPost	
	  global static String createNewAccount(String companyName) {
	     System.debug('COMPANY: '+companyName);
	          
	     Account a = new Account();
	     a.Name = companyName;
	     a.AccountNumber = '123';
	     insert a;      
	     return 'Created Account for ' + companyName + ' with an id of ' + a.Id;
	}

	@HttpGet
	  global static Account getAccount() {
	    String companyName = RestContext.request.params.get('companyName');
	    Account company = [ Select ID, Name, Email__c, BillingState from Account where Name = :companyName LIMIT 1];
	    return company;
	    
	}
	@HttpDelete
	  global static String deleteAccount() {
	    String companyName = RestContext.request.params.get('companyName');
	    Account company = [ Select ID, Name, Email__c, BillingState from Account where Name = :companyName LIMIT 1];
	    delete company;
	    
	    return 'Account ' + companyName + ' Deleted';
	}
	@HttpPatch
	  global static String updateAccount(String companyName, String email) {
	    Account company = [ Select ID, Name, Email__c, BillingState from Account where Name = :companyName LIMIT 1];
	    
	    company.Email__c = email;
	    update company;
	    
	    return 'Account Updated';
	}

	@HttpPut
	global static String AddAttachment() {
		RestRequest req = RestContext.request;
		System.debug(req);
	    String companyName = req.params.get('companyName');
	    Account company = [ Select ID, Name, Type, BillingState from Account where Name = :companyName LIMIT 1];
	    Attachment a = new Attachment();
	    a.ParentId = company.Id;
	    a.Name = 'test.png';
	    a.Body = req.requestBody;
	    
	    insert a;
	    
	    return 'Attachment added';
	}
	// @HttpGet
	// global static sObject GetAttachment() {
	//     RestRequest req = RestContext.request;
	//     Id AccountID = req.params.get('id');
	//     try {
	//         Account acc = [SELECT Id, Name, Type FROM Account WHERE Id = :AccountId LIMIT 1];
	//         return acc;
	//     } catch (exception e) {
	//         return null;
	//     }
	// }    
}