/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
public class AccountHandler {



// Constructor
	public AccountHandler() {
	}

// Routine
	public static  Account  insertNewAccount(String accountName){

		Account accountToInsert = new Account(Name=accountName);
		try {
		insert accountToInsert;
		}
		catch (DmlException e) {
			accountToInsert = null;
		}
	return accountToInsert;
	}
}