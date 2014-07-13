global with sharing class CustomLoginController {

  //set username/ password variables via page
    global String username {get; set;}
    global String password {get; set;}
    
    global PageReference login() {

      //static org-id and portal id
      String strOrgID = '00DU0000000KDW1';
      String strPortalID = '060U0000000DCQR';
      String strURL = 'https://na12.salesforce.com';
      //start url of the page
      String startUrl = strUrl + '/secur/login_portal.jsp?orgId=' + strOrgID + '&portalId=' + strPortalID;

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
     global CustomLoginController () {
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