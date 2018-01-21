/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
public class ContactAndLeadSearch{

	public static List<List< SObject>> searchContactsAndLeads(String searchCriteria) {
		return (List<List<sObject>>) [FIND :searchCriteria IN NAME FIELDS RETURNING Lead,Contact];
	}

	
}