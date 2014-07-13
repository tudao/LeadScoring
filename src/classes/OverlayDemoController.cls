public with sharing class OverlayDemoController{
    public Account account {get;set;}
    public OverlayDemoController(){
    	account = new Account();	
    	account.Name = 'Test Account';
    	account.Phone = '123456789';
    }
    
    public pagereference saveRecord(){
    	
    	List<contact> contacts = [select id, name from contact];
        List<account> accounts = [select id, name from account];
        List<lead> leads = [select id, name from lead];
        List<case> cases = [select id from case];
        
        return null;
    }
}