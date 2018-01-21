public class AddPrimaryContact implements Queueable{

    private Contact localcontact; 
    private String localstate;
    
    public AddPrimaryContact(Contact con, String state){
        this.localcontact = con;
        this.localstate = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = new List<Account>([Select ID from Account where BillingState = :localstate LIMIT 200]);
        List<Contact> newContacts = new List<Contact>();
        
        System.debug('# accounts - ' + accounts.size());
        for (Account ac: accounts) {
            localContact.account = ac;
			NewContacts.add(localContact.clone());
        }
        insert newContacts;
        System.debug('# contacts in list - ' + newContacts.size());
    }

}