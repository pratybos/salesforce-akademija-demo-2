/**
 * Created by JurgitaG on 1/17/2023.
 */

public class CTRL_AccountInformation
{
	@AuraEnabled
	public static Contact insertContact(Contact aContact){
		insert aContact;
		return aContact;
	}
}