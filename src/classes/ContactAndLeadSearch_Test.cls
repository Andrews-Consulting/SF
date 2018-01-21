/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
@isTest
private class ContactAndLeadSearch_Test {

	@isTest static void UnitTest1() {

		List<List<SObject>> so = ContactAndLeadSearch.searchContactsAndLeads('Smith');
	}	
}