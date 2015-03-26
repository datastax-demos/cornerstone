import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class MD5 { 
	
	public MD5(){
	}
	
	private String byteToHex(String s){
		MessageDigest md;
		
		try {
			md = MessageDigest.getInstance("MD5");
	        md.update(s.getBytes());
	        
	        byte byteData[] = md.digest();
	        
	        //convert the byte to hex format method 1
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        
	        return sb.toString();
	        
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			return "";
		}		
	}
	
	public String getHash(String s){
		return byteToHex(s);
	}
	
}
