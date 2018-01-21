@isTest
public with sharing class TriggerFrameworkTest { 
	@isTest static  void testAccountTrigger() {
		Account acct = new Account();
		acct.Name = 'testacct1';
		insert acct;

		Account acct1 = [SELECT Id, Name FROM Account WHERE Name = 'testacct1'];
		acct1.Name = 'testacct2';
		update acct1;
		System.assert(true);
	}
}