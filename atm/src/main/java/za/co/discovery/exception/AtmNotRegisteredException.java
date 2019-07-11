package za.co.discovery.exception;

public class AtmNotRegisteredException extends Exception{

	private static final long serialVersionUID = 1L;
	private static final String MESSAGE = "ATM not registered.";
	public AtmNotRegisteredException() {
		super(MESSAGE);
	}

	public AtmNotRegisteredException(String message) {
		super(message);
	}
	
}
