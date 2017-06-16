package com.model;

import java.io.File;
import java.util.ArrayList;

public class SearchFile {
	String webPath;
	public SearchFile(String path)
	{
		webPath=path;
	}
	public ArrayList<String> findNotesFile(String keyWord)
	{
		File dir=new File(webPath+"Notes/p/");
		ArrayList<String> ans=new ArrayList<String>();
		String[] children = dir.list();
		keyWord=keyWord.toLowerCase();
		for(int i=0;i<children.length;++i)
		{
			String lowerString=children[i].toLowerCase();
			int check1=children[i].indexOf(keyWord);
			int check2=lowerString.indexOf(keyWord);
			if(check1!=-1||check2!=-1)//过滤后缀
			{
				if(filter(children[i],keyWord,check1)||filter(lowerString,keyWord,check2))
					ans.add(children[i]);
			}
		}
		return ans;
	}
	private boolean filter(String fileName,String keyWord,int check)
	{
		boolean flag=true;
		if(check==-1) return false;
		/*System.out.println(keyWord);
		System.out.println(fileName);
		System.out.println(check);*/
		for(int j=0;j<fileName.length();++j)
		{
			if(fileName.charAt(j)=='.')
			{
				if(check>j) flag=false;
				break;
			}
		}
		return flag;
	}
}
