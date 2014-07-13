global with sharing class DevAccCustomLoginController {
	 //set username/ password variables via page
    global String username {get; set;}
    global String password {get; set;}
    
    global PageReference login() {

      //start url of the page
      String startUrl = 'https://login.salesforce.com';

    startUrl += '&un=' + username;
        startUrl += '&pw='+ password;

        //set reference and attempt login
        PageReference portalPage = new PageReference(startUrl);
        portalPage.setRedirect(true);
        PageReference p = Site.login(username, password, startUrl);

        //if p==null, no login
        if (p == null) {
              return Site.login(username, password, null);
        } else {
              return portalPage;
        }
    }

    //test data provided by salesforce
     global DevAccCustomLoginController () {
     }

    @IsTest(SeeAllData=true) 
    global static void testSiteLoginController () {
        // Instantiate a new controller with all parameters in the page
        SiteLoginController controller = new SiteLoginController ();
        controller.username = 'test@salesforce.com';
        controller.password = '123456';

        System.assertEquals(controller.login(),null);
    }
}