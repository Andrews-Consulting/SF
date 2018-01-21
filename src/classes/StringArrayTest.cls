/***************************************************************************
// (c) 2016  Andrews Consulting
//
// Description    	: Class to facilitate Trailhead training
//                  
// 06 Jan 2016		: Initial Implementation
//***************************************************************************/
public class StringArrayTest {



// Constructor
	public StringArrayTest() {
	}


	public static List<String> generateStringArray(Integer maxStringCount){
		List<String> tempStringArray = new  List<String>();
		for(Integer i=0;i<maxStringCount;i++) {
			tempStringArray.add('Test ' + i.format());
		}
		return tempStringArray;
	}
}