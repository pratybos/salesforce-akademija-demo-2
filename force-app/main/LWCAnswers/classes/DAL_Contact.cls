/**
 * Created by Armandas on 2023-01-19.
 */

public with sharing class DAL_Contact
{
	@AuraEnabled
	public static Contact getContactById(String contactId)
	{
		List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :contactId LIMIT 1];
		if (contacts.size() > 0)
		{
			return contacts.get(0);
		}
		return null;
	}
}