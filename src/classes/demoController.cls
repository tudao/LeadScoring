public with sharing class demoController {

	public boolean renderLifeQuotes{get;set;}
	public String quoteFile{get;set;}
	
	public demoController(){
		renderLifeQuotes = false;
	}
	
	public PageReference refreshLifeQuotes(){
		renderLifeQuotes = true;
		double num = math.random()*15; 
		quoteFile = 'lifequotes/' + num.intValue().format() + '.gif';
		return null;
	}
}