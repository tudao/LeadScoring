public with sharing class BlogAppController {
	
public List<Article__c> latestarticle =new List<Article__c>();
	
public void pageload(){
 // Get the current month
 datetime currentdate=system.now();
 Integer currentmonth = currentdate.month();   
 latestarticle = [select Id,name,CreatedDate,Author__c,Category__c,Article_Description__c from Article__c where createdmonth__c=:currentmonth order by createddate limit 100];
}

Public Article__c newarticle;
public List<Article__c> getarticles()
{
 return latestarticle;
}
public void category()
{
 String parameter = System.currentPagereference().getParameters().get('category');
 latestarticle = [select Id,name,CreatedDate,Author__c,Category__c,Article_Description__c from Article__c where category__c=:parameter order by createddate limit 100];
}
public Article__c getarticle()
{
 newarticle = new Article__c();
 return newarticle;
}
public Pagereference SaveArticle()
{
 
 insert newarticle;
 Pagereference articlehome = new Pagereference('/apex/BlogAppArticles');
 return articlehome;
}
Public Pagereference createnewarticle()
{
 Pagereference createarticle= new Pagereference('/apex/BlogAppNewArticle');
 return createarticle;
}      
}