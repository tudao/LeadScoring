public class blogController {
	
	public Blog_Post__c post {get; set;}
	
	public blogController(ApexPages.StandardController stdController) {
		this.post = (Blog_Post__c)stdController.getRecord();
	}

	public Blog_Post__c[] getPosts() {
	 return [select Name, id, CreatedDate, CreatedBy.Name, Post__c from Blog_Post__c];
	}
	
	public PageReference savePost(){
		update post;
		return null;
	}
}