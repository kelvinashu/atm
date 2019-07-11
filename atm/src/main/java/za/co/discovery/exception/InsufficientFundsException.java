package za.co.discovery.exception;

public class InsufficientFundsException extends Exception{

	private static final long serialVersionUID = 1L;
	private static final String MESSAGE = "Insufficient funds.";

	public InsufficientFundsException() {
		super(MESSAGE);
	}

	public InsufficientFundsException(String message) {
		super(message);
	}
	
	

}