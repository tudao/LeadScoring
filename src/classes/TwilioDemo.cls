public with sharing class TwilioDemo {

	// To find these visit https://www.twilio.com/user/account
	public static String ACCOUNT_SID  = 'AC0c90f4d5297d9d4faaeb7a4fc174e775';
	public static String AUTH_TOKEN  = 'b2a0a55ae1005ed5a0bbcdc9c5495644';
	
	public static void testSMSMessaging(){
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN );
	
		Map<String,String> properties  = new Map<String,String> {
		        'To'   => '9991231234',
		        'From' => '9991231234',
		        'Body' => 'Hello!'
		    };
		TwilioSMS message = client.getAccount().getSmsMessages().create(properties);
	}
}