public with sharing class SubmitCaseController {
	
	public Case c { get; set; }
	
	public String acctNum { get; set; }
	
	public SubmitCaseController() {
		c = new Case();
	}
	
	public PageReference submitCase() {
		List<Account> accts = [SELECT Id FROM Account WHERE AccountNumber =:acctNum];
		if (accts.size()!= 1) {
			ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.FATAL, 'Invalid account number');
			ApexPages.addMessage(msg);
			return null;
		} else {
			try {
				c.AccountId = accts.get(0).Id;
				
				// now look for an associated contact with the same email
				Contact cnt = [SELECT Id FROM Contact WHERE AccountId =:c.AccountId AND Email =:c.SuppliedEmail LIMIT 1];
				if (cnt!= null) 
					c.ContactId = cnt.Id;
					
				// Specify DML options to ensure the assignment rules are executed
				Database.DMLOptions dmlOpts = new Database.DMLOptions();
				dmlOpts.assignmentRuleHeader.useDefaultRule = true;
				c.setOptions(dmlOpts);

				// Insert the case
				INSERT c;
				ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.INFO, 'Your case has been recorded.');
				ApexPages.addMessage(msg);
				return new PageReference('/apex/submitCase');
				
			} catch (Exception e) {
				ApexPages.addMessages(e);
				return null;
			}
		}
	}
}