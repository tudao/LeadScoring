@RestResource(urlMapping='/jira')
global class WebHookTest {
    
    @HttpPost
    global static void handlePost(){
        Restrequest req = RestContext.request;
        Restresponse res = RestContext.response;
        
        res.addHeader('Content-Type', 'application/json');
        String resBody = '';
        Case c = [Select Id, Subject, Description from Case where Subject='Jira'];
        try{
            // Parse JSON response to get all the totalPrice field values.
            //JSONParser parser = JSON.createParser();
            JiraIssue newIssue = JiraIssue.parse(req.requestBody.toString());
            c.Description = newIssue.issue.fields.summary;
            update c;
            
            res.statusCode = 200;
            resBody = '{"success": true}';
        }catch(Exception ex){
            c.Description = 'Error: ' + ex.getMessage();
            update c;
            
            res.statusCode = 500;
            resBody = '{"success": false}'; 
        }
        res.responseBody = Blob.valueOf(resBody);
    }
}