/**
 * Created by JurgitaG on 12/22/2022.
 */

trigger TRG_Contact on Contact (after insert, after update)
{
	if (Trigger.isAfter && ( Trigger.isInsert || Trigger.isUpdate ))
	{
		TH_ContactSync syncronizeContact = new TH_ContactSync();
		syncronizeContact.syncContactWithUser(Trigger.new, Trigger.oldMap);
	}
}