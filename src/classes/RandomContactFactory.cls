public class RandomContactFactory {

        public static List<Contact> generateRandomContacts(Integer numContactsToCreate, String contactLastName){
        
        List<Contact> c = new List<Contact>();
        for (integer i = 0; i < numContactsToCreate; i++) {
        	Contact newC = new Contact(Lastname =contactLastName, FirstName='FakeN' + i);
        	c.add(newc);
        }
        return c;
    }
}