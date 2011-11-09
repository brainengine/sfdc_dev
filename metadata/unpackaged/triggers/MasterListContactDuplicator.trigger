trigger MasterListContactDuplicator on Contact (after insert, after update) {

	String useridno = UserInfo.GetUserId();
	User user = [Select u.Id, u.Name, u.ProfileId, u.Profile.Id, u.Profile.Name From User u Where Id=:useridno];
	
	//system.Debug(user.Id);
	//system.Debug(user[0].Name);
	//system.Debug(user[0].ProfileId);	
	//system.Debug(user.Name);
	string orgContactOwnerName = user.Name;
	string orgContactProfileName = user.Profile.Name;
	
	//Profile has right to enter contact  00eP0000000QJ5LIAW
	if (orgContactProfileName == 'ISS Marketing Standard User')
	{
		for (Contact c : Trigger.new)
		{
			//original contact query
			//system.Debug('c.Id =>' + c.Id);
			
			Contact orgContact = [Select AccountId, Id, Email, FirstName, LastName, Title, OwnerId, Owner.Name, Phone, RecordType.Name ,RecordTypeId 
								 	 From Contact Where /*RecordTypeId='012P0000000CoRhIAK' And*/ Id=:c.Id];
			//system.Debug(orgContact.Id);
			//system.Debug(orgContact[0].FirstName);
			//system.Debug(orgContact[0].LastName);
			//system.Debug(orgContact[0].RecordTypeId);
			
			String orgContactFirstName = orgContact.FirstName;
			String orgContactLastName = orgContact.LastName;
			String orgContactEmail = orgContact.Email;
			String orgContactId = orgContact.Id;
			String orgContactAccountId = orgContact.AccountId;
			String orgContactTitle = orgContact.Title;
			String orgContactRecordTypeId = orgContact.RecordTypeId;
			String orgContactPhone = orgContact.Phone;
			String ordContactRecordTypeName = orgContact.RecordType.Name;
			
			//professional record type 012P0000000CoRhIAK
			if (ordContactRecordTypeName == 'Professional')
			{
				//System.Debug('orgContactRecordTypeId = 012P0000000CoRhIAK => TRUE');
				
				//master list contact query
				Contact[] mlContact = [Select Email, FirstName, LastName, Originating_Contact__c, Related_Contact__c, Associated_Owners__c, 
									OwnerId, Owner.Name, Phone, RecordTypeId From Contact 
								     Where RecordTypeId='012P0000000CoRmIAK' And 
								     ( (FirstName=:orgContactFirstName And LastName=:orgContactLastName) Or Email=:orgContactEmail) ];
						
				if (mlContact.size() != 0)
				{
					//system.Debug('TRUE');
					//system.Debug(mlContact[0].Id);
					//system.Debug(mlContact[0].FirstName);
					//system.Debug(mlContact[0].LastName);
					//system.Debug(mlContact[0].RecordTypeId);
					
					mlContact[0].FirstName = orgContactFirstName;
					mlContact[0].LastName = orgContactLastName;
					mlContact[0].Email = orgContactEmail;
					mlContact[0].Title = orgContactTitle;
					mlContact[0].Phone = orgContactPhone;
					mlContact[0].AccountId = orgContactAccountId;
					
					if ( mlContact[0].Associated_Owners__c.contains(orgContactOwnerName) )					
					{
					}
					else
					{
						mlContact[0].Associated_Owners__c = mlContact[0].Associated_Owners__c + ';' + orgContactOwnerName;
						mlContact[0].Related_Contact__c = c.Id;
						
					}
					update mlContact;
				}
				else
				{
					//system.Debug('FALSE');
					insert new Contact (FirstName = orgContactFirstName, Phone = orgContactPhone, 
						LastName = orgContactLastName, RecordTypeId = '012P0000000CoRmIAK', Email = orgContactEmail, 
						Title = orgContactTitle, OwnerId = '005P0000000NftK', AccountId = orgContactAccountId, 
						Associated_Owners__c = orgContactOwnerName, Originating_Contact__c=c.Id );			
				}
			}
			else
			{
				//system.Debug('RecordTypeId = personal');
			} //end of else for recordtypeId check
		}
	}

}

//professional: 012P0000000CoRhIAK
//personal: 012P0000000CoRcIAK
//master list:012P0000000CoRmIAK
//master list owner id: 005P0000000NftKIAS