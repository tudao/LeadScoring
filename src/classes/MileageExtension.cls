public class MileageExtension {

    private final Mileage__c mileageObj;
    
	public MileageExtension(ApexPages.StandardController controller) {
		this.mileageObj = (Mileage__c)controller.getRecord();
	}
	
	public Mileage__c[] getTodaysMileageRecords() {
		String createdbyId = UserInfo.getUserId();
		Mileage__c[] mileageList =
		[SELECT name, miles__c
		FROM Mileage__c
		WHERE Date__c = TODAY
		AND createdbyid = :createdbyId];
		return mileageList;
	}
}