/*******************************************************************
// (c) 2016 Doextra
// 
// Class to test update segmentation stage on contacts
//
// Created: 7/4/2016    Chris Andrews  
********************************************************************/
@isTest (SeeAllData=false)
public class SegmentStageUpdBatch_Test {
    
    static testMethod void unitTest1() {
      
	Contact_Maintenance_Test.createTestData();        
        
        Test.startTest();
        Contact[] cl = [SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Stage__c = Null];
        System.assertEquals(3,cl.size());

    
        string query = 'SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Date__c != Null';
        SegmentStageUpdBatch sb = new SegmentStageUpdBatch(query);
        ID thisBatchJob = Database.executeBatch(sb);
        SegmentStageUpdBatch sb1 = new SegmentStageUpdBatch();      // this call is just to get code coverage on the constructor, nothing more
        Test.stopTest();
        
      //   verify that all of the contacts were updated.
      cl = [SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Stage__c = Null];
      System.assertEquals(1, cl.size());
    }
   }