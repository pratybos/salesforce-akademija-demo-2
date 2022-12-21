/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class DAL_ContactByEmail
{
	public List<Contact> getContactsByEmail(Set<String> emails)
	{
		return [SELECT Id,Email FROM Contact WHERE Email IN :emails];
	}
}