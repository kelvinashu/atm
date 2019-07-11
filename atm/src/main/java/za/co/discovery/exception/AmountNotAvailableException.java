package za.co.discovery.exception;

public class AmountNotAvailableException extends Exception{

	private static final long serialVersionUID = 1L;
	private static final String MESSAGE = "Amount not available.";
	public AmountNotAvailableException() {
		super(MESSAGE);
	}

	public AmountNotAvailableException(String message) {
		super(message);
	}
	
	

}
