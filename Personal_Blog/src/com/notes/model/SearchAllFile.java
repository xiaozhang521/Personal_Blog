package com.notes.model;
import java.io.File;
public class SearchAllFile {
	public String[] searchNotesFlie(String webPath)
	{
		//**********problem**********
		File dir=new File(webPath+"Notes/p/");
		String[] children = dir.list();
        return children;
	}
	public String[] searchSourceFlie(String webPath)
	{
		//**********problem**********
		File dir=new File(webPath+"Download/Source/");
		String[] children = dir.list();
        return children;
	}
}
