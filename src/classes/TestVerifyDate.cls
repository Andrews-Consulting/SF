@isTest
private class TestVerifyDate {

	@isTest static void UnitTest1(){

		Date dt = VerifyDate.checkDates(System.Today(),System.Today()+1);
		System.assertEquals(System.Today()+1,dt);
	}

	@isTest static void UnitTest2(){

		Date dt = VerifyDate.checkDates(System.Today(), System.Today()+60);
		System.assertEquals(system.today().month(), dt.month(),'month of result is not current month');
		System.assertEquals(1,(dt + 1).day(),'Day + 1 is not the first');

	}

}