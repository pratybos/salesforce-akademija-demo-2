/**
 * Created by JurgitaG on 12/22/2022.
 */

public class SCHED_AccountDeactivation implements Schedulable
{

	public void execute(SchedulableContext param1)
	{
		Database.executeBatch(new BATCH_AccountDeactivation(), 3);
	}
}