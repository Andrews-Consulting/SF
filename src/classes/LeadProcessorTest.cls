@isTest (SeeAllData=false)
public class LeadProcessorTest {

	@testSetup static void Setup() {
        List<Lead> leadlist = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            leadlist.add(new Lead(LastName='LastName'+i.format(), Company='Company_'+i.format()));
        }
        insert leadlist;
        return;
    }

  
    @isTest static void UnitTest1() {
        Test.startTest();
        LeadProcessor lb = new LeadProcessor();
        ID thisBatchJob = Database.executeBatch(lb);
        Test.stopTest();
        return;  
    }
}