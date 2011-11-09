public class MassUpdateUtils {
	public static String createSoql(String operation,Integer recLimit,
									Mass_Update__c massUpdate,
									List<Mass_Update_Field__c> fldsToUpdt,
									List<Mass_Update_Criteria__c> filterCriteria){
		
		String soql = 'select ';
		if(operation == 'UPDATE'){
			soql +=' Id,';	
			if(fldsToUpdt != null){
				for(Mass_Update_Field__c fld : fldsToUpdt){
					soql+= fld.Field_API_Name__c +',';
						
				}
			}
			soql = soql.substring(0,soql.length()-1);
		}	
		if(operation == 'COUNT'){
			soql += 'count()';
		}	
		soql += ' from '+massUpdate.SFDC_Object__c;

		if(filterCriteria != null && filterCriteria.size() > 0){
			soql += ' where ';
			Integer currIndex =0;
			for(Mass_Update_Criteria__c crit : filterCriteria){
				if(crit.Empty__c){
					soql+= crit.Field_API_Name__c+crit.Operator__c+'null';	
				}else{
					if(crit.Operator__c == 'NOT IN' || crit.Operator__c == 'IN'){
						soql+= crit.Field_API_Name__c +' '+crit.Operator__c+' (';
						soql+= crit.Filter_Value__c;
						soql+= ')';	
					}else{
						soql+= crit.Field_API_Name__c +' '+crit.Operator__c;
						if(crit.Filter_Value__c != null){
							soql+= crit.Filter_Value__c;
						}else if(crit.Filter_Value_Date__c !=null){
							soql+= getFormattedDate(crit.Filter_Value_Date__c);
						}else if(crit.Filter_Value_Date_Time__c !=null){
							soql+= getFormattedDate(crit.Filter_Value_Date_Time__c);
						}else if(crit.Filter_Value_Nbr__c !=null){
							soql+= crit.Filter_Value_Nbr__c;
						}else if(crit.User__c != null){
							soql+= '\''+crit.User__c+'\'';
						}else if(crit.Filter_Value_CBox__c !=null){
							soql+= crit.Filter_Value_CBox__c;
						}
					}
				}				
				currIndex++;
				if(currIndex !=filterCriteria.size()){
					soql +=' and ';	
				} 
			}	
		}	
		if(	operation != 'COUNT'){
			soql +=' LIMIT '+recLimit;
		}
		System.debug('>>>>>>>>>>>>>> SOQL ='+soql);
		return soql;
	}

	public static String updateRecords(	Mass_Update__c massUpdate,
										List<Mass_Update_Field__c> fldsToUpdt,
										List<Mass_Update_Criteria__c> filterCriteria,
										Integer recLimit,
										Boolean shouldRollBack){
		String soql = createSoql('UPDATE',1,massUpdate,fldsToUpdt,filterCriteria);
		List<SObject> objToUpdate = Database.query(soql);
		objToUpdate.clear();
		Savepoint svPoint;
		if(shouldRollBack){
			svPoint = Database.setSavePoint();
		}
		soql = createSoql('UPDATE',recLimit,massUpdate,fldsToUpdt,filterCriteria);
		try{
			Object fldValue;
			for(SObject obj : Database.query(soql)){
				for(Mass_Update_Field__c fld: fldsToUpdt){
					System.debug('>>>>>>>>> fld:'+fld);
					if(fld.Empty__c){
						obj.put(fld.Field_API_Name__c,null);
					}else{
						if (fld.Field_Value__c != null){
							fldValue = fld.Field_Value__c;
						}else if(fld.Field_Value_Date__c !=null){
							fldValue = fld.Field_Value_Date__c;
						}else if(fld.Field_Value_Datetime__c !=null){
							fldValue = fld.Field_Value_Datetime__c;
						}else if(fld.Field_Value_Nbr__c !=null){
							fldValue = fld.Field_Value_Nbr__c;
						}else if(fld.User__c != null){
							fldValue = fld.User__c;
						}else if(fld.Field_Value_Txt_Area__c != null){
							fldValue = fld.Field_Value_Txt_Area__c;
						}else if(fld.User__c != null){
							fldValue = fld.User__c;
						}else if(fld.Field_Value_CBox__c != null){
							fldValue = fld.Field_Value_CBox__c;
						}
						System.debug('Field:'+fld.Field_API_Name__c+',Value='+fldValue);
						obj.put(fld.Field_API_Name__c,fldValue);
					}
				}
				if(objToUpdate.size() == 1000){
					update objToUpdate;
					objToUpdate.clear();
					//objToUpdate = new List<SObject>();
				}else{
					objToUpdate.add(obj);
				}
			}
			update objToUpdate;
			if(shouldRollBack){
				Database.rollback(svPoint);
			}
			
			return 'Update successful!!!';
		}catch(Exception ex){
			return 'Update FAILED.Failure Reason:'+ex.getMessage();
		}									
	}
	
	private static String getFormattedDate(Date dtValue){
		Datetime dtTime = DateTime.newInstance(dtValue.year(),dtValue.month(),dtValue.day());
		return dtTime.format('yyyy-MM-dd');	
	}
	private static String getFormattedDate(DateTime dtValue){
		Datetime dtTime = DateTime.newInstance(dtValue.year(),dtValue.month(),dtValue.day());
		return dtTime.format('yyyy-MM-dd\'T\'hh:mm:ss\'Z\'');	
	}	
	
	public static String getSampleData(Mass_Update__c massUpdate,
										List<Mass_Update_Field__c> fldsToUpdt,
										List<Mass_Update_Criteria__c> filterCriteria,
										Integer recLimit){
		String soql = createSoql('UPDATE',recLimit,massUpdate,fldsToUpdt,filterCriteria);
		GoogleViz gv = new GoogleViz();
      	gv.cols = new List<GoogleViz.col>();
      	Integer colCount=1;
      	gv.cols.add(new GoogleViz.Col('col'+colCount,'Id','t'));
      	for(Mass_Update_Field__c fld: fldsToUpdt){
			
			gv.cols.add(new GoogleViz.Col('col'+colCount,fld.Field_API_Name__c,'t'));
			colCount++;
      	}
      	GoogleViz.row r; 
      	Object fldVal;
		for(SObject obj: Database.query(soql)){
			r = new GoogleViz.row();
			r.cells.add ( new GoogleViz.cell(''+obj.Id));
			for(Mass_Update_Field__c fld: fldsToUpdt){
				fldVal = obj.get(fld.Field_API_Name__c);
				if(fldVal != null){
					r.cells.add ( new GoogleViz.cell(''+fldVal));
				}else{
					r.cells.add ( new GoogleViz.cell('null'));
				}
			}
			gv.addRow( r );
		}
		
		return gv.toJsonString();
		
	}

}