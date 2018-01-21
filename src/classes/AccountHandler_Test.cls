/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
@isTest
private class AccountHandler_Test {

	@isTest static void UnitTest1() {

			Account newAccount = AccountHandler.insertNewAccount((String)null);
			system.debug('Account = ' + newAccount);

			newAccount = AccountHandler.insertNewAccount('Sample');
			system.debug('Account = ' + newAccount);

}

}