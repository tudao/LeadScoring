@isTest
private class TestOppContactRoleCount {
   /*****************************************************
   * Test class to Test Opportunity Before Insert Trigger
   ******************************************************/
   static testMethod void test_OpportunityBeforeInsert(){ 
       //Create New Account
       Account acc = new Account(Name='Test');
       insert acc;
       
       //Create New Opportunity 
       Opportunity opp   = new Opportunity(Name='Test Opp');
       opp.AccountId     = acc.Id;
       opp.StageName     = 'In the Funnel';
       opp.CloseDate     = System.today() + 5;
       insert opp;
       opp = [Select Contact_Role_Count__c from Opportunity where Id=:opp.Id];
       System.AssertEquals(opp.Contact_Role_Count__c, 0); 
       
       Contact c = new Contact();
       c.AccountId   = acc.Id;
       c.LastName    = 'Test';
       c.LeadSource  = 'Other';
       insert c;
       
       //Create New ContactRole Type Record 
       OpportunityContactRole cr = new OpportunityContactRole();
       cr.OpportunityId    = opp.Id;
       cr.Role             = 'Decision Maker';
       cr.ContactId        = c.id; 
       insert cr;
       update opp; 
           
       //Query opp and Test the Role count should be 1 
       opp=[Select Opportunity.Contact_Role_Count__c from Opportunity where Id=:opp.Id];
       System.AssertEquals(opp.Contact_Role_Count__c, 1); 
  } 
}