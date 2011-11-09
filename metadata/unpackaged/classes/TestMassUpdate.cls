public class TestMassUpdate {

	public static  testmethod void testFields(){
 		PageReference pageRef = Page.MassUpdateAnything;
        Test.setCurrentPage(pageRef);
        Mass_Update__c massUpdate = new Mass_Update__c();
      	ApexPages.StandardController sc = new ApexPages.StandardController(massUpdate);
        MassUpdateAnyController controller = new MassUpdateAnyController(sc);
        controller.init();
        System.assert(controller.getObjectList().size() >0);
        controller.selObject = 'Mass_Update_Test__c';
        controller.selectFields();
        System.assert(controller.getFieldList().size() > 0);
        System.assert(controller.getCriteriaFieldList().size() > 0);
        System.assert(controller.currFieldList.size() == 1);
        System.assert(controller.currCritList.size() == 1);
        
        controller.addField();
        System.assert(controller.fldList == null || controller.fldList.size() == 0); 
        
        controller.fldToUpdate = 'Fld_Text__c';
        controller.selectField();
        Mass_Update_Field__c currFld =controller.currFieldList[0];

        System.assert(controller.textField);
        controller.addField();
        System.assert(controller.fldList == null || controller.fldList.size() == 0); 
        currFld.Field_Value__c = 'Test Value';
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();
        
        controller.fldToUpdate = 'Fld_TextArea__c';
        currFld =controller.currFieldList[0];
        controller.selectField();
        System.assert(controller.txtAreaField);
        currFld.Field_Value_Txt_Area__c = 'Test Value';
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();

        controller.fldToUpdate = 'Fld_TextArea_Long__c';
        controller.selectField();
        System.assert(controller.txtAreaField);
        
        controller.fldToUpdate = 'Fld_Checkbox__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.cboxField);
        currFld.Field_Value_CBox__c = true;
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();

        controller.fldToUpdate = 'OwnerId';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.userLookup);
        currFld.User__c = [select Id from User limit 1].Id;
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();		
        
        controller.fldToUpdate = 'Fld_Date__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.dateField);
        controller.addField();
        System.assert(controller.fldList.size() == 0); 
        currFld.Field_Value_Date__c = Date.Today();
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();

        controller.fldToUpdate = 'Fld_Datetime__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.dateTimeField);
        controller.addField();
        System.assert(controller.fldList.size() == 0); 
        currFld.Field_Value_Datetime__c = DateTime.Now();
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();

        controller.fldToUpdate = 'Fld_Currency__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.nbrField);
        controller.addField();
        System.assert(controller.fldList.size() == 0); 
        currFld.Field_Value_Nbr__c = 12.0;
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();  
        
        controller.fldToUpdate = 'Fld_Number__c';
        controller.selectField();
        System.assert(controller.nbrField);

        controller.fldToUpdate = 'Fld_Percent__c';
        controller.selectField();
        System.assert(controller.nbrField);

        controller.fldToUpdate = 'Account__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        System.assert(controller.textField);
        
        controller.fldToUpdate = 'Fld_Picklist_Single__c';
        controller.selectField();
        System.assert(controller.picklistField && !controller.multiSelect);
        controller.addField();
        System.assert(controller.fldList.size() == 0); 
        currFld =controller.currFieldList[0];
        controller.fieldValue = 'Value 1';
        controller.addField();
        System.assert(controller.fldList.size() == 1); 
        controller.fldList.clear();  

        controller.fldToUpdate = 'Fld_Picklist_Multi__c';
        controller.selectField();
        System.assert(controller.picklistField && controller.multiSelect);
        System.assert(controller.fldList == null || controller.fldList.size() == 0); 
        controller.addField();
        System.assert(controller.fldList.size() == 0); 
        
        controller.fieldValueList = new String[]{'MValue 1','MValue 2'};
        controller.addField();
        System.assert(controller.fldList.size() == 1); 

        controller.deleteSelected();
        System.assert(controller.fldList.size() == 1); 
        
       

				
	}

	public static  testmethod void testCriteria(){
 		PageReference pageRef = Page.MassUpdateAnything;
        Test.setCurrentPage(pageRef);
        Mass_Update__c massUpdate = new Mass_Update__c();
      	ApexPages.StandardController sc = new ApexPages.StandardController(massUpdate);
        MassUpdateAnyController controller = new MassUpdateAnyController(sc);
        controller.init();
        System.assert(controller.getObjectList().size() >0);
        controller.selObject = 'Mass_Update_Test__c';
        controller.selectFields();
        
        
        System.assert(controller.getFieldList().size() > 0);
        System.assert(controller.getCriteriaFieldList().size() > 0);
        System.assert(controller.currFieldList.size() == 1);
        System.assert(controller.currCritList.size() == 1);
        
        controller.selFldForCrit = 'Fld_Text__c';
        controller.selectCriteriaField();
        controller.addCriteria();
        System.assert(controller.filterCriteria == null || controller.filterCriteria.size() == 0); 
                
        ApexPages.getMessages().clear();
        controller.selFldForCrit = 'Fld_TextArea__c';
        controller.selectCriteriaField();
        System.assert(ApexPages.getMessages().size() >= 1);
		Mass_Update_Criteria__c currFld =controller.currCritList[0];
		controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0);
		
			        
        controller.selFldForCrit = 'Fld_Text__c';
        controller.selectCriteriaField();
        System.assert(controller.critTextField);
        currFld =controller.currCritList[0];
        currFld.Filter_Value__c = 'Test Value';
        controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0); 
        currFld =controller.currCritList[0];
		currFld.Operator__c = '=';
		currFld.Filter_Value__c = null;
        controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0); 
        currFld =controller.currCritList[0];
        currFld.Filter_Value__c = 'Test Value';
        controller.addCriteria();

        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();
		
        controller.selFldForCrit = 'OwnerId';
        controller.selectCriteriaField();
        System.assert(controller.critUsrLookup);
        currFld =controller.currCritList[0];
        currFld.User__c = [select Id from User limit 1].Id;
		currFld.Operator__c = '==';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();
        
        controller.selFldForCrit = 'Account__c';
        controller.selectCriteriaField();
        System.assert(controller.critTextField);
        
        controller.selFldForCrit = 'Fld_Date__c';
        controller.selectCriteriaField();
        System.assert(controller.critDateField);
        currFld =controller.currCritList[0];
		currFld.Operator__c = '==';
        controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0); 
        currFld =controller.currCritList[0];
        currFld.Filter_Value_Date__c = Date.Today();
        controller.addCriteria();
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();

        controller.selFldForCrit = 'Fld_Number__c';
        controller.selectCriteriaField();
        System.assert(controller.critNbrField);
        currFld =controller.currCritList[0];
		currFld.Operator__c = '==';
        controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0); 
        currFld =controller.currCritList[0];
        currFld.Filter_Value_Nbr__c = 12.0;
		currFld.Operator__c = '==';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();

        controller.selFldForCrit = 'Fld_Checkbox__c';
        controller.selectCriteriaField();
        System.assert(controller.critCBoxField);
        currFld =controller.currCritList[0];
        currFld.Filter_Value_CBox__c = false;
		currFld.Operator__c = '==';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();
        
        controller.selFldForCrit = 'Fld_DateTime__c';
        controller.selectCriteriaField();
        System.assert(controller.critDateTimeField);
        currFld =controller.currCritList[0];
		currFld.Operator__c = '==';
        controller.addCriteria();
        System.assert(controller.filterCriteria == null ||controller.filterCriteria.size() == 0); 
        currFld =controller.currCritList[0];
        
        currFld.Filter_Value_Date_Time__c = DateTime.Now();
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();

        controller.selFldForCrit = 'Fld_DateTime__c';
		controller.selectCriteriaField();
        currFld.Filter_Value_Date_Time__c = DateTime.Now();
		currFld.Operator__c = 'IN';
        currFld =controller.currCritList[0];
		controller.selectCriteriaField();
        System.assert(controller.filterCriteria.size() == 0);
        System.assert(ApexPages.getMessages().size() >= 1);
		controller.addCriteria();
        System.assert(ApexPages.getMessages().size() >= 1);
        controller.filterCriteria.clear();

        controller.selFldForCrit = 'Fld_Picklist_Single__c';
		currFld.Operator__c = '==';
		controller.selectCriteriaField();
        System.assert(controller.critPicklistField && !controller.critMultiSelect);
        currFld =controller.currCritList[0];
        currFld.Filter_Value__c = 'Value 1';
		currFld.Operator__c = '==';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();

		controller.selFldForCrit = 'Fld_Picklist_Single__c';
		controller.selectCriteriaField();
        currFld =controller.currCritList[0];
		currFld.Operator__c = 'IN';
		controller.selectCriteriaField();
		currFld.Filter_Value__c = 'Value 1';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();
        
        controller.selFldForCrit = 'Fld_Picklist_Multi__c';
        controller.selectCriteriaField();
        System.assert(controller.critPicklistField && controller.critMultiSelect);
        currFld =controller.currCritList[0];
        currFld.Filter_Value__c = 'Mvalue 1';
		currFld.Operator__c = '==';
        controller.addCriteria();
        currFld =controller.currCritList[0];
        System.assert(controller.filterCriteria.size() == 1); 
        controller.filterCriteria.clear();
		
        controller.deleteSelCriteria();		
	}


	public static  testmethod void testSave(){
 		PageReference pageRef = Page.MassUpdateAnything;
        Test.setCurrentPage(pageRef);
        Mass_Update__c massUpdate = new Mass_Update__c();
      	ApexPages.StandardController sc = new ApexPages.StandardController(massUpdate);
        MassUpdateAnyController controller = new MassUpdateAnyController(sc);
        
        System.assert(controller.getOperators().size() == 8);
        System.assert(controller.getFiltersSize()==0);
        System.assert(controller.getFldListSize()==0);
        DateTime currTime = DateTime.now();
        Mass_Update_Test__c testRec = new Mass_Update_Test__c(Fld_Checkbox__c=false,Fld_Text__c='Test Value',Fld_Date__c=Date.Today(),
        													  Fld_Number__c=1.0,Fld_DateTime__c=currTime,OwnerId=UserInfo.getUserId());
        insert testRec;
        
        controller.init();
        System.assert(controller.getObjectList().size() >0);
        controller.selObject = 'Mass_Update_Test__c';
        controller.selectFields();

		Mass_Update_Field__c currFld; 
        controller.fldToUpdate = 'Fld_Text__c';
        controller.selectField();
        currFld=controller.currFieldList[0];
        currFld.Field_Value__c = 'Test Value';        
        controller.addField();    

        controller.fldToUpdate = 'Fld_CheckBox__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.Field_Value_CBox__c = true;        
        controller.addField();    


        controller.fldToUpdate = 'Fld_Number__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.Empty__c =true;        
        controller.addField();    

        controller.fldToUpdate = 'Fld_TextArea__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.Field_Value_Txt_Area__c = 'Test Value';        
        controller.addField();    

        controller.fldToUpdate = 'Fld_Date__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.Field_Value_Date__c = Date.today();        
        controller.addField();    

        controller.fldToUpdate = 'Fld_DateTime__c';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.Field_Value_DateTime__c = DateTime.now();        
        controller.addField();    

        controller.fldToUpdate = 'OwnerId';
        controller.selectField();
        currFld =controller.currFieldList[0];
        currFld.User__c = UserInfo.getUserId();        
        controller.addField();    

        controller.selFldForCrit = 'Fld_Text__c';
        controller.selectCriteriaField();

        Mass_Update_Criteria__c currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Filter_Value__c = 'Test Value';
        controller.addCriteria();
                
        controller.selFldForCrit = 'Fld_Email__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Empty__c = true;
        controller.addCriteria();
                
        System.debug('>>>>>>>>>>>>>>>>>>>>controller.filterCriteria='+controller.filterCriteria);
              
        System.assert(controller.getFiltersSize() == 2);
		controller.getRecordCount();
        System.assert( controller.recCount == 1);
        controller.showSoql();
        System.debug('****************** controller.soql='+controller.soql);
        System.debug('****************** expected  .soql=select  Id,Fld_Text__c from Mass_Update_Test__c where Fld_Text__c =\'Test Value\' LIMIT 9000');
        System.assert('select  Id,Fld_Text__c,Fld_CheckBox__c,Fld_Number__c,Fld_TextArea__c,Fld_Date__c,Fld_DateTime__c,OwnerId from Mass_Update_Test__c where Fld_Text__c =\'Test Value\' and Fld_Email__c=null LIMIT 9000' == controller.soql);

        controller.showSampleRecords();

        controller.testUpdate();

        controller.selFldForCrit = 'Fld_Checkbox__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Filter_Value_CBox__c = false;
        controller.addCriteria();
        

        controller.selFldForCrit = 'Fld_Date__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Filter_Value_Date__c = Date.Today();
        controller.addCriteria();
        
        controller.selFldForCrit = 'Fld_DateTime__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Filter_Value_Date_Time__c = currTime;
        controller.addCriteria();     
        
           
        controller.testUpdate();

        controller.selFldForCrit = 'Fld_Number__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.Filter_Value_Nbr__c = 1.0;
        controller.addCriteria();      

        controller.selFldForCrit = 'OwnerId';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = '=';
        currCrit.User__c = UserInfo.getUserId();
        controller.addCriteria();      
          
        controller.selFldForCrit = 'Fld_Text__c';
        controller.selectCriteriaField();
        currCrit =controller.currCritList[0];
		currCrit.Operator__c = 'IN';
        currCrit.Filter_Value__c = 'Value 1';
        controller.addCriteria();        
        
        controller.showSoql();
        controller.save();
        
        pageRef = Page.MassUpdateAnything;
        pageRef.getParameters().put('id',controller.massUpdate.Id);
        Test.setCurrentPage(pageRef);
        massUpdate = controller.massUpdate;
      	sc = new ApexPages.StandardController(massUpdate);
        controller = new MassUpdateAnyController(sc);
        controller.init();
        
	}
}