public class NewCaseListController {

    public List<Case> getNewCases() {


    List<Case> results = [Select Id, CaseNumber from Case where Status = 'NEW'];

    return results;
	}

}