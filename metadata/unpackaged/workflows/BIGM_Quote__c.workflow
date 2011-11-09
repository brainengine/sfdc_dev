<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Opportunity Quote Update</fullName>
        <active>false</active>
        <formula>BIGM_Primary__c  = true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Quoted Opportunity</fullName>
        <active>true</active>
        <formula>Name &lt;&gt; &quot;&quot;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
