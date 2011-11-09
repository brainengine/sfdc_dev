/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class tMasterListContactDuplicator {

    static testMethod void TriggerTest() {
    	
    	Test.startTest();
    	string contact1;
		String page = '';
		User u1 = new User(alias = 'tuser999', email='testuser999@testorg.com', 
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = '00eP0000000QJ5LIAW', 
            timezonesidkey='America/Los_Angeles', username='testuser999@yahoo.com');

		System.RunAs(u1)
		{
    		insert new Contact (FirstName = 'Jack', Phone = '', 
						LastName = 'Sparrow', RecordTypeId = '012P0000000CoRhIAK', Email = 'captnsparrow@testorg.com', 
						Title = 'Captain', AccountId = '001P000000I37m0IAB', 
						Associated_Owners__c = u1.Id );
			
			insert new Contact (FirstName = 'Jack', Phone = '888-111-2525', 
						LastName = 'Sparrow', RecordTypeId = '012P0000000CoRhIAK', Email = 'captnsparrow@testorg.com', 
						Title = 'Captain', AccountId = '001P000000I37m0IAB', 
						Associated_Owners__c = u1.Id );	
		}

		User u2 = new User(alias = 'tuser998', email='testuser998@testorg.com', 
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = '00e30000000cWq2AAE', 
            timezonesidkey='America/Los_Angeles', username='testuser998@yahoo.com');

		System.RunAs(u2)
		{
    		insert new Contact (FirstName = 'Jack', Phone = '', 
						LastName = 'Sparrow', RecordTypeId = '012P0000000CoRhIAK', Email = 'captnsparrow@testorg.com', 
						Title = 'Captain', AccountId = '001P000000I37m0IAB', 
						Associated_Owners__c = u1.Id );
		}

	/*	System.RunAs(u1)
		{
			insert new Contact (FirstName = 'Jack', Phone = '888-111-2525', 
						LastName = 'Sparrow', RecordTypeId = '012P0000000CoRhIAK', Email = 'captnsparrow@testorg.com', 
						Title = 'Captain', AccountId = '001P000000I37m0IAB', 
						Associated_Owners__c = u1.Id );
			
		}

    	
    	User u3 = new User(alias = 'tuser997', email='testuser997@testorg.com', 
            emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US', 
            localesidkey='en_US', profileid = '00eP0000000QJ5LIAW', 
            timezonesidkey='America/Los_Angeles', username='testuser997@yahoo.com');

		System.RunAs(u3)
		{
   			Contact contact = [Select Phone From Contact Where FirstName = 'Jack' And LastName='Sparrow' and Id =:contact1];
			contact.Phone = '111-222-3333';
			update contact;
		}
    */	
 		Test.stopTest();
    }
}