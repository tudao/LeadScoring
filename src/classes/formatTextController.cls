public with sharing class formatTextController {
	
	public Demo demo{get;set;}
	
	public formatTextController(){
		demo = new Demo();
	}
	
	public class Demo{
		public String text{get;set;}
		public String result{get;set;}
		public Demo(){
			this.text = '\t\r\n 123 \t \n 45 567,90 \t\n 8,023,456 \n 123,456;8,123,456';
		}
			
	}
	
	public PageReference processString(){
		demo.result = demo.text.trim().replace(',',';').replace(' ',';').replace('\r',';').replace('\t',';').replace('\n',';');
		
		for(integer i=0; i< 10; i++){
			demo.result = demo.result.replace(';;',';');
		}
		
		return null;
	}

}