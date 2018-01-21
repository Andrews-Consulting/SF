global class LeadProcessor implements Database.Batchable<sObject>,Database.Stateful  {

    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator('Select ID, LeadSource from Lead where LeadSource != \'Dreamforce\' ');
    }

    global void execute(Database.BatchableContext bc, List<Lead> records){
        // process each batch of records
        for (Lead r : records) {
            r.LeadSource = 'Dreamforce';
        }
        update records;
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    

}