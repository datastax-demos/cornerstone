
public class QVal {
	private double value;
	private boolean isnull=false;
	
	public QVal(String strval){
		try {
			this.value = Double.parseDouble(strval);
		}
		catch (Exception e){
			this.value = 0;
			this.isnull = true;
		}
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public boolean isNull() {
		return isnull;
	}
	
	public boolean exists(){
		return !isnull;
	}

	public void setNull(boolean isnull) {
		this.isnull = isnull;
	}
	
	
}
