<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ProposedAccount</fullName>
        <description>Proposed Account</description>
        <protected>false</protected>
        <recipients>
            <recipient>greg.felton@i-o.com.test</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kim.phelps@iongeo.com.test</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ISGEmailTemplates/ProposedAccount</template>
    </alerts>
    <rules>
        <fullName>Proposed Account Creation</fullName>
        <actions>
            <name>ProposedAccount</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Proposed Account</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
