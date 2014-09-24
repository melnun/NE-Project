package com.ntt.ne.gestionefile;

public class NeCell {
	
	String posizione;
	String value;

	public NeCell() {

		
	}

	public String getPosizione()
	{
		return posizione;
	}
	
	public String getValue()
	{
		return value;
	}
	
	public void setPosizione(String posizione)
	{
		this.posizione=posizione;
	}
	
	public void setValue(String value)
	{
		this.value=value;
	}

	public String toJSON(){
		return "{DA IMPLEMENTARE}";
	}
	
	@Override
	public String toString() {
		return "NeCell [posizione=" + posizione + ", value=" + value + "]";
	}
	
}
