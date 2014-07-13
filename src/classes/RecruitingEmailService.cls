global class RecruitingEmailService implements Messaging.InboundEmailHandler {
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          
          //Reply
          String fromAddress = envelope.fromAddress;
          List<String> toAddresses = new List<String> {fromAddress};
          EmailUtil emailUtil = new EmailUtil(toAddresses);
          String subject = email.subject;
          List<Case> cases = [Select ID from Case where Subject=:subject];
          String s = '';
          if(!cases.isEmpty()){
            s = ' case created';
          }
          emailUtil.plainTextBody('Thanks for sending email !' + s).sendEmail();
          
          return result;
      }
  }