/**
 * Created by Armandas on 2022-12-19.
 */

trigger TRG_Contact on Contact (before insert)
{
	if (Trigger.isBefore)
	{
		if (Trigger.isInsert)
		{
			TH_ContactByEmail findContactByEmail = new TH_ContactByEmail();
			findContactByEmail.addContacts(Trigger.new);
			findContactByEmail.checkIfAnotherContactExists();
		}
	}


}