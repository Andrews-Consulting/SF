/*******************************************************************
// (c) 2016 Doextra
//  
// Class to test schedule of update segmentation stage on contacts
//
// Created: 7/4/2016    Chris Andrews  
********************************************************************/
@isTest (SeeAllData=false)
public class ScheduleSegmentStageUpdates_Test {
   
    static testMethod void unitTest1() {
      
		Contact_Maintenance_Test.createTestData(); 
        
        Test.startTest();
       
        // Schedule the test job
        String CRON_EXP = '0 0 0 * * ?';
        String jobId = System.schedule('ScheduleSegmentStageUpdates_Test',
                                       CRON_EXP, new ScheduleSegmentStageUpdates());
        
        // Get the information from the CronTrigger API object
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                          FROM CronTrigger WHERE id = :jobId];
        
        // Verify the expressions are the same
        System.assertEquals(CRON_EXP, ct.CronExpression);
        
        // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
             
        // Verify the scheduled job hasn't run yet.
        List<Contact> cl = [SELECT ID, Activation_Stage__c from Contact WHERE Activation_Stage__c = Null];
        System.assertEquals(3, cl.size());
        
        Test.stopTest();
        
        // since our scheduled job actually invokes an async job, the second async job will never execute in the context of this test.  
        // There is no way to validate that it actually completed.
    }
}