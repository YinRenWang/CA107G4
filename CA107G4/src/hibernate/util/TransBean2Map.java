package hibernate.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class TransBean2Map {
	
	 public static Map<String, Object> transBean2Map(Object obj) {
		 
	        if(obj == null){
	            return null;
	        }        
	        Map<String, Object> map = new HashMap<String, Object>();
	        try {
	            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
	            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
	            for (PropertyDescriptor property : propertyDescriptors) {
	                String key = property.getName();
	 
	                if (!key.equals("class")) {
	                	
	                    Method getter = property.getReadMethod();
	                    Object value = getter.invoke(obj);
	 
	                    map.put(key, value);
	                }
	 
	            }
	        } catch (Exception e) {
	            System.out.println("transBean2Map Error " + e);
	        }
	 
	        return map;
	 
	    }

}
