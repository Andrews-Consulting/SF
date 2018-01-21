trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();

	system.debug('# recs - ' + trigger.new.size());
	for (Opportunity o : Trigger.New) { 
		if (o.stageName == 'Closed Won') { 
			tasklist.add(new Task(Subject='Follow Up Test Task',WhatId=o.ID));
		}
	}
	if (tasklist.size() > 0) {
		system.debug(' # of tasks - ' + tasklist.size());
		insert tasklist;
	}
	else {
		system.debug('no tasks to insert');
	}
}