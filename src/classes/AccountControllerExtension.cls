public with sharing class AccountControllerExtension {
	
	public Account account {get; set;}
	public boolean isInvalidData {get; set;}

	public AccountControllerExtension(ApexPages.StandardController stdController) {
		this.account = (Account)stdController.getRecord();
		
		isInvalidData = false;
	}
	
	public PageReference save(){
		validate();
		return null;
	}
	
	public void validate(){
		
		isInvalidData = false;
		
		if(account.SLA__c.equals('Platinum') || account.SLA__c.equals('Bronze')){
			account.SLA__c.addError('Should be \'Gold\' or \'Silver\'');
			isInvalidData = true;
		}
		
		if(account.SLAExpirationDate__c <= System.today()){
			account.SLAExpirationDate__c.addError('Should be a future date');
			isInvalidData = true;
		}
	}
}