public class AccountProcessor {

    @future
    public static void countContacts(List<ID> IdList){
        // For each Account ID passed to the method, count the number of Contact records associated to it and update the 'Number_of_Contacts__c' field with this value.

        List<Account> accList = new List<Account>();
//      	system.Debug(' size of idlist = ' + idlist.size());
        
        for(ID  aid : IdList ) {
            Integer contact_count = [Select count() from Contact where account.id = :aid];
//			System.debug(' contact count for a.id = ' + aid + ' is ' + contact_count);
            acclist.add(new Account(ID=aid, Number_of_Contacts__c = contact_count));
        }
//        system.debug('size of acclist = ' + acclist.size());
        Update acclist; 
    }
}