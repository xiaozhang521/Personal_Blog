package com.notes.model;
import java.io.File;
public class SearchAllFile {
	public String[] searchFlie(String webPath)
	{
		//**********problem**********
		File dir=new File(webPath+"Notes/p/");
		String[] children = dir.list();
        return children;
	}
}
