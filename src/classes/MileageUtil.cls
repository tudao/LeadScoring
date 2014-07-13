public with sharing class MileageUtil {
	static final Integer MAX_MILES_PER_DAY = 500;

	
	public static void areMilesAllowed(Mileage__c[] miles) {
		String createdbyId = UserInfo.getUserId();
		
		Double totalMiles = 0;
		/* adds miles that were created in previous requests for today */
		for(Mileage__c mq:[SELECT miles__c FROM Mileage__c
		WHERE Date__c = TODAY
		AND Mileage__c.createdById = :createdbyId
		AND miles__c != null]) {
			totalMiles += mq.miles__c;
		}
		
		/* Totals the miles in the request */
		for (Mileage__c m:miles) {
		totalMiles += m.miles__c;
		if(totalMiles > MAX_MILES_PER_DAY)
		m.addError('Mileage request exceeds daily limit: ' + MAX_MILES_PER_DAY);
		}
	}
	
	
}