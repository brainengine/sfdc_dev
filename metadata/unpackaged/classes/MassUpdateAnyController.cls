public without sharing class MassUpdateAnyController {


	String[] selObjList = new String[]{};
	List<String> availObjList = new List<String>();
	boolean testMode = false;
	public Integer currentStep {get; set;}
	public String selObject {get; set;}
	Map<String,String> availFields = new Map<String,String>();
	Map<String,String> availCritFields = new Map<String,String>();
	public String fldToUpdate {get; set;}
	public String sampleData {get; set;}
	
	public Mass_Update__c massUpdate {get; set;}
	public List<Mass_Update_Field__c> fldList {get; set;}
	public List<Mass_Update_Field__c>  currFieldList {get; set;}
	public List<Mass_Update_Criteria__c> filterCriteria {get; set;}
	public List<Mass_Update_Criteria__c>  currCritList {get; set;}
	public Boolean textField {get; set;}
	public Boolean dateField {get; set;}
	public Boolean dateTimeField {get; set;}
	public Boolean nbrField {get; set;}
	public Boolean txtAreaField {get; set;}
	public Boolean cboxField {get; set;}
	public Boolean picklistField {get; set;}
	public Boolean multiSelect {get; set;}
	public Boolean userLookup {get; set;}
	public String  fieldValue{get; set;}
	public String[]  fieldValueList = new String[]{};

	public Boolean critTextField {get; set;}
	public Boolean critDateField {get; set;}
	public Boolean critDateTimeField {get; set;}
	public Boolean critNbrField {get; set;}
	public Boolean critPicklistField {get; set;}
	public Boolean critMultiSelect {get; set;}
	public Boolean critTxtAreaField {get; set;}
	public Boolean critCboxField {get; set;}
	public Boolean critUsrLookup {get; set;}
	public String  critValue{get; set;}
	public String[]  critValueList = new String[]{};

	public List<SelectOption> fieldValues {get; set;}
	public String selFldForCrit {get; set;}
	public String soql {get; set;}
	public String testMsg {get; set;}
	public Integer recCount {get; set;}
	Map<String, Schema.SObjectField> fieldMap;
	public static List<SelectOption> OPERATORS = new List<SelectOption>{
		new SelectOption('=','='),
		new SelectOption('!=','!='),
		new SelectOption('<' ,'<' ),
		new SelectOption('<=','<='),
		new SelectOption('>' ,'>' ),
		new SelectOption('>=','>='),
		new SelectOption('IN','IN'),
		new SelectOption('NOT IN','NOT IN')
	};
	private static final Map<String,String> EXCLD_OBJECTS = new Map<String,String>{
		'attachment'=>'attachment',
		'mailmergetemplate'=>'mailmergetemplate',
		'categorynode'=>'categorynode',
		'staticresource'=>'staticresource',
		'organization'=>'organization',
		'emailservicesaddress'=>'emailservicesaddress',
		'mass_update_criteria__c'=>'mass_update_criteria__c',
		'apexcomponent'=>'apexcomponent',
		'processinstanceworkitem'=>'processinstanceworkitem',
		'businessprocess'=>'businessprocess',
		'weblink'=>'weblink',
		'additionalnumber'=>'additionalnumber',
		'apexpage'=>'apexpage',
		'emailtemplate'=>'emailtemplate',
		'scontrol'=>'scontrol',
		'businesshours'=>'businesshours',
		'processinstance'=>'processinstance',
		'apexclass'=>'apexclass',
		'emailservicesfunction'=>'emailservicesfunction',
		'mass_update__c'=>'mass_update__c',
		'folder'=>'folder',
		'approval'=>'approval',
		'categorydata'=>'categorydata',
		'document'=>'document',
		'brandtemplate'=>'brandtemplate',
		'apextrigger'=>'apextrigger',
		'mass_update_field__c'=>'mass_update_field__c',
		'recordtype'=>'recordtype',
		'documentattachmentmap'=>'documentattachmentmap'
	};
	
	private static Integer REC_LIMIT = 9000;
	private static String MULTI_SEPARATOR=';';
	public MassUpdateAnyController(ApexPages.StandardController stdCtlr){

	}
	public PageReference init(){
		try{
			if(ApexPages.currentPage().getParameters().get('id') != null){
				getMassUpdateForId(	ApexPages.currentPage().getParameters().get('id'));
				System.debug('>>>>>>>>>>>>>>> this.MassUpdate='+this.massUpdate);
			}else{
				this.massUpdate= new Mass_Update__c();	
			}
	        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
			for(String name:schemaMap.keySet()){
				System.debug('>>>>>>>>>>>>>>>>>>> Object Name='+name);
				if(schemaMap.get(name).getDescribe().isUpdateable() && !EXCLD_OBJECTS.containsKey(name)){
					availObjList.add(name);
				}	
			}
			currentStep = 1;
			if(this.massUpdate!=null && this.massUpdate.Id != null){
				return selectFields();
			}
		}catch(Exception ex){
			return new PageReference('/apex/MassUpdateError?errMsg='+ex.getMessage());
		}
		return null; 
	}
 	public List<SelectOption> getObjectList() {
 	 	List<SelectOption> options = new List<SelectOption>();
 	 	for(String name:availObjList){
 	 		options.add(new SelectOption(name,name));
 	 	}
 	 	return options;
 	}

 	public PageReference deleteSelected(){
 		currentStep = 2;
 		Integer currIndex=0;
 		List<Mass_Update_Field__c> fldsToDelete = new List<Mass_Update_Field__c>();
 		List<Mass_Update_Field__c> newList = new List<Mass_Update_Field__c>();
 		
 		for(Mass_Update_Field__c fld :this.fldList){
 			if(fld.IsDeleted){
 				if(fld.Id !=null){
 					fldsToDelete.add(fld);
 				}
 				if(this.availFields.get(fld.Field_API_Name__c) == null){
 					this.availFields.put(fld.Field_API_Name__c,fld.Field_API_Name__c);
 				}	
 			}else{
 				newList.add(fld);
 			}
 			currIndex++;
 		}
 		delete fldsToDelete;
 		this.fldList = newList;
 		return null;
 	}

 	public PageReference deleteSelCriteria(){
 		List<Mass_Update_Criteria__c> critToDelete = new List<Mass_Update_Criteria__c>();
 		List<Mass_Update_Criteria__c> newList = new List<Mass_Update_Criteria__c>();
 		
 		for(Mass_Update_Criteria__c crit :this.filterCriteria){
 			if(crit.IsDeleted){
 				if(crit.Id !=null){
 					critToDelete.add(crit);
 				}	
 			}else{
 				newList.add(crit);
 			}
 		}
 		delete critToDelete;
 		this.filterCriteria = newList;
 		return null;
 	}
 	
 	public PageReference addField(){
 		currentStep = 2;
		Mass_Update_Field__c currField= this.currFieldList[0];
		SObjectField fldDesc = fieldMap.get(fldToUpdate);
		if(validateFieldValue()){
			currField.Field_API_Name__c =  this.fldToUpdate;
			if(this.pickListField){
				if(!multiSelect){
					currField.Field_Value__c = fieldValue;
				}else{
					currField.Field_Value__c = getValueForMutiSelect(fieldValueList);
				}
			}
			if(this.fldList == null){
				this.fldList = new List<Mass_Update_Field__c>();
			}
			currField.Field_Value__c = currField.Field_Value__c;
			this.fldList.add(currField);	
	 		this.currFieldList.clear();
	 		this.currFieldList.add(new Mass_Update_Field__c());
			this.availFields.remove(fldToUpdate);
		}else{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
									'Both Field and Value are required !!! Select the Empty checkbox to blank out the field value'));
			this.fieldValue = null;
		}
 		return null;
	
 	}
 	public PageReference selectField(){
 		DescribeFieldResult fldDesc = fieldMap.get(this.fldToUpdate).getDescribe();
		this.nbrField = false;
		this.dateField = false;
		this.dateTimeField = false;
		this.picklistField = false; 	
		this.textField = false;
		this.userLookup=false;
		this.multiSelect=false;
		this.cboxField=false;
		this.txtAreaField=false;
		System.debug('>>>>>>>>>>>>>>>>>> fldDesc.getType()='+fldDesc.getType() ); 
 		if(fldDesc.getType() == Schema.DisplayType.Picklist || fldDesc.getType() == Schema.DisplayType.MultiPicklist){
			this.pickListField = true;
			List <Schema.PicklistEntry> pickVal = fldDesc.getPicklistValues();
			fieldValues = new List<SelectOption>();
			for(PicklistEntry entry: pickVal){
				fieldValues.add(new SelectOption(entry.getValue(),entry.getValue()));
			}
			if(fldDesc.getType() == Schema.DisplayType.MultiPicklist){
				multiSelect=true;	
			}
 		}
 		else if(fldDesc.getType() == Schema.DisplayType.Date){
 			this.dateField = true;
 		}
 		else if(fldDesc.getType() == Schema.DisplayType.DateTime){
 			this.dateTimeField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.Currency || 
 				 fldDesc.getType() == Schema.DisplayType.Percent || 
 				 fldDesc.getType() == Schema.DisplayType.Double){
 			this.nbrField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.Boolean){
 			this.cboxField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.TextArea){
 			this.txtAreaField = true;
 		}else if(fldDesc.getReferenceTo().size()>0){
			if(IsUserLookup(fldDesc.getReferenceTo())){
				this.userLookup = true;
			}else{
				this.textField = true;
			}
 		}
 		else{
 			this.textField = true;	
 		}
 		return null;	
 	}
 	
 	public PageReference selectFields(){
 		currentStep = 2;
 		this.nbrField = false;
		this.dateField = false;
		this.dateTimeField = false;
		this.picklistField = false;
		this.textField=false; 
		this.userLookup=false;
		this.critNbrField = false;
		this.critDateField = false;
		this.critDateTimeField = false;
		this.critPicklistField = false; 	
		this.critTextField = false;	
		this.critUsrLookup =false;
		try{
		    Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
		    availFields = new Map<String,String>();
		    availCritFields = new Map<String,String>();
		    if(this.massUpdate.Id == null){
		    	this.massUpdate.SFDC_Object__c = this.selObject;
		    }
		    Schema.SObjectType objType = schemaMap.get(this.massUpdate.SFDC_Object__c);
		    if(objType !=null){
			    this.fieldMap = schemaMap.get(this.massUpdate.SFDC_Object__c).getDescribe().fields.getMap();
			    for(String name:fieldMap.keySet()){
			    	if(fieldMap.get(name).getDescribe().isUpdateable()){
				    	availFields.put(name,name);
			    	}
			    	/*
			    		Cannot use Id field in the criteria as it will always
			    		return 1 record
			    	*/
			    	if(name != 'Id'){
			    		availCritFields.put(name,name);	    		
			    	}
			    }
			    if(this.massUpdate.Id != null){
			    	for(Mass_Update_Field__c fld:this.fldList){
			    		availFields.remove(fld.Field_API_Name__c);
			    	}	
			    }
		 		this.currFieldList = new List<Mass_Update_Field__c>();
		 		this.currFieldList.add(new Mass_Update_Field__c());
		 		this.currCritList = new List<Mass_Update_Criteria__c>();
		 		this.currCritList.add(new Mass_Update_Criteria__c());
		    }else{
		    	return new PageReference('/apex/MassUpdateError?errMsg=Cannot get Meta data for Object: '+this.massUpdate.SFDC_Object__c);	
		    } 		
	 		return null;
		}catch(Exception ex){
		    return new PageReference('/apex/MassUpdateError?errMsg=Cannot get Meta data for Object: '+this.massUpdate.SFDC_Object__c);	
		}	
 	}

 	public List<SelectOption> getFieldList() {
 	 	List<SelectOption> options = new List<SelectOption>();
	    for(String name:availFields.keySet()){
 	 		options.add(new SelectOption(name,name));
	    }
 	 	return options;
 	} 

 	public List<SelectOption> getCriteriaFieldList() {
 	 	List<SelectOption> options = new List<SelectOption>();
	    for(String name:availCritFields.keySet()){
 	 		options.add(new SelectOption(name,name));
	    }
 	 	return options;
 	} 
 	
 	public PageReference selectCriteriaField(){
 		if(this.selFldForCrit == null){
 			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
													   'Select a Field to add a Criteria !!!'));
			return null;
			
	
 		}
 		DescribeFieldResult fldDesc = fieldMap.get(this.selFldForCrit).getDescribe();
		this.critNbrField = false;
		this.critDateField = false;
		this.critDateTimeField = false;
		this.critPicklistField = false; 	
		this.critTextField = false;	
		this.critUsrLookup =false;
		this.critCboxField=false;
		this.critTxtAreaField=false;
		this.critMultiSelect=false;
		Mass_Update_Criteria__c currCrit = this.currCritList[0];

 		if((currCrit.Operator__c == 'IN' || currCrit.Operator__c == 'NOT IN') && IsTextField(fldDesc))
 		{
			this.critTextField = true;
			return null;	
		}
		if(fldDesc.getType() == Schema.DisplayType.Picklist || fldDesc.getType() == Schema.DisplayType.MultiPicklist){
			this.critPicklistField = true;
			List <Schema.PicklistEntry> pickVal = fldDesc.getPicklistValues();
			fieldValues = new List<SelectOption>();
			for(PicklistEntry entry: pickVal){
				fieldValues.add(new SelectOption(entry.getValue(),entry.getValue()));
			}
			if(fldDesc.getType() == Schema.DisplayType.MultiPicklist){
				critMultiSelect=true;	
			}
			
 		}else if(fldDesc.getType() == Schema.DisplayType.Date){
 			this.critDateField = true;
 		}
 		else if(fldDesc.getType() == Schema.DisplayType.DateTime){
 			this.critDateTimeField = true;
 		}
 		else if(fldDesc.getType() == Schema.DisplayType.Currency || 
 				 fldDesc.getType() == Schema.DisplayType.Percent || 
 				 fldDesc.getType() == Schema.DisplayType.Double){
 			this.critNbrField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.Boolean){
 			this.critCboxField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.TextArea){
 			this.critTxtAreaField = true;
 		}else if(fldDesc.getType() == Schema.DisplayType.Reference && fldDesc.getReferenceTo().size()>0){
			if(IsUserLookup(fldDesc.getReferenceTo())){
				this.critUsrLookup = true;
			}else{
				this.critTextField = true;
			}
 		}
 		else{
 			this.critTextField = true;	
 		}
 		
 		return null;	
 	}
 	
 	public PageReference addCriteria(){
 		this.currentStep=3;
		Mass_Update_Criteria__c currCrit = this.currCritList[0];
		DescribeFieldResult fldDesc = this.fieldMap.get(this.selFldForCrit).getDescribe();
		System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>>>> fldDesc='+(this.fieldMap.get(this.selFldForCrit)));
		if(this.critTxtAreaField){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
													   'Text Area field cannot be used in Filter Criteria !!!'));
			currCrit = new Mass_Update_Criteria__c();
			return null;	
		}else if(!IsTextField(fldDesc) && (currCrit.Operator__c =='IN' || currCrit.Operator__c=='NOT IN')){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
													   'IN / NOT can be used only with Text/Picklist field types !!!'));
			return null;	
		
		}else if(validateCiteriaFieldValue()){
			currCrit.Field_API_Name__c =  this.selFldForCrit;
			if(this.critPicklistField){
				currCrit.Filter_Value__c = critValue;
			}
			if(currCrit.Operator__c =='IN' || currCrit.Operator__c=='NOT IN')
			{
				currCrit.Filter_Value__c = getQuotedValue(currCrit.Filter_Value__c);
			}
			if(IsTextField(fldDesc)){
				currCrit.Filter_Value__c = getQuotedValue(currCrit.Filter_Value__c);
			}
			if(this.filterCriteria == null){
				this.filterCriteria = new List<Mass_Update_Criteria__c>();
			}
			this.filterCriteria.add(currCrit);	
	 		this.currCritList = new List<Mass_Update_Criteria__c>();
	 		this.currCritList.add(new Mass_Update_Criteria__c());
			this.availCritFields.remove(fldToUpdate);
		}else{
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
														'Field,Operator and Value are required. Select the Empty checkbox to check for no value.'));
			this.critValue = null;
			return null;	
		}
 		return null;
 	}
 	
 	public Integer getFiltersSize(){
 		if(this.filterCriteria != null)
 			return this.filterCriteria.size();
 		else
 			return 0;	
 	}
 	
 	public Integer getFldListSize(){
 		if(this.fldList != null)
 			return this.fldList.size();
 		else
 			return 0;	
 	}
 	public PageReference save(){
 		this.currentStep=4;
		if(this.fldList == null || this.fldList.size()==0){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
														'Need to include atleast 1 field to update !!!'));
			return null;
		}
		System.debug('>>>>>>>>>>>>>>>>>>>>BEFORE'+massUpdate);
		System.debug('>>>>>>>>>>>>>>>>>>>>BEFORE'+fldList);
		System.debug('>>>>>>>>>>>>>>>>>>>>BEFORE'+filterCriteria);
 		if(this.massUpdate.Id == null){
 			this.massUpdate = new Mass_Update__c(SFDC_Object__c =this.selObject);
	 		insert massUpdate;
 		}
 		for(Mass_Update_Field__c fld:this.fldList){
 			if(fld.Mass_Update__c == null){
 				fld.Mass_Update__c = this.massUpdate.Id;
 			}
 		}
 		
		upsert fldList;
		if(this.filterCriteria != null && this.filterCriteria.size()>0){
			
	 		for(Mass_Update_Criteria__c crit:this.filterCriteria){
	 			if(crit.Mass_Update__c == null){
		 			crit.Mass_Update__c = this.massUpdate.Id;
	 			}
	 		}
			System.debug('>>>>>>>>>>>>>>>>>>>>AFTER'+massUpdate);
			System.debug('>>>>>>>>>>>>>>>>>>>>AFTER'+fldList);
			System.debug('>>>>>>>>>>>>>>>>>>>>AFTER'+filterCriteria);
			
			upsert this.filterCriteria;
		}
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 
											'Mass Update configuration saved successfully !!!'));

 		return null;
 	}
	public List<SelectOption> getOperators(){
		return OPERATORS;	
	}

 	public PageReference showSoql(){
 		if(this.massUpdate.Id == null){
 			this.massUpdate = new Mass_Update__c(SFDC_Object__c =this.selObject);
 		}
 		
 		this.soql = MassUpdateUtils.createSoql('UPDATE',REC_LIMIT,this.massUpdate,this.fldList,this.filterCriteria);
 		return null;
 	}
 	
 	public PageReference getRecordCount(){
 		this.soql = MassUpdateUtils.createSoql('COUNT',null,this.massUpdate,this.fldList,this.filterCriteria);
 		try{
			this.recCount = Database.countQuery(this.soql);
 		}catch(Exception ex){
 			return new PageReference('/apex/MassUpdateError?errMsg='+ex.getMessage());	
 		}
 		return null;
 	}
 	
 	public PageReference testUpdate(){
 		try{
 			this.testMsg = MassUpdateUtils.updateRecords(this.massUpdate,this.fldList,this.filterCriteria,1,true);
 		}catch(Exception ex){
 			return new PageReference('/apex/MassUpdateError?errMsg='+ex.getMessage());	
 		}
 		return null;
 	}
 	
 	public PageReference runUpdate(){
 		try{
	 		this.testMsg = MassUpdateUtils.updateRecords(this.massUpdate,this.fldList,this.filterCriteria,REC_LIMIT,false);
 		}catch(Exception ex){
 			return new PageReference('/apex/MassUpdateError?errMsg='+ex.getMessage());	
 		}
 		return null;
 	} 	
 	private Boolean validateFieldValue(){
 		Mass_Update_Field__c currField = this.currFieldList[0];
 		if(this.fldToUpdate == null){
 			return false;	
 		}
 		System.debug('>>>>>>>>>>>>>>>>>>> validateFieldValue(): currField = '+currField);
 		if(!currField.Empty__c){
	 		if(this.textField && currField.Field_Value__c == null){
	 			return false;	
	 		}
	 		if(this.dateField){
	 			if(currField.Field_Value_Date__c == null){
	 				return false;
	 			}	
	 		}
	 		if(this.dateTimeField){
	 			if(currField.Field_Value_DateTime__c == null){
	 				return false;
	 			}	
	 		}
	 		if(this.nbrField){
	 			if(currField.Field_Value_Nbr__c == null){
	 				return false;
	 			}	
	 		}
	 		if(this.pickListField){
	 			if(!multiSelect){
	 				if(this.fieldValue == null){
	 					return false;	
	 				}	
	 			}else{
	 				if(this.fieldValueList.size() == 0){
	 					return false;	
	 				} 
	 			}	
	 		}
 		}
 		return true;
 	}

 	private Boolean validateCiteriaFieldValue(){
		Mass_Update_Criteria__c currCrit = this.currCritList[0];
 		if(this.selFldForCrit == null){
 			return false;	
 		}
		
		if(currCrit.Operator__c == null){
			return false;	
		}
		if(!currCrit.Empty__c){
	 		if(this.critTextField && currCrit.Filter_Value__c == null){
	 			return false;	
	 		}
	 		if(this.critDateField){
	 			if(currCrit.Filter_Value_Date__c == null){
	 				return false;
	 			}	
	 		}
	 		if(this.critDateTimeField){
	 			if(currCrit.Filter_Value_Date_Time__c == null){
	 				return false;
	 			}	
	 		}
	 		if(this.critNbrField){
	 			if(currCrit.Filter_Value_Nbr__c == null){
	 				return false;
	 			}	
	 		}
		}
 		return true;
 	}
	
	private void getMassUpdateForId(String massUpdtId){
		List<Mass_Update__c> results= [	select Id,SFDC_Object__c
										from	Mass_Update__c
									 	where 	Id = :massUpdtId];
									 	
		if(results.size()> 0){
			this.massUpdate = results[0];
			
			this.fldList = [	select 	Id,Mass_Update__c,Field_API_Name__c,Empty__c,
										Field_Value__c,Field_Value_Date__c,
										Field_Value_Datetime__c,Field_Value_Nbr__c,
										User__c,Field_Value_CBox__c,Field_Value_Txt_Area__c,
										IsDeleted
								from	Mass_Update_Field__c
								where	Mass_Update__c = :massUpdate.Id];

			this.filterCriteria = [	select 	Id,Mass_Update__c,Field_API_Name__c,Empty__c,Operator__c,
											Filter_Value__c,Filter_Value_Date__c,
											Filter_Value_Date_Time__c,Filter_Value_Nbr__c,
											User__c,Filter_Value_CBox__c,IsDeleted
									from	Mass_Update_Criteria__c
									where	Mass_Update__c = :massUpdate.Id];

			this.selObject = this.massUpdate.SFDC_Object__c; 											
		}
	}

	public PageReference showSampleRecords(){
		this.sampleData = MassUpdateUtils.getSampleData(this.massUpdate,this.fldList,this.filterCriteria,10);
		return null;
	}
	
	public String[] getFieldValueList(){
		return this.fieldValueList;
	}

	public void setFieldValueList(String[] fldValList){
		this.fieldValueList = fldValList;
	}


	public String[] getCritValueList(){
		return this.critValueList;
	}

	public void setCritValueList(String[] valList){
		this.critValueList = valList;
	}
	private String getQuotedValue(String orgValue){
		String finalString='';
		if(orgValue !=null){
			for(String token : orgValue.split(',')){
				finalString+='\''+token+'\',';
			}
			System.debug('getQuotedValue:finalString='+finalString);
			return finalString.substring(0,finalString.length()-1);
		}
		return null;
	}	
	private String getValueForMutiSelect(String[] valList){
		String finalString='';
    	for(String str: valList){
    		finalString +=str+MULTI_SEPARATOR;
    		
    	}
		return finalString.substring(0,finalString.length()-1);
	}	
	
	private Boolean IsUserLookup(List<SObjectType> parents){
		Boolean isParentUser = false;
		Boolean isParentNonUser = false;
		for(Schema.SObjectType objType:parents){
			if(objType.getDescribe().getName() == 'User'){
				return true;
			}
		}
		return false;	
	}
	private Boolean IsTextField(DescribeFieldResult fldDesc){
		return(	fldDesc.getType() == Schema.DisplayType.Picklist ||
				fldDesc.getType() == Schema.DisplayType.MultiPicklist || 
				fldDesc.getType() == Schema.DisplayType.String);
	}

}