public with sharing class imageGalleryController {
	
	public List<Image__c> images{get;set;}
	
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
}