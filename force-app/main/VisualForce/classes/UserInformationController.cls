/**
 * Created by JurgitaG on 1/12/2023.
 */

public with sharing class UserInformationController
{
	private final Account account;

	public UserInformationController(ApexPages.StandardController stdController){
		this.account = (Account)stdController.getRecord();
	}

	public Account getAccount(){
		return account;
	}

	public String getGenericGreeting(){
		return 'Hello everybody!';
	}

}