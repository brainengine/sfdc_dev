<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Exchange_Rate_Auto_Name</fullName>
        <field>Name</field>
        <formula>&quot;EXCH&quot;&amp; &quot;-&quot;&amp;TEXT( Domestic_Currency__c )&amp;&quot;-&quot;&amp; TEXT( Currency__c )  &amp; &quot;-&quot;&amp;left(Text(Effective_Date__c),7)</formula>
        <name>Exchange Rate Auto-Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Name Exchange Rate</fullName>
        <actions>
            <name>Exchange_Rate_Auto_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Id&lt;&gt;null</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
