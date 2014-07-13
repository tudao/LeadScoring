public class EmailUtil {
       private Messaging.SingleEmailMessage singleEmailMessage;
       private final List<String> toAddresses;
       
       //optional parameters set to default        
       private String subject = '';
       private String htmlBody = ''; 
       private Boolean useSignature = false;
       private List<Messaging.EmailFileAttachment> fileAttachments = null;
       //defaults to current user's first name + last name
       private String senderDisplayName = UserInfo.getFirstName()+' '+UserInfo.getLastName();
       //get the current user in context
       User currentUser = [Select email from User where username = :UserInfo.getUserName() limit 1];        
       //replyTo defaults to current user's email 
       private String replyTo = currentUser.email;
       private String plainTextBody = '';
       
       public EmailUtil(List<String> addresses) {
           this.toAddresses = addresses;
       }
       
       public EmailUtil senderDisplayName(String val) {
           senderDisplayName = val;
           return this;
       }
       
       public EmailUtil subject(String val) {
           subject = val;
           return this;
       }
       
       public EmailUtil htmlBody(String val) {
           htmlBody = val;
           return this;
       }
       
       public EmailUtil useSignature(Boolean bool) {
           useSignature = bool;
           return this;
       }
       
       public EmailUtil replyTo(String val) {
           replyTo = val;
           return this;
       }
       
       public EmailUtil plainTextBody(String val) {
           plainTextBody = val;
           return this;
       }
       
       public EmailUtil fileAttachments(List<Messaging.Emailfileattachment> val) {
           fileAttachments = val;
           return this;
       }
       
       //where it all comes together
       //this method is private and is called from sendEmail()
       private EmailUtil build() {
           singleEmailMessage = new Messaging.SingleEmailMessage();
           singleEmailMessage.setToAddresses(this.toAddresses);
           singleEmailMessage.setSenderDisplayName(this.senderDisplayName);
           singleEmailMessage.setSubject(this.subject);
           singleEmailMessage.setHtmlBody(this.htmlBody);
           singleEmailMessage.setUseSignature(this.useSignature);
           singleEmailMessage.setReplyTo(this.replyTo);
           singleEmailMessage.setPlainTextBody(this.plainTextBody);
           singleEmailMessage.setFileAttachments(this.fileAttachments);
           return this;
       }
       
       //send the email message
       public void sendEmail() {
              try {
                  //call build first to create the email message object
                  build();
                  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { singleEmailMessage });
              } catch (Exception ex) {
                  System.debug('There was a problem while calling Messaging.sendEmail()');
              }                
       }    
           
   }