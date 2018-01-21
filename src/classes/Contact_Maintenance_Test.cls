/*******************************************************************
// 
// 
// Description    : Class that tests the Contact Maintenance classes
//     
// April 7, 2016 Andrews
********************************************************************/
@isTest  (SeeAllData=false)
public class Contact_Maintenance_Test {

    static List<Contact> contactList = new List<Contact>();
  
    static testMethod void UnitTest1() {
        //Creating Test data
        createTestData();     

        // For those with valid dates, call the maintenance routine

        contactList = Contact_Maintenance.Correct_Stage([SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Date__c != Null]);
        System.assertEquals('Stage 2', contactList[0].Activation_Stage__c);
        System.assertEquals('Stage 37', contactList[1].Activation_Stage__c);

        // here is the brute force method call 
        contactList = Contact_Maintenance.Correct_Stage_Old([SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Date__c != Null]);
        System.assertEquals('Stage 2', contactList[0].Activation_Stage__c);
        System.assertEquals('Stage 37', contactList[1].Activation_Stage__c);
        return;
    }
    
//
//  Create three contact records, two that will be updated and one that fails the criteria (has no activation date)
//  We also create the custom setting that is used.  Since there are only 37 rows, I did the whole thing -- maybe a little overkill.
//    
    public static void createTestData() {
        
        //Create Contact
        
        //    String recordTypeId  = Schema.getGlobalDescribe().get('Account').getDescribe().getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        Contact c1 = new Contact(
            FirstName='Test FName',
            LastName='Test LName',
            MailingStreet='test@yahoo.com',
            MailingPostalCode='12345',
            MailingCity='SFO',
            Email='test@yahoo.com',
            HomePhone='1234567',
            MobilePhone='12345678', 
            Activation_Date__c = Date.today()-30,
            Activation_Stage__c = null
        );
        
        insert c1;
        
        
        Contact c2 = new Contact(
            FirstName='Test2 FName',
            LastName='Test2 LName',
            MailingStreet='test2@yahoo.com',
            MailingPostalCode='12345',
            MailingCity='DSM',
            Email='test2@yahoo.com',
            HomePhone='1234567',
            MobilePhone='12345678', 
            Activation_Date__c = Date.today()-1080,
            Activation_Stage__c = null
        );
        insert c2;
        
        Contact c3 = new Contact(
            FirstName='Test3 FName',
            LastName='Test3 LName',
            MailingStreet='test3@yahoo.com',
            MailingPostalCode='12345',
            MailingCity='DSM',
            Email='test3@yahoo.com',
            HomePhone='1234567',
            MobilePhone='12345678', 
            Activation_Date__c = null, 
            Activation_Stage__c = null
        );
        insert c3;
        

        insert new StageUpdateValues__C(Name=' Stage 1', Days_Low__c =Null,  Days_High__c = 29); 
        insert new StageUpdateValues__C(Name=' Stage 2', Days_Low__c =30,  Days_High__c = 59);  
        insert new StageUpdateValues__C(Name=' Stage 3', Days_Low__c =60,  Days_High__c = 89);  
        insert new StageUpdateValues__C(Name=' Stage 4', Days_Low__c =90,  Days_High__c = 119);  
        insert new StageUpdateValues__C(Name=' Stage 5', Days_Low__c =120,  Days_High__c = 149);  
        insert new StageUpdateValues__C(Name=' Stage 6', Days_Low__c =150,  Days_High__c = 179);  
        insert new StageUpdateValues__C(Name=' Stage 7', Days_Low__c =180,  Days_High__c = 209);  
        insert new StageUpdateValues__C(Name=' Stage 8', Days_Low__c =210,  Days_High__c = 239);  
        insert new StageUpdateValues__C(Name=' Stage 9', Days_Low__c =240,  Days_High__c = 269);  
        insert new StageUpdateValues__C(Name=' Stage 10', Days_Low__c =270,  Days_High__c = 299);  
        insert new StageUpdateValues__C(Name=' Stage 11', Days_Low__c =300,  Days_High__c = 329);  
        insert new StageUpdateValues__C(Name=' Stage 12', Days_Low__c =330,  Days_High__c = 359);  
        insert new StageUpdateValues__C(Name=' Stage 13', Days_Low__c =360,  Days_High__c = 389);  
        insert new StageUpdateValues__C(Name=' Stage 14', Days_Low__c =390,  Days_High__c = 419);  
        insert new StageUpdateValues__C(Name=' Stage 15', Days_Low__c =420,  Days_High__c = 449);  
        insert new StageUpdateValues__C(Name=' Stage 16', Days_Low__c =450,  Days_High__c = 479);  
        insert new StageUpdateValues__C(Name=' Stage 17', Days_Low__c =480,  Days_High__c = 509);  
        insert new StageUpdateValues__C(Name=' Stage 18', Days_Low__c =510,  Days_High__c = 539);  
        insert new StageUpdateValues__C(Name=' Stage 19', Days_Low__c =540,  Days_High__c = 569);  
        insert new StageUpdateValues__C(Name=' Stage 20', Days_Low__c =570,  Days_High__c = 599);  
        insert new StageUpdateValues__C(Name=' Stage 21', Days_Low__c =600,  Days_High__c = 629);  
        insert new StageUpdateValues__C(Name=' Stage 22', Days_Low__c =630,  Days_High__c = 659);  
        insert new StageUpdateValues__C(Name=' Stage 23', Days_Low__c =660,  Days_High__c = 689);  
        insert new StageUpdateValues__C(Name=' Stage 24', Days_Low__c =690,  Days_High__c = 719);  
        insert new StageUpdateValues__C(Name=' Stage 25', Days_Low__c =720,  Days_High__c = 749);  
        insert new StageUpdateValues__C(Name=' Stage 26', Days_Low__c =750,  Days_High__c = 779);  
        insert new StageUpdateValues__C(Name=' Stage 27', Days_Low__c =780,  Days_High__c = 809);  
        insert new StageUpdateValues__C(Name=' Stage 28', Days_Low__c =810,  Days_High__c = 839);  
        insert new StageUpdateValues__C(Name=' Stage 29', Days_Low__c =840,  Days_High__c = 869);  
        insert new StageUpdateValues__C(Name=' Stage 30', Days_Low__c =870,  Days_High__c = 899);  
        insert new StageUpdateValues__C(Name=' Stage 31', Days_Low__c =900,  Days_High__c = 929);  
        insert new StageUpdateValues__C(Name=' Stage 32', Days_Low__c =930,  Days_High__c = 959);  
        insert new StageUpdateValues__C(Name=' Stage 33', Days_Low__c =960,  Days_High__c = 989);  
        insert new StageUpdateValues__C(Name=' Stage 34', Days_Low__c =990,  Days_High__c = 1019);  
        insert new StageUpdateValues__C(Name=' Stage 35', Days_Low__c =1020,  Days_High__c = 1049);  
        insert new StageUpdateValues__C(Name=' Stage 36', Days_Low__c =1050,  Days_High__c = 1079);  
        insert new StageUpdateValues__C(Name=' Stage 37', Days_Low__c =1080,  Days_High__c = Null);  
        
        return;
    }
}