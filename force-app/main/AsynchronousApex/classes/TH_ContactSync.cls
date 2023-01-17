/**
 * Created by JurgitaG on 12/22/2022.
 */

public class TH_ContactSync
{
	DAL_ContactSync repository = new DAL_ContactSync();
	public void syncContactWithUser(List<Contact> newContacts, Map<Id, Contact> oldMap)
	{
		Set<String> contactEmails = new Set<String>();
		Map<String, Boolean> outOfOfficeStatus = new Map<String, Boolean>();
		for (Contact aContact : newContacts)
		{
			if (String.isNotBlank(aContact.Email)
					&& (!oldMap.containsKey(aContact.Id)
					||(
					oldMap.containsKey(aContact.Id) &&
			 oldMap.get(aContact.Id).Out_of_office__c != aContact.Out_of_office__c)))
			{
				contactEmails.add(aContact.Email);
				outOfOfficeStatus.put(aContact.Email, aContact.Out_of_office__c);
			}
		}
		List<User> existingUsers = repository.getUsersByEmail(contactEmails);
		for (User anUser : existingUsers){
			anUser.Out_of_office__c = outOfOfficeStatus.get(anUser.Email);
		}
//		updateUser(contactEmails, outOfOfficeStatus);
		System.enqueueJob(new QUE_QueueApex(existingUsers));
	}

	@Future
	public static void updateUser(Set<String> userEmails, Map<String, Boolean> outOfficeStatus){

		List<User> existingUsers = DAL_ContactSync.getUsersByEmailForFutureMethod(userEmails);
		for (User anUser : existingUsers){
			anUser.Out_of_office__c = outOfficeStatus.get(anUser.Email);
		}
		update existingUsers;
	}

}