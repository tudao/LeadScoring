public with sharing class GBlogspotController {
	
	/* simple logging */
	List<String> logMessages = new List<String>(); 
	public string[] log { get { return logMessages; } } 
	public integer logLen { get { return logMessages.size(); }}

	// manage the session token from a querystring param
	public string authToken { public get { 
		return ApexPages.currentPage().getParameters().get('sesstoken');
	}}
	
	public GBlogspotController(){
		if(authToken!=null){
			try{
			BloggerService service = new BloggerService();  
			service.setAuthSubToken(authToken);  
			
			logMessages.add('==============');
			logMessages.add(BloggerService.defaultFeed);
			
			GoogleData allBlogs = service.getFeed( BloggerService.defaultFeed  ); 
			
			allBlogs.dump(); 
			
			logMessages.add(allBlogs.entries[0].getValue('id'));
			        
			xmldom.element oneBlog = allBlogs.entries[0];
			        
			string postFeedUrl = GoogleData.getRelLink(oneBlog, BloggerService.postUrl); 
			GoogleData posts = service.getFeed( postFeedUrl ); 
			
			posts.dump(); 
			}catch(Exception ex){
				logMessages.add('ERROR : ' + ex.getMessage());
			}
 			
		}else{
			logMessages.add('==============NULL TOKEN');
		}
		
	}
	
	public List<String> getBlogPosts(){
		List<String> postList = new List<String>();
		
		
		
		return postList;
	}
}