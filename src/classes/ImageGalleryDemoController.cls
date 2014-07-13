public class ImageGalleryDemoController {

  public List<Property_Media__c> getPropertyMedia() {
	return [ Select Id, Name, Url__c from Property_Media__c ];
  }

}