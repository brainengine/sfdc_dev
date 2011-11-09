trigger ChangeoutOwner_Status on User bulk (before insert,before update) {
 
 
 
   try{
        Set<ID> Ids = new Set<ID>();
       
        for (User us : Trigger.new){
 
   
                Ids.Add(us.Id);
      
        }
           
        if (Ids.size() >0){
            Opportunity[] Opptys = [ Select O.OwnerId, id, Active__c from Opportunity O where O.OwnerId in :Ids];
       
            if(Opptys.size() > 0){
                User[] users= Trigger.new;
                Map<Id, User> m4 = new Map<Id, User>(users);
               
                for (Opportunity Oppty : Opptys){
                    Oppty.Active__c = m4.get(Oppty.OwnerID).isActive;
                  
                }
               
                update(Opptys);
            } 
        }
                
    } catch (Exception x) {
        System.debug('Owner avtice statusTo ERROR: '+ x);
    }
               
 
}