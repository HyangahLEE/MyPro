package com.util;

public class pwd {

	
	public static void main(String[] args ) {
		
		
		char[] charset=new char[] {'0','1','2','3','4','5','6','7','8','9'
									,'a','b','c','d','e','f','g','h','i'
									,'j','k','l','m','n','o','p','q','r','s'
									,'t','u','v','w','x','y','z'};
		int idx;
		StringBuffer sb=new StringBuffer(); 
		for(int i=1; i<=10;i++) {  //반복횟수가 임시비밀번호 길이가 됨
		   idx=(int)(charset.length * (Math.random()));
		   sb.append(charset[idx]);
		}
		
		System.out.println(sb.toString());
		
	}
}
