/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestTimecardManager {
	
	private static ID resourceId, projectId;
	
	static {
		Resource__c resource = new Resource__c(Name = 'Bob');
		insert resource;
		resourceId = resource.Id;
		Proj__c project = new Proj__c(Name = 'Proj1');
		insert project;
		projectId = project.Id;
	}

	static testMethod void positiveTest() {
		Date weekEnding = Date.valueOf('2009-04-11');
		insert new Assignment__c(Project__c = projectId,
		Start_Date__c = weekEnding - 6, End_Date__c = weekEnding,
		Resource__c = resourceId);
		insert new Timecard__c(Project__c = projectId,
		Week_Ending__c = weekEnding, Resource__c = resourceId);
	}
	
	static testMethod void testNoAssignments() {
		Timecard__c timecard = new Timecard__c(Project__c = projectId,
		Week_Ending__c = Date.valueOf('2009-04-11'),
		Resource__c = resourceId);
		try {
			insert timecard;
		} catch (DmlException e) {
			System.assert(e.getMessage().indexOf('No assignments') > 0);
			return;
		}
	}
	
	static testMethod void testNoValidAssignments() {
		Date weekEnding = Date.valueOf('2009-04-04');
		insert new Assignment__c(Project__c = projectId,
		Start_Date__c = weekEnding - 6, End_Date__c = weekEnding,
		Resource__c = resourceId);
		try {
			insert new Timecard__c(Project__c = projectId,
			Week_Ending__c = Date.today(), Resource__c = resourceId);
		} catch (DmlException e) {
			System.assert(e.getMessage().indexOf('No assignment for resource') > 0);
			return;
		}
		System.assert(false);
	}
	
	static testMethod void testBatch() {
		Date weekEnding = Date.valueOf('2009-04-11');
		insert new Assignment__c(Project__c = projectId,
		Start_Date__c = weekEnding - 6, End_Date__c = weekEnding,
		Resource__c = resourceId);
		List<Timecard__c> timecards = new List<Timecard__c>();
		for (Integer i=0; i<5000; i++) {
			timecards.add(new Timecard__c(Project__c = projectId,
			Week_Ending__c = weekEnding, Resource__c = resourceId));
		}
		insert timecards;
	}
}