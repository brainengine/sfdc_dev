public with sharing class GxtContactGridController {

    //variable declaration
    private ApexPages.StandardController controller {get; set;}
    public List<Contact> searchResults {get;set;}
    public string searchText {get;set;}
    public String selectedUser {get;set;}
    public List<SelectOption> userList;
    
    // standard controller - could also just use custom controller
    public GxtContactGridController(ApexPages.StandardController controller) { }
    public GxtContactGridController() { }
 
 	private String sortDirection = 'ASC';
 	private String sortExp = 'Account.Name';
 	private String sortExp1 = 'Name';
 	private String sortExp2 = 'Email';
 	
 	public String sortExpression
 	{
 		get
 		{
 			return sortExp;
 		}
 		set
 		{
 			if (value == sortExp || value == sortExp1 || value == sortExp2)
 				sortDirection = (sortDirection == 'ASC')? 'DESC' : 'ASC';
 			else
 				sortDirection = 'ASC';
 			sortExp = value;
 		}
 	}
 	
 	public String getSortDirection()
 	{
    	//if not column is selected 
    	if (sortExpression == null || sortExpression == '')
    	  return 'ASC';
    	else
    	 return sortDirection;
 	}

 	public void setSortDirection(String value)
 	{  
  	 sortDirection = value;
 	}
 	
    //get Users method and returns List of Users 
    public List<SelectOption> getUsers() 
    {
    	List<User> usrs = new List<User>();
        try
        {
        	if (userList == null) 
        	{
            	usrs = [select id,firstname,lastname from user order by firstname, lastname ];

            	userList = new List<SelectOption>();
            	userList.add(new SelectOption('NoValue', '-Select One-'));
            
            	for (User u : usrs) 
            	{
            	    userList.add(new SelectOption(u.id, u.firstname + ' ' + u.lastname));
            	}
        	}
    	}
    	catch (Exception e)
    	{
   			ApexPages.addMessages(e);
    	}
    	return userList;
    }
    
    // fired when the search button is clicked
    public PageReference Find() 
    {
        try
        {
       		String qrySeed = 'select c.AccountId, c.Account.Name, c.Name, c.Email, c.ChristmasCards__c, c.GolfTournament__c, ' +
        	'c.ClientAppreciation__c, c.InfoNewsletter__c, OwnerId from Contact c where c.isdeleted = false ';
        	String qryEnd1 = 'order by '; 
       		String qryEnd2 = ' limit 1000';
       		String qryB = '';
       		string qrySearch = '';
        	String qry = '';
      	    string sortFullExp = sortExpression  + ' ' + sortDirection; 
      	       
        	if (selectedUser == 'NoValue')
        	{
        	    qryB = '';
        	}
        	else
        	{
        	    qryB = ' and c.Internal_PM_hidden__c LIKE \'%' + SelectedUser.substring(0,15) + '%\' ' ;
        	}
      
        	if (searchText == '')
        	{
        	    qrySearch = '';
        	}
        	else
        	{
         	   qrySearch = ' and c.Account.Name LIKE \'%'+ searchText + '%\' ';
       		}     
     
      		qry = qrySeed + qryB + qrySearch + qryEnd1 +sortFullExp + qryEnd2 ;
      		searchText = qry;
      		searchResults = Database.query(qry);
        }
        catch (DmlException e)
        {
        	ApexPages.addMessages(e);
        }
        return null;
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
 		return new PageReference('/apex/ContactsGrid_cvf');
    }
 
    // discards changes made to grid
    public PageReference discard()
    {
        return new PageReference('/apex/ContactsGrid_cvf' );
    }
  
    // takes user back to Home tab
    public PageReference cancel() 
    {
        return new PageReference('/home/home.jsp' );
    }
}