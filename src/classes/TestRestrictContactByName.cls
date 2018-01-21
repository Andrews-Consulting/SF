@isTest
private class TestRestrictContactByName {


	@isTest static void UnitTest1(){

		contact c = new contact(Firstname='Test1', LastName='ValidLN');
		insert c;
	}

	@isTest static void UnitTest2(){

		contact c = new contact(Firstname='Test2', LastName='INVALIDNAME');
		insert c;
	}
}