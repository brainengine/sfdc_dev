public with sharing class IonOpportunityRiskGridController {

    //variable declaration
    private ApexPages.StandardController controller {get; set;}
    public List<Opportunity> searchResults {get;set;}
    public String selectedUser {get;set;}
    public String selectedContractDate {get;set;}
    public String selectedBusinessUnit {get;set;}
    public String selectedProductGroup {get;set;}
    public String selectedUncertaintyRisk {get;set;}
    public String selectedCompetitionRisk {get;set;}
    public String selectedTimingRisk {get;set;}
    public String selectedSalesRegion {get;set;}
    public String stringquery;
    
    public List<SelectOption> userList; 
    public List<SelectOption> contractdateList;
    public List<SelectOption> businessunitList;
    public List<SelectOption> forecastgroupList;
    public List<SelectOption> salesregionList;
    public List<SelectOption> uncertaintyriskList;
    public List<SelectOption> competitionriskList;
    public List<SelectOption> timingriskList;
    
    // standard controller - could also just use custom controller
    public IonOpportunityRiskGridController(ApexPages.StandardController controller) { }
    public IonOpportunityRiskGridController() { }
    
    public String getStringQuery ()
    {
        return stringquery;
    }
    
    public void setStringQuery(String val)
    {
        stringquery = val;
    }
 
 	public static List<SelectOption> getForecastGroup() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Forecast_Group__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
	}
	
	public static List<SelectOption> getUncertaintyRisk() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Uncertainty_Risk__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
	}
	
	public static List<SelectOption> getCompetitionRisk() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Competition_Risk__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
	}
	
	public static List<SelectOption> getTimingRisk() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Timing_Risk__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
	}
	
	public static List<SelectOption> getSalesRegion() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	items.add(new SelectOption('NoValue', '-Select One-'));
    	items.add(new SelectOption('EAME+ISC', 'EAME+ISC'));
    	items.add(new SelectOption('NSA', 'NSA'));
    	items.add(new SelectOption('China/APAC', 'China/APAC'));
    	items.add(new SelectOption('Russia/CIS', 'Russia/CIS'));
    	items.add(new SelectOption('World Wide', 'World Wide'));    	
    	return items;
	}
	
    //get Users method and returns List of Users 
    public List<SelectOption> getUsers() 
    {
        if (userList == null) 
        {
            List<User> usrs = [select id,firstname,lastname from user where Opportunity_owner__c = true order by firstname, lastname ];

            userList = new List<SelectOption>();
            userList.add(new SelectOption('NoValue', '-Select One-'));
            
            for (User u : usrs) 
            {
                userList.add(new SelectOption(u.id, u.firstname + ' ' + u.lastname));
            }
        }
        return userList;
    }
    
    public List<SelectOption> getContractDate()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('AllCurrentYear', 'All Current Year'));
        items.add(new SelectOption('Q4PreviousYear', 'Q4 Previous Year'));
        items.add(new SelectOption('Q1CurrentYear', 'Q1 Current Year'));
        items.add(new SelectOption('Q2CurrentYear', 'Q2 Current Year'));
        items.add(new SelectOption('Q3CurrentYear', 'Q3 Current Year'));
        items.add(new SelectOption('Q4CurrentYear', 'Q4 Current Year'));
        items.add(new SelectOption('AllNextYear', 'All Next Year'));
        items.add(new SelectOption('Q1NextYear', 'Q1 Next Year'));
        items.add(new SelectOption('Q2NextYear', 'Q2 Next Year'));
        items.add(new SelectOption('Q3NextYear', 'Q3 Next Year'));
        items.add(new SelectOption('Q4NextYear', 'Q4 Next Year'));
        return items ;
    }
    
    public List<SelectOption> getProductGroup()
    {
        List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Product_Group__c.getDescribe();
    	items.add(new SelectOption('NoValue', '-Select One-'));
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
    }
    
    public List<SelectOption> getBusinessUnit()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('CSL','CSL'));
        items.add(new SelectOption('LSBU', 'LSBU'));
        items.add(new SelectOption('MISD', 'MISD'));
        return items;
    }
    
    // fired when the search button is clicked
    public PageReference Find() 
    {
        Transient String qrySeed = 'select AccountId, Name, Forecast_Group__c, CloseDate, Revenue__c, Sales_Margin__c, Probability,' + 
                          'Uncertainty_Risk__c, Competition_Risk__c, Timing_Risk__c, Opportunity_Issues__c, Id from Opportunity o  ';
        String qryEnd = ' order by name limit 1000'; 
        String qryB = '';
        string qryBody = '';
        String qry;
        String qryA = '';
        String qryC = '';
        String qryD = '';
        String qryE = '';
     
        if (selectedContractDate  == 'Q4PreviousYear')
        {
            qryA = ' and (closedate >= ' + QYear(10,-1) + ' and closedate < ' +  QYear(1,0) + ') ' ;
        }
        else if (selectedContractDate == 'AllCurrentYear')
        {
        	qryA = ' and (closedate >= ' + QYear(1,0) + ' and closedate < ' +  QYear(1,1) + ') ' ;
        }
        else if (selectedContractDate  == 'Q1CurrentYear')
        {
            qryA = ' and (closedate >= ' + QYear(1,0) + ' and closedate < ' +  QYear(4,0) + ') ' ;
        }
        else if (selectedContractDate  == 'Q2CurrentYear')
        {
            qryA = ' and (closedate >= ' + QYear(4,0) + ' and closedate < ' +  QYear(7,0) + ') ' ;
        }
        else if (selectedContractDate  == 'Q3CurrentYear')
        {
            qryA = ' and (closedate >= ' + QYear(7,0) + ' and closedate < ' +  QYear(10,0) + ') ' ;
        }
        else if (selectedContractDate  == 'Q4CurrentYear')
        {
            qryA = ' and (closedate >= ' + QYear(10,0) + ' and closedate < ' +  QYear(1,1) + ') ' ;
        }
        else if (selectedContractDate == 'AllNextYear')
        {
        	qryA = ' and (closedate >= ' + QYear(1,1) + ' and closedate < ' +  QYear(1,2) + ') ' ;
        }
        else if (selectedContractDate  == 'Q1NextYear')
        {
            qryA = ' and (closedate >= ' + QYear(1,1) + ' and closedate < ' +  QYear(4,1) + ') ' ;
        }
        else if (selectedContractDate  == 'Q2NextYear')
        {
            qryA = ' and (closedate >= ' + QYear(4,1) + ' and closedate < ' +  QYear(7,1) + ') ' ;
        }
        else if (selectedContractDate  == 'Q3NextYear')
        {
            qryA = ' and (closedate >= ' + QYear(7,1) + ' and closedate < ' +  QYear(10,1) + ') ' ;
        }
        else if (selectedContractDate  == 'Q4NextYear')
        {
            qryA = ' and (closedate >= ' + QYear(10,1) + ' and closedate < ' +  QYear(1,2) + ') ' ;
        }
        else
        {
            qry = '';
        }
        
        if (selectedBusinessUnit == 'NoValue')
        {
            qryB = '';
        }
        else
        {
            qryB = ' and Division__c = \'' + selectedBusinessUnit + '\' ' ;
        }
        
        if (selectedSalesRegion == 'NoValue')
        {
            qryC = '';
        }
        else
        {
            qryC = ' and Sales_Region__c = \'' + selectedSalesRegion + '\' ' ;
        }
      
        if (selectedProductGroup == 'NoValue')
        {
            qryD = '';
        }
        else
        {
            qryD = ' and Product_Group__c = \'' + selectedProductGroup + '\' ';
        }
       
        if (selectedUser == 'NoValue')
        {
            qryE = '';
        }
        else
        {
            qryE = ' and OwnerId = \'' + selectedUser + '\' ';
        }
        
        if (qryA == '' && qryB == '' && qryC == '' && qryD == ''&& qryE == '')
        {
              //qryBody = '';
              qryBody = ' where  RecordTypeId=\'01250000000DKYNAA4\' '; 
        }
        else
        {
            //qryBody = ' where Id != null ' + qryA + qryB + qryC + qryD;
            qryBody = ' where  RecordTypeId=\'01250000000DKYNAA4\' ' + qryA + qryB + qryC + qryD + qryE;
        }
        
        system.debug (qrySeed + qryBody + qryEnd) ;
        qry = qrySeed + qryBody + qryEnd;
        stringquery = qry;
        System.debug('Query: ' + qry);
        searchResults = Database.query(qry);
    
        return null;
    }
 
     private String QYear(Integer currentMonth, Integer tYear)
     {
         datetime ntd = datetime.Now();
         Integer month = currentMonth;
         Integer day = 1;
         Integer tempyear;
         Integer year;
         
         if(tYear == -1) //last year
         {
         	tempyear = Integer.valueOf( ntd.year() ) ;
         	year = tempyear - 1;
         }
         else if (tYear == 0) //current year
         {
         	year = Integer.valueOf( ntd.year() ) ;
         }
         else if (tYear == 1)
         {
         	tempyear = Integer.valueOf( ntd.year() ) ;
            year = tempyear + 1;
         }
         else if (tYear == 2)
         {
         	tempyear = Integer.valueOf( ntd.year() ) ;
            year = tempyear + 2;
         }
   
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
            System.Debug( e.getMessage() );
            return null;
        }
        catch (Exception ex)
        {
        }
 
        return new PageReference('/apex/IonPlanOppGrid_cvf');
    }
 
    // discards changes made to grid
    public PageReference discard()
    {
        return new PageReference('/apex/IonPlanOppGrid_cvf');
    }
  
    // takes user back to Home tab
    public PageReference cancel() 
    {
        return new PageReference('/home/home.jsp');
    }
}