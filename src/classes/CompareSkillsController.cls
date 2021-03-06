public class CompareSkillsController {
public String resourceId { get; set; }
public String skill { get; set; }
public List<Skill__c> getData() {
return [ SELECT Resource__r.Name, Type__c, Rating__c
FROM Skill__c
WHERE Type__c = :skill
AND Rating__c NOT IN ('', '0 - None') AND
Resource__c != :resourceId
ORDER BY Rating__c DESC ];
}
}