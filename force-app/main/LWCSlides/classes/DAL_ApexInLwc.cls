/**
 * Created by Armandas on 2023-01-19.
 */

public with sharing class DAL_ApexInLwc
{
	@AuraEnabled
	public static List<Contact> getContacts()
	{
		return [SELECT Id FROM Contact LIMIT 10];
	}

}