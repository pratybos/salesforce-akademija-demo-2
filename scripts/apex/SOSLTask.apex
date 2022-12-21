String searchString = 'Second OR 2';

List<List<SObject>> results = [FIND :searchString IN NAME FIELDS RETURNING Account(Id, Name, CreatedDate), Contact(Id, Name, CreatedDate)];

Integer accountsSize = results[0].size();
Integer contactsSize = results[1].size();

System.debug(accountsSize);
System.debug(contactsSize);