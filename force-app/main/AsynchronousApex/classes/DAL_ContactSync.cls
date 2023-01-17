/**
 * Created by JurgitaG on 12/22/2022.
 */

public class DAL_ContactSync
{
	public List<User> getUsersByEmail(Set<String> emails)
	{
		return [SELECT Id, Email, Out_of_office__c FROM User WHERE Email IN :emails];
	}
	public static List<User> getUsersByEmailForFutureMethod(Set<String> emails)
	{
		return [SELECT Id, Email, Out_of_office__c FROM User WHERE Email IN :emails];
	}
}