/**
 * Created by Armandas on 2022-12-15.
 */

public without sharing class ContactCreator implements INT_SObjectInterface
{

	public SObject getNewSObject()
	{
		return new Contact(LastName = 'test1');
	}
}