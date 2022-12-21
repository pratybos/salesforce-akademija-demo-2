/**
 * Created by Armandas on 2022-12-20.
 */

public with sharing class TH_ContactByEmail
{
	List<Contact> contacts = new List<Contact>();
	Set<String> contactEmails = new Set<String>();
	DAL_ContactByEmail repository = new DAL_ContactByEmail();

	public void addContacts(List<Contact> contactsToAdd)
	{
		for (Contact aContact : contactsToAdd)
		{
			if (aContact.Email != null)
			{
				contactEmails.add(aContact.Email);
			}
			contacts.add(aContact);
		}
	}

	public void checkIfAnotherContactExists()
	{
		List<Contact> existingContacts = repository.getContactsByEmail(contactEmails);
		Set<String> existingEmails = getExistingContactEmails(existingContacts);

		for (Contact aContact : contacts)
		{
			if (existingEmails.contains(aContact.Email))
			{
				String errorMsg = String.format(
						'Contact with Email {0} already exists',
						new List<String> {aContact.Email}
				);
				aContact.addError(errorMsg);
			}
		}
	}

	private static Set<String> getExistingContactEmails(List<Contact> contacts)
	{
		Set<String> existingContactEmails = new Set<String>();

		for (Contact aContact : contacts)
		{
			existingContactEmails.add(aContact.Email);
		}

		return existingContactEmails;
	}
}