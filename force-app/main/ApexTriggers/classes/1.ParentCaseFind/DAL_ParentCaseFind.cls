/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class DAL_ParentCaseFind
{
	public List<Case> getCasesByContactIds(Set<Id> contactIds)
	{
		return [SELECT Id, ParentId, ContactId FROM Case WHERE ContactId IN :contactIds ORDER BY CreatedDate DESC];
	}
}