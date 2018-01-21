@isTEst (Seealldata=true)
public class AccountProcessorTest {

    static testmethod void unittest() {
    
        List<ID> id1list = new List<ID>(new Map<ID,Account>([Select ID from Account]).keyset());
        test.startTest();
        AccountProcessor.countContacts(id1list);
        test.stopTest();
    }
       
}