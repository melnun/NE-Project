/**
 * 
 */
package com.ntt.ne;

/**
 * @author MeleNu
 *
 */
public final class BackendError extends RuntimeException {

	/**
	 * @param message
	 */
	public BackendError(String message) {
		super(message);
	}

	/**
	 * @param cause
	 */
	public BackendError(Throwable cause) {
		super(cause);		
	}

	/**
	 * @param message
	 * @param cause
	 */
	public BackendError(String message, Throwable cause) {
		super(message, cause);		
	}
}
