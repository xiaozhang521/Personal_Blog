package com.notes.model;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

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
				//System.out.println(comment);
				BufferedWriter writer=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath,true),"utf-8"));
				writer.append(comment);
				writer.append("$$");
				writer.newLine();
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
	public ArrayList<String> getAllComment(String filePath)
	{
		//编码问题未设置但是好使
		ArrayList<String> comment = new ArrayList<String>(); 
		if(commentType.equals("notes"))
		{
			filePath+="Notes/comments/"+commentArticle+".out";
			File file=new File(filePath);
			if(file.exists())
			{
				String line="";
				try
				{
					//BufferedReader reader=new BufferedReader(new FileReader(file));
					FileInputStream in = new FileInputStream(file);      
			        BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));  
					String newLine="";
					newLine=reader.readLine();
					while(newLine!=null)
					{
						line+=newLine;
						if(line.charAt(line.length()-1)=='$'&&line.charAt(line.length()-2)=='$');
						{
							comment.add(line.substring(0, line.length()-2));
							//System.out.println(line);
							line="";
						}
						newLine=reader.readLine();
					}
					reader.close();
				}catch(IOException e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return comment;
	}
}
