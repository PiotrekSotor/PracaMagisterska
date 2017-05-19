package SystemMessages;

public class ErrorSystemMessage extends SystemMessageException{
	
	public ErrorSystemMessage(String message){
		super(message);
		messageLevel = SystemMessageExceptionLevel.ERROR;
	}
}
