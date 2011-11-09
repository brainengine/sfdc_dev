public with sharing class GxtOpportunityGridController {
    
    //variable declaration
    private ApexPages.StandardController controller {get; set;}
    public List<Opportunity> searchResults {get;set;}
    public String selectedUser {get;set;}
    public String selectedStage {get;set;}
    public String selectedContractDate {get;set;}
    public String selectedStatus {get;set;}
    public String selectedServiceCenter {get;set;}
    public List<SelectOption> userList;
    public List<SelectOption> servicecenterList;
    public List<SelectOption> contractdateList;
    public List<SelectOption> statusList;
    
    // standard controller - could also just use custom controller
    public GxtOpportunityGridController(ApexPages.StandardController controller) { }
    public GxtOpportunityGridController() { }
  
    public PageReference GotoOpp()
    {
    	String id = System.currentPageReference().getParameters().get('HiddenId');
    	return new PageReference('/' + id );
    }
    
    //get Users method and returns List of Users 
    public List<SelectOption> getUsers() 
    {
        if (userList == null) 
        {
        	//make sure to add Opportunity_owner__c to the production version
            List<User> usrs = [select id,firstname,lastname from user where IsActive = true order by firstname, lastname ];

            userList = new List<SelectOption>();
            userList.add(new SelectOption('NoValue', '-Select One-'));
            
            for (User u : usrs) 
            {
                userList.add(new SelectOption(u.id, u.firstname + ' ' + u.lastname));
            }
        }
        return userList;
    }
    
    public List<SelectOption> getStage()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('1 - Lead/Prospect', '1 - Lead/Prospect'));
        items.add(new SelectOption('2 - Qualified Opportunity', '2 - Qualified Opportunity'));
        items.add(new SelectOption('3 - Quote Submission', '3 - Quote Submission'));
        items.add(new SelectOption('4 - Won/Committed', '4 - Won/Committed'));
        items.add(new SelectOption('Closed - Lost to Competitor', 'Closed - Lost to Competitor'));
        items.add(new SelectOption('Closed - No Bid', 'Closed - No Bid'));
        items.add(new SelectOption('Closed - Postponed/Cancelled', 'Closed - Postponed/Cancelled'));
        return items ;
    }
   
    public List<SelectOption> getContractDate()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('allopen', 'All Open Opportunities'));
        items.add(new SelectOption('allCurrentYear', 'All Current Year '));
        items.add(new SelectOption('Q4PreviousYear', 'Q4 Previous Year'));
        items.add(new SelectOption('Q1CurrentYear', 'Q1 Current Year'));
        items.add(new SelectOption('Q2CurrentYear', 'Q2 Current Year'));
        items.add(new SelectOption('Q3CurrentYear', 'Q3 Current Year'));
        items.add(new SelectOption('Q4CurrentYear', 'Q4 Current Year'));
        items.add(new SelectOption('allNextYear', 'All Next Year'));
        items.add(new SelectOption('Q1NextYear', 'Q1 Next Year'));
        return items ;
    }
    
    public List<SelectOption> getServiceCenter()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('AGSC - Angola', 'AGSC - Angola'));
        items.add(new SelectOption('DGSC - Denver/Calgary', 'DGSC - Denver/Calgary'));
        items.add(new SelectOption('HGSC - Houston', 'HGSC - Houston'));
        items.add(new SelectOption('LGSC - London', 'LGSC - London'));
        items.add(new SelectOption('NGSC - Nigeria', 'NGSC - Nigeria'));
        items.add(new SelectOption('TGSC - Trinidad', 'TGSC - Trinidad'));
        items.add(new SelectOption('VGSC - Venezuela', 'VGSC - Venezuela'));
        return items;
    }
    
    public List<SelectOption> getStatus()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('All', 'All'));
        items.add(new SelectOption('Open','Open'));
        items.add(new SelectOption('Won', 'Won'));
        return items;
    }
   
    // fired when the search button is clicked
    public PageReference Find() 
    {
        String qrySeed = 'select o.AccountId,o.Id, o.Name, o.StageName, o.Estimated_Duration_weeks__c, o.CloseDate, ' +
        	'o.Projected_Start_Date__c, o.Service_Center__c, o.Amount, o.Opportunity_Stage_Comments__c from Opportunity o ';
        String qryEnd = 'order by o.name limit 1000'; 
       	String qry = '';
       	String qryB = '';
        string qryBody = '';
        String qryA = '';
        String qryC = '';
        String qryD = '';
     
        if (selectedContractDate  == 'Q4PreviousYear')
        {
            qryA = ' and (closedate >= ' + QPreviousYear(10) + ' and closedate < ' +  QPreviousYear(12) + ') ' ;
        }
        else if (selectedContractDate  == 'Q1CurrentYear')
        {
            qryA = ' and (closedate >= ' + QCurrentYear(1) + ' and closedate < ' +  QCurrentYear(4) + ') ' ;
        }
        else if (selectedContractDate  == 'Q2CurrentYear')
        {
            qryA = ' and (closedate >= ' + QCurrentYear(4) + ' and closedate < ' +  QCurrentYear(7) + ') ' ;
        }
        else if (selectedContractDate  == 'Q3CurrentYear')
        {
            qryA = ' and (closedate >= ' + QCurrentYear(7) + ' and closedate < ' +  QCurrentYear(10) + ') ' ;
        }
        else if (selectedContractDate  == 'Q4CurrentYear')
        {
            qryA = ' and (closedate >= ' + QCurrentYear(10) + ' and closedate < ' +  QCurrentYear(12) + ') ' ;
        }
        else if (selectedContractDate  == 'Q1NextYear')
        {
            qryA = ' and (closedate >= ' + QNextYear(1) + ' and closedate < ' +  QNextYear(4) + ') ' ;
        }
        else if (selectedContractDate == 'allCurrentYear')
        {
        	qryA = ' and (closedate >= ' + QCurrentYear(1) + ' and closedate < ' +  QCurrentYear(12) + ') ' ;
        }
        else if (selectedContractDate == 'allNextYear')
        {
        	qryA = ' and (closedate >= ' + QNextYear(1) + ' and closedate < ' +  QNextYear(12) + ') ' ;
        }
        else
        {
            qry = '';
        }
        
        if (selectedServiceCenter == 'NoValue')
        {
            qryB = '';
        }
        else
        {
            qryB = ' and Service_Center__c = \'' + selectedServiceCenter + '\' ' ;
        }
              
        if (selectedUser == 'NoValue')
        {
            qryC = '';
        }
        else
        {
            qryC = ' and OwnerId = \'' + SelectedUser + '\' ' ;
        }
      
        if (selectedStatus == 'All')
        {
        	qryD = ' and (IsClosed = false or (IsClosed = true and IsWon = true) ) ';
        }
        else if (selectedStatus == 'Open')
        {
            qryD = ' and (IsClosed = false) ';
        }
        else if (selectedStatus == 'Won')
        {
            qryD = ' and (IsWon = true) ';
        }
        else
        {
            qryD = '';
        }
        
        
      
        if (qryA == '' && qryB == '' && qryC == '' && qryD == '')
        {
              qryBody = '';
        }
        else
        {
            qryBody = ' where Id != null ' + qryA + qryB + qryC + qryD;
        }
        
        qry = qrySeed + qryBody + qryEnd;
        //System.debug('Query: ' + qry);
        searchResults = Database.query(qry);
    
        return null;
    }
 
     public String QPreviousYear(Integer thisMonth)
     {
         datetime ntd = datetime.Now();
         Integer month = thisMonth;
         Integer day = 1;
         Integer tempyear = Integer.valueOf( ntd.year() ) ;
         Integer year;
         
         //move to 1/1 next year
         if (thismonth == 12)
         {
             month = 1;
             year = tempyear;
         }
         else
         {
              year = tempyear - 1;
         }
         
         datetime td = datetime.newInstance(year, month, day) ;
         return ( td.format('yyyy-MM-dd') );
     }
    
     public String QCurrentYear(Integer thisMonth)
     {
         datetime ntd = datetime.Now();
         Integer month = thisMonth;
         Integer day = 1;
         Integer year = Integer.valueOf( ntd.year() ) ;
         
         datetime td = datetime.newInstance(year, month, day) ;
         return ( td.format('yyyy-MM-dd') );
     }
     public String QNextYear(Integer thisMonth)
     {
         datetime ntd = datetime.Now();
         Integer month = thisMonth;
         Integer day = 1;
         Integer tempyear = Integer.valueOf( ntd.year() ) ;
         Integer year = tempyear + 1;
         
         datetime td = datetime.newInstance(year, month, day) ;
         return ( td.format('yyyy-MM-dd') );
     }
     
    
   
    // fired when the save records button is clicked
     public PageReference save() 
    {
        try 
        {
            update searchResults;
        } 
        Catch (DMLException e) 
        {
            ApexPages.addMessages(e);
        }
        catch (Exception ex)
        {
        	ApexPages.addMessages(ex);
        }
 		return new PageReference('/apex/OpportunityGrid_cvf');
    }
 
    // discards changes made to grid
    public PageReference discard()
    {
        return new PageReference('/apex/OpportunityGrid_cvf' );
    }
  
    // takes user back to Home tab
    public PageReference cancel() 
    {
        return new PageReference('/home/home.jsp' );
    }
}