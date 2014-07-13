public with sharing class showAttachmentController {
public String imageURL{get;set;}
   
  public showAttachmentController()
  {
    imageURL='/servlet/servlet.FileDownload?file=';
    List< Attachment > documentList=[select name from Attachment where 
                                    Name='IMG_1301.JPG'];
   
    if(documentList.size()>0)
    {
      imageURL=imageURL+documentList[0].id;
    }
  }
}