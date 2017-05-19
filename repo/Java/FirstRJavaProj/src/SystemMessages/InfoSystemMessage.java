package SystemMessages;

public class InfoSystemMessage extends SystemMessageException{
	
	public InfoSystemMessage(String message){
		super(message);
		messageLevel = SystemMessageExceptionLevel.INFO;
	}
}
