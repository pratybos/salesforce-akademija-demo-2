/**
 * Created by Armandas on 2023-01-19.
 */

public with sharing class LwcController
{
	@AuraEnabled
	public static List<Contact> getContacts(String firstName)
	{
		return [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = :firstName LIMIT 10];
	}
}