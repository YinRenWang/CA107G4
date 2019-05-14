package com.livestream.model;
import java.util.*;
public class Key {
  
  public static void main(String[] args) {
	  String xxx=key(9);
	  System.out.println(xxx);
  }
  
  public static String key(int max) {
	  max=max+1;
	  String ans =null;
	  MyGenericType<String> myGeneric = new MyGenericType<String>(); 
      if(max<=10) {
    	  for (int i = 0; i < max; i++) {
    	        myGeneric.add("0000" + i);
    	         ans=String.valueOf(myGeneric.get(i));
    	      }
      }else if (max>10) {
    	  for (int i = 0; i < max; i++) {
    	        myGeneric.add("000" + i);
    	        ans=String.valueOf(myGeneric.get(i));
    	      }
      }
	return "LV"+ans;	  
  }
}



class MyGenericType<Type> {

  private List<Type> list;
  
  public MyGenericType() {
    list = new Vector<Type>();
  }
  public void add(Type t) {
    list.add(t);
  }
  public Type get(int i) {
    return list.get(i);
  }
}