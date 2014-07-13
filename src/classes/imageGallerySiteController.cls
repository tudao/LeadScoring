public with sharing class imageGallerySiteController {
	
	public List<Image__c> images{get;set;}
	public String activeCategory {get;set;}{activeCategory = 'Flowers';}
	public String dataSource {get;set;}

	public imageGallerySiteController(){
		load();
	}
	
	public List<String> getCategories(){
		List<String> categories = new List<String>();
		
		Schema.sObjectType sobject_type = Image__c.getSObjectType();
		Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); 
		Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap();
		List<Schema.PicklistEntry> pick_list_values = field_map.get('Category__c').getDescribe().getPickListValues();
		for (Schema.PicklistEntry a : pick_list_values) {
			categories.add(a.getValue());
		}
		
		return categories;
	}
	
	public PageReference reload(){
		
		load();
		
		return null;
	}
	
	public void load(){
		String query = 'Select Name, Description__c, url__c from Image__c where Category__c=\'' + activeCategory + '\'';
		images = Database.query(query);
		
		dataSource = generateJSON(images);
	}
	
	public String generateJSON(List<Image__c> images){
		JSONGenerator generator = JSON.createGenerator(true);
		generator.writeStartArray();
		
		for(Image__c image : images){
			generator.writeStartObject();
			generator.writeStringField('image', image.url__c);
			generator.writeStringField('title', image.Name);  	
			if(image.Description__c!=null){
				generator.writeStringField('description', image.Description__c);	
			}
			generator.writeEndObject(); 
		}
		
		generator.writeEndArray();
		
		return generator.getAsString();
	}
}