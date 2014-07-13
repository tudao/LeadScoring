public with sharing class TodoController {

	public List<To_Do__c> todoList{get;set;} 
	public String deletedItem{get;set;}
	
	public TodoController(){
		todoList = [Select Id, Name,Title__c, Status__c, Priority__c, Notes__c, Due_Date__c from To_Do__c order by CreatedDate];
	}
	
	public PageReference save(){
		update todoList;
		return null;
	}
	
	public PageReference cancel(){
		todoList = [Select Id, Name,Title__c, Status__c, Priority__c, Notes__c, Due_Date__c from To_Do__c order by CreatedDate];
		return null;
	}
	
	public PageReference addNew(){
		To_Do__c todo = new To_Do__c(Title__c = 'New Todo Item');
		insert todo;
		todoList.add(todo);
		return null;
	}
	
	public PageReference deleteItem(){
		for(integer i=todoList.size()-1; i>=0; i--){
			if(todoList.get(i).Id==deletedItem){
				To_Do__c td = todoList.get(i);
				todoList.remove(i);
				delete td;
				break;
			}
		}
		return null;
	}
}