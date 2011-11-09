public with sharing class InovaPlanOppGridController {

    //variable declaration
    private ApexPages.StandardController controller {get; set;}
    public List<Opportunity> searchResults {get;set;}
   // public string searchText {get;set;}
    public String selectedUser {get;set;}
    public String selectedStage {get;set;}
    public String selectedContractDate {get;set;}
    public String selectedRegion {get;set;}
    public String selectedProductGroup1 {get;set;}
    
    public String stringquery;
    
    public List<SelectOption> userList;
   // public List<SelectOption> stageList;
    public List<SelectOption> servicecenterList;
    public List<SelectOption> contractdateList;
    public List<SelectOption> regionList;
    public List<SelectOption> forecastgroupList;
    public List<SelectOption> productgroup2List;
    public List<SelectOption> salesterritoryList;
    
    // standard controller - could also just use custom controller
    public InovaPlanOppGridController(ApexPages.StandardController controller) { }
    public InovaPlanOppGridController() { }
    
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
	
	public static List<SelectOption> getProductGroup2() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Product_Group__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
    	return items;
	}
	
	public static List<SelectOption> getSalesTerritory() 
    {
    	List<SelectOption> items = new List<SelectOption>();
    	Schema.DescribeFieldResult fieldResult = Opportunity.Sales_Territory__c.getDescribe();
    	List<Schema.PickListEntry> pickListValues = fieldResult.getPickListValues();
    	for (Schema.PickListEntry f: pickListValues)
    	{
    		items.add(new SelectOption(f.getLabel(), f.getValue() ));
    	}
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
    
    public List<SelectOption> getProductGroup1()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('Analog Aries', 'Analog Aries'));
        items.add(new SelectOption('Analog Scorpion', 'Analog Scorpion'));
        items.add(new SelectOption('Digital Scorpion', 'Digital Scorpion'));
        items.add(new SelectOption('Pelton', 'Pelton'));
        items.add(new SelectOption('Vibrators', 'Vibrators'));
        items.add(new SelectOption('Firefly', 'Firefly'));
        items.add(new SelectOption('eVib', 'eVib'));
        return items;
    }
    
    public List<SelectOption> getRegion()
    {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('NoValue', '-Select One-'));
        items.add(new SelectOption('NSA', 'NSA'));
        items.add(new SelectOption('EAME+ISC','EAME+ISC'));
        items.add(new SelectOption('ASIA PAC', 'ASIA PA'));
        items.add(new SelectOption('CIS', 'CIS'));
        return items;
    }
    
    // fired when the search button is clicked
    public PageReference Find() 
    {
        Transient String qrySeed = 'select AccountId, o.Name, Revenue__c, Sales_Margin__c, CloseDate, Opportunity_Issues__c,' + 
                          'Sales_Territory__c,Forecast_Group__c,Product_Group__c, Id from Opportunity o  ';
        String qryEnd = ' order by name limit 1000'; 
        String qryB = '';
        string qryBody = '';
        String qry;
        String qryA = '';
        String qryC = '';
        String qryD = '';
     
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
        
        if (selectedRegion == 'NoValue')
        {
            qryC = '';
        }
        else
        {
            qryC = ' and Sales_Region__c = \'' + selectedRegion + '\' ' ;
        }
      
        if (selectedProductGroup1 == 'NoValue')
        {
            qryD = '';
        }
        else
        {
            qryD = ' and Product_Group__c = \'' + selectedProductGroup1 + '\' ';
        }
       
        if (qryA == '' && qryB == '' && qryC == '' && qryD == '')
        {
              //qryBody = '';
              qryBody = ' where  RecordTypeId=\'01250000000PzG5AAK\' '; 
        }
        else
        {
            //qryBody = ' where Id != null ' + qryA + qryB + qryC + qryD;
            qryBody = ' where  RecordTypeId=\'01250000000PzG5AAK\' ' + qryA + qryB + qryC + qryD;
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
 
        return new PageReference('/apex/InovaRunRateGrid_cvf');
    }
 
    // discards changes made to grid
    public PageReference discard()
    {
        return new PageReference('/apex/InovaRunRateGrid_cvf' );
    }
  
    // takes user back to Home tab
    public PageReference cancel() 
    {
        return new PageReference('/home/home.jsp' );
    }
}