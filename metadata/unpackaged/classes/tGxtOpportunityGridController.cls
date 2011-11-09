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
private class tGxtOpportunityGridController {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        
        Test.startTest();
        
        User u1 = [select ID from User where alias = 'ttest'];
		System.RunAs(u1)
		{
			List<SelectOption> results = null;
			GxtOpportunityGridController controller = new GxtOpportunityGridController();
			List<SelectOption> userList = controller.getUsers();
			System.Assert(userList != null);
		
			List<SelectOption> stageList = controller.getStage();
			System.Assert(stageList != null);
			
			List<SelectOption> dateList = controller.getContractDate();
			System.Assert(dateList != null);
			
			List<SelectOption> servicecenterList = controller.getServiceCenter();
			System.Assert(servicecenterList != null);
			
			List<SelectOption> statusList = controller.getStatus();
			System.Assert(statusList != null);
			
			String tdate = controller.QCurrentYear(4);
			System.AssertEquals('2011-04-01', tdate);
			
			tdate = controller.QPreviousYear(10);
			System.AssertEquals('2010-10-01', tdate);
			
			tdate = controller.QNextYear(8);
			System.AssertEquals('2012-08-01', tdate);
			
			
			//test 1...contract date
   			controller.selectedContractDate = 'Q3CurrentYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1a...contract date if no records
			controller.selectedContractDate = 'Q1NextYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1b...contract date if no records
			controller.selectedContractDate = 'Q1CurrentYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1c...contract date if no records
			controller.selectedContractDate = 'Q2CurrentYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1d...contract date if no records
			controller.selectedContractDate = 'allCurrentYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1e...contract date if no records
			controller.selectedContractDate = 'allNextYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 1f...contract date if no records
			controller.selectedContractDate = 'Q4PreviousYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
   			
   			//test 2...service center
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = 'HGSC - Houston';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 2a...service center
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = 'NoValue';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 3...status			
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = 'Open';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 3a...status			
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = 'All';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 3b...status			
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = 'Won';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 4...selected user			
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '005400000012lD5';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 4a...selected user			
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = 'NoValue';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			
			//test 5... testing 2 options
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = 'DGSC - Denver/Calgary';
   			controller.selectedUser = '';
   			controller.selectedStatus  = 'All';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 6... testing 2 options
			controller.selectedContractDate = 'Q4CurrentYear';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = '';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 7... testing 4 options
			controller.selectedContractDate = 'Q4CurrentYear';
   			controller.selectedServiceCenter = 'DGSC - Denver/Calgary';
   			controller.selectedUser = '005400000012lD5';
   			controller.selectedStatus  = 'All';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			//test 8... testing 4 options
			controller.selectedContractDate = '';
   			controller.selectedServiceCenter = '';
   			controller.selectedUser = '';
   			controller.selectedStatus  = 'Open';
   			controller.Find();
   			System.Assert(controller.searchResults != null);
			
			List<Opportunity> sResults = controller.searchResults ;
			
			System.Assert(sResults != null);
			
			For (Opportunity o : sResults)
			{
				o.Amount = 0.00;
			}
			
			String page = '';
			page = controller.save().getUrl();
			System.AssertEquals('/apex/OpportunityGrid_cvf',page );
		
			//test discard method
			page = controller.discard().getUrl();
			System.AssertEquals('/apex/OpportunityGrid_cvf',page );
			
			//test cancel method
			page = controller.cancel().getUrl();
			System.AssertEquals('/home/home.jsp',page );
			controller = null;
		}
        
    }
}