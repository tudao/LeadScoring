trigger OppContactRoleCount on Opportunity (before update) {
   /****************************************************************************************************
   *  Take the Map outside the for loop to reduce SOQL Queries :  Logic for the Bulk Trigger 
   *******************************************************************************/
   Map<Id, Opportunity> opportunityMap = new Map<Id,Opportunity>([Select Id From Opportunity WHERE id in :Trigger.newMap.keySet()]);
    
   Map<Id, List<OpportunityContactRole>> contactRoleMap = new Map<Id, List<OpportunityContactRole>>();
    
   List<OpportunityContactRole> contactRolesList = new List<OpportunityContactRole> ([SELECT Id, OpportunityId  from OpportunityContactRole  where OpportunityId in :Trigger.newMap.keySet()]);
    
   for(OpportunityContactRole EachOppRole: contactRolesList )// Iterate and poopulate the Map 
   {
      List<OpportunityContactRole> crList = contactRoleMap.get(EachOppRole.OpportunityId);
     
      if (crList == null) {
         crList = new List<OpportunityContactRole>();
         contactRoleMap.put(EachOppRole.OpportunityId, crList);
      }
      crList.add(EachOppRole);//populate the list by fetching value from the map 
   }
   /******************************************************************
   *Count Contact_Role_Count Field through map size 
   *****************************************************************/
   for(Opportunity opp : Trigger.new){
      List<OpportunityContactRole> oContactRoles = new List<OpportunityContactRole>(contactRoleMap.get(opp.id));
      if(oContactRoles!=NULL && !oContactRoles.isempty()){ 
         opp.Contact_Role_Count__c = oContactRoles.size();
      }else{
         opp.Contact_Role_Count__c = 0;
      }
   }
}