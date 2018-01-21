/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
public class ContactSearch {

	public static List<Contact> searchForContacts(String lastNameCriteria, String postalCodeCriteria) {
		List<Contact> con =  [Select ID, Name from Contact where LastName=:lastNameCriteria and MailingPostalCode =: postalCodeCriteria];
		return con;
	}


}