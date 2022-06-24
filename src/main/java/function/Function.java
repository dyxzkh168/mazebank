package function;

import org.json.JSONArray;
import org.json.JSONObject;
import java.sql.ResultSet;

public class Function {
	public static String getAccountNumber(String accountNumber) {
		
		String accountNumberStr = "";
		for(int i = 0; i < accountNumber.length(); i++){
            accountNumberStr += accountNumber.charAt(i);
            if(i == 2){
                accountNumberStr += "-";
            }else if(i == 5){
                accountNumberStr += "-";
            }
        }		
		return accountNumberStr;
	}
	
	public static JSONArray convertToJSONArray(ResultSet resultSet)
	        throws Exception {
	    JSONArray jsonArray = new JSONArray();
	    while (resultSet.next()) {
	        JSONObject obj = new JSONObject();
	        int total_rows = resultSet.getMetaData().getColumnCount();
	        for (int i = 0; i < total_rows; i++) {
	            obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
	                    .toLowerCase(), resultSet.getObject(i + 1));

	        }
	        jsonArray.put(obj);
	    }
	    return jsonArray;
	}
}

