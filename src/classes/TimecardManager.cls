public class TimecardManager {
	public class TimecardException extends Exception {}
	public static void handleTimecardChange(List<Timecard__c> oldTimecards,List<Timecard__c> newTimecards) {
	Set<ID> resourceIds = new Set<ID>();
	for (Timecard__c timecard : newTimecards) {
		resourceIds.add(timecard.Resource__c);
	}
	List<Assignment__c> assignments = [ SELECT Id, Start_Date__c, End_Date__c, Resource__c FROM Assignment__c
										WHERE Resource__c IN :resourceIds ];
	if (assignments.size() == 0) {
		throw new TimecardException('No assignments');
	}
		
		Boolean hasAssignment;
for (Timecard__c timecard : newTimecards) {
hasAssignment = false;
for (Assignment__c assignment : assignments) {
if (assignment.Resource__c == timecard.Resource__c &&
timecard.Week_Ending__c - 6 >= assignment.Start_Date__c &&
timecard.Week_Ending__c <= assignment.End_Date__c) {
hasAssignment = true;
break;
}
}
if (!hasAssignment) {
	Resource__c r = [Select Name from Resource__c where Resource__c.Id =: timecard.Resource__c LIMIT 1];
timecard.addError('No assignment for resource ' +
r.Name + ', week ending ' +
timecard.Week_Ending__c);
}
}
}
}