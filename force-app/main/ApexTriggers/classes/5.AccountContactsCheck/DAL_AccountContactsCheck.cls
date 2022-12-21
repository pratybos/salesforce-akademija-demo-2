/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class DAL_AccountContactsCheck
{
	public List<Contact> getContactsByAccountIds(Set<Id> accoundIds)
	{
		return [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accoundIds];
	}
}