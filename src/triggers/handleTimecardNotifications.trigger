trigger handleTimecardNotifications
on Timecard__c (after update) {
for (Timecard__c timecard : trigger.new) {
if (timecard.Status__c !=
trigger.oldMap.get(timecard.Id).Status__c &&
(timecard.Status__c == 'Approved' ||
timecard.Status__c == 'Rejected')) {
Resource__c resource =
[ SELECT Client__r.Email FROM Resource__c
WHERE Id = :timecard.Resource__c LIMIT 1 ];
Proj__c project =
[ SELECT Name FROM Proj__c
WHERE Id = :timecard.Project__c LIMIT 1 ];
User user = [ SELECT Name FROM User
WHERE Id = :timecard.LastModifiedById LIMIT 1 ];
Messaging.SingleEmailMessage mail = new
Messaging.SingleEmailMessage();
mail.toAddresses = new String[]
{ resource.Client__r.Email };
mail.setSubject('Timecard for '
+ timecard.Week_Ending__c + ' on '
+ project.Name);
mail.setHtmlBody('Your timecard was changed to '
+ timecard.Status__c + ' status by '
+ user.Name);
Messaging.sendEmail(new Messaging.SingleEmailMessage[]
{ mail });
}
}
}