/*******************************************************************
// 
// Class to update segmentation stage on contacts
//
// Created: 7/4/2016    Chris Andrews  
********************************************************************/
public Class Contact_Maintenance{

    public class MyException extends Exception {}

    public static List<Contact> Correct_Stage(List<Contact> contactList) {
//          List<StageUpdateValues__c> stages = [Select Name, Days_Low__c, Days_High__c from StageUpdateValues__c];  // bad performance using SOQL
        List<StageUpdateValues__c> stages = StageUpdateValues__c.getall().values();		
        if (stages.size() == 0) throw new MyException('Custom Setting Stage Update Values is empty');
        
        for(Contact c : contactList) {
            integer d = c.Activation_Date__c.daysBetween(Date.today());		// get the number of days between activation and today. [today() - activation_date__c]
            for (StageUpdateValues__c s : stages) {
                if (s.Days_Low__c != null) 				// If there is a value
                    if (d < s.Days_Low__c) continue;	// and it's out of range, then next iteration
                if (s.Days_High__c != null)				// 
                    if (d > s.Days_High__c) continue;	// and again. If there is a value and it's out of range, then next iteration
                c.Activation_Stage__c = s.Name;    		// We are in range (or days high and low are blank!)
            }
        }
        return contactList;
    }

	public static List<Contact> Correct_Stage_Old(List<Contact> contactList) {
        for(Contact c : contactList) {
            integer d = c.Activation_Date__c.daysBetween(Date.today());		// get the number of days between activation and today.
            if (d < 30) c.Activation_Stage__c = 'Stage 1';
            else if (d < 60) c.Activation_Stage__c = 'Stage 2';
            else if (d < 90) c.Activation_Stage__c = 'Stage 3';
            else if (d < 120) c.Activation_Stage__c = 'Stage 4';
            else if (d < 150) c.Activation_Stage__c = 'Stage 5';
            else if (d < 180) c.Activation_Stage__c = 'Stage 6';
            else if (d < 210) c.Activation_Stage__c = 'Stage 7';
            else if (d < 240) c.Activation_Stage__c = 'Stage 8';
            else if (d < 270) c.Activation_Stage__c = 'Stage 9';
            else if (d < 300) c.Activation_Stage__c = 'Stage 10';
            else if (d < 330) c.Activation_Stage__c = 'Stage 11';
            else if (d < 360) c.Activation_Stage__c = 'Stage 12';
            else if (d < 390) c.Activation_Stage__c = 'Stage 13';
            else if (d < 420) c.Activation_Stage__c = 'Stage 14';
            else if (d < 450) c.Activation_Stage__c = 'Stage 15';
            else if (d < 480) c.Activation_Stage__c = 'Stage 16';
            else if (d < 510) c.Activation_Stage__c = 'Stage 17';
            else if (d < 540) c.Activation_Stage__c = 'Stage 18';
            else if (d < 570) c.Activation_Stage__c = 'Stage 19';
            else if (d < 600) c.Activation_Stage__c = 'Stage 20';
            else if (d < 630) c.Activation_Stage__c = 'Stage 21';
            else if (d < 660) c.Activation_Stage__c = 'Stage 22';
            else if (d < 690) c.Activation_Stage__c = 'Stage 23';
            else if (d < 720) c.Activation_Stage__c = 'Stage 24';
            else if (d < 750) c.Activation_Stage__c = 'Stage 25';
            else if (d < 780) c.Activation_Stage__c = 'Stage 26';
            else if (d < 810) c.Activation_Stage__c = 'Stage 27';
            else if (d < 840) c.Activation_Stage__c = 'Stage 28';
            else if (d < 870) c.Activation_Stage__c = 'Stage 29';
            else if (d < 900) c.Activation_Stage__c = 'Stage 30';
            else if (d < 930) c.Activation_Stage__c = 'Stage 31';
            else if (d < 960) c.Activation_Stage__c = 'Stage 32';
            else if (d < 990) c.Activation_Stage__c = 'Stage 33';
            else if (d < 1020) c.Activation_Stage__c = 'Stage 34';
            else if (d < 1050) c.Activation_Stage__c = 'Stage 35';
            else if (d < 1080) c.Activation_Stage__c = 'Stage 36';
            else c.Activation_Stage__c = 'Stage 37';
        }
        return contactList;
    }
}