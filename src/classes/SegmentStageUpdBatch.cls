/*******************************************************************
// (c) 2016 Doextra
// 
// Class to update segmentation stage on contacts
//
// Created: 7/4/2016    Chris Andrews  
********************************************************************/
global class SegmentStageUpdBatch implements Database.Batchable<sObject> {

    global final string query;
    
    global SegmentStageUpdBatch(String qstr) {
        query = qstr;
    }
    
    global SegmentStageUpdBatch(){
        query = 'SELECT ID, Activation_Date__c, Activation_Stage__c from Contact WHERE Activation_Date__c != Null' ;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Contact> contactList) {
        List<Contact> newList = Contact_Maintenance.Correct_Stage(contactList);
        update newList;
    }
    
    global void finish(Database.BatchableContext BC) {
    }    
}