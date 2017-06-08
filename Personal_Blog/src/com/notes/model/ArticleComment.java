package com.notes.model;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class ArticleComment {
	private String commentType;
	private String commentArticle;
	public ArticleComment(String type,String articleFullName)
	{
		commentType=type;
		int flag=1;
		for(int i=0;i<articleFullName.length();++i)
		{
			if(articleFullName.charAt(i)=='.')
			{
				flag=0;
				commentArticle=articleFullName.substring(0,i);
			}
		}
		if(flag==1) commentArticle=articleFullName;
	}
	public void printfCommentMessage()
	{
		System.out.println(commentArticle+commentType);
	}
	public void addNewComment(String filePath,String comment)
	{
		if(commentType.equals("notes"))
		{
			filePath+="Notes/comments/"+commentArticle+".out";
			File file=new File(filePath);
			if(!file.exists())	
			{
				try
				{
					file.createNewFile();
				}catch(IOException e)
				{
					 e.printStackTrace();  
			          System.out.println("create file fail "+e.getMessage());    
				}
			}
			try
			{
				BufferedWriter writer=new BufferedWriter(new FileWriter(filePath));
				writer.write(comment);
				writer.write("$$");
				writer.close();
			}catch(IOException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			
		}
	}
}
