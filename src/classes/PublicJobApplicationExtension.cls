public with sharing class PublicJobApplicationExtension {
// This controller extends the standard controller
// overwrites the actions
// creates a candidate record
// creates attachment on the candidate record based on the uploaded file  
// creates a job application record that links the candidate record and the related position
  
    private final Candidate__c candidate;
    private ID positionid = ApexPages.currentPage().getParameters().get('jobid');
    private Job_Application__c jobapplication {get; private set;}
    public Blob resume {get; set;}
    public String contentType {get; set;}
    public String fileName {get; set;}

// Extends the standard controller for the candidate object
    public PublicJobApplicationExtension(ApexPages.StandardController stdController) {
       candidate = (Candidate__c)stdController.getRecord();
    }

     public Position__c getPosition() {
        return [SELECT id, name, Job_Description__c FROM Position__c
                WHERE id = :positionid];
    }
       
     public PageReference saveApplication() {
// Creates the candidate record
       try {
           insert(candidate);
       } catch(System.DMLException e) {
           ApexPages.addMessages(e);
           return null;
       }
       jobapplication = new Job_Application__c();
       jobapplication.Candidate__c = candidate.id;
       jobapplication.Position__c = positionid;
       
// Creates an attachment to the candidate record if a resume file is uploaded
    if (resume != null) {
        Attachment attach = new Attachment();
        attach.Body = resume;
        attach.Name = fileName;
        attach.ContentType = contentType;
        attach.ParentId = candidate.id;
       try {
           insert(attach);
       } catch(System.DMLException e) {
           ApexPages.addMessages(e);
           return null;
       }
            
    }

// Creates the job application record to link the candidate and the related position
       try {
           insert(jobapplication);
       } catch(System.DMLException e) {
           ApexPages.addMessages(e);
           return null;
       }
       PageReference p = Page.PublicJobApplicationConfirmation;
       p.setRedirect(true);
       return p;
    }

}