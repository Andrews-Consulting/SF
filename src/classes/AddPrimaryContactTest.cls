@isTest
public class AddPrimaryContactTest {

    
    //In the test class, insert 50 Account records for BillingState "NY" and 
    //50 Account records for BillingState "CA". 
    //Create an instance of the AddPrimaryContact class, enqueue the job 
    //and assert that a Contact record was inserted for each of the 50 Accounts
    // with the BillingState of "CA".

    @testSetup
	static void setup() {
        List<Account> accounts = new List<Account>();
        for (integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name='Test A Account' + i, BillingState='CA'));
            accounts.add(New Account(Name='Test B Account' + i, BillingState='NY'));
        }
        insert accounts;
    }    
    
    static testmethod void testQueueable(){
	
		Contact newc = new Contact(LastName='Contact', FirstName='Test');
        AddPrimaryContact acjob = new AddPrimaryContact(newc, 'CA');
        test.startTest();
        System.enqueueJob(acjob);
        test.stopTest();
        // make sure everything worked
        System.debug('Contact Count - ' + [Select count() from Contact]);
		Contact xc = [Select id, account.id, account.Billingstate from Contact Limit 1];
        System.assertEquals(50,[Select count() from Contact where contact.account.BillingState = 'CA']);
    }
}