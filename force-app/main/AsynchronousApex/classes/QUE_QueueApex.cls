/**
 * Created by JurgitaG on 12/22/2022.
 */

public class QUE_QueueApex implements Queueable
{
	private List<User> userList;
	public QUE_QueueApex(List<User> users){
		this.userList = users;
	}

	public void execute(QueueableContext param1)
	{
		update this.userList;
		System.enqueueJob(new QUE_QueueApex(this.userList));

	}
}