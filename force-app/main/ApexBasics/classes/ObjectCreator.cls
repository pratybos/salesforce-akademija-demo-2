/**
 * Created by Armandas on 2022-12-15.
 */

public without sharing class ObjectCreator
{

	public static SObject createObject(SObjectType anSobjectType)
	{
		if (anSobjectType == Account.SObjectType)
		{
			AccountCreator creator = new AccountCreator();
			return creator.getNewSObject();
		}
		else if (anSobjectType == Contact.SObjectType)
		{
			ContactCreator creator = new ContactCreator();
			return creator.getNewSObject();
		}
		else
		{
			return null;
		}
	}
}