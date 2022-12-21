private static void generateData(Integer accountCount)
{
	if (accountCount > 4000)
	{
		accountCount = 4000;
	}

	List<Account> accountsToInsert = new List<Account>();
	for (Integer i = 0; i < accountCount; i++)
	{
		String accName = 'Test Account ' + i;
		Account acc = new Account(Name = accName);
		accountsToInsert.add(acc);
	}

	insert accountsToInsert;

	List<Contact> contactsToInsert = new List<Contact>();
	for (Account acc : accountsToInsert)
	{
		Contact contact1 = new Contact(LastName = acc.Name + ' First Contact', AccountId = acc.Id);
		contactsToInsert.add(contact1);
		Contact contact2 = new Contact(LastName = acc.Name + ' Second Contact', AccountId = acc.Id);
		contactsToInsert.add(contact2);
	}

	insert contactsToInsert;
}

generateData(200);