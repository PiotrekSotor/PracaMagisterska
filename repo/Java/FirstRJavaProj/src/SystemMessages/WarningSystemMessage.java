package SystemMessages;

public class WarningSystemMessage extends SystemMessageException{
	
	public WarningSystemMessage(String message){
		super(message);
		messageLevel = SystemMessageExceptionLevel.WARNING;
	}
}
