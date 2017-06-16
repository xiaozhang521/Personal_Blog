package com.model;
import java.io.File;
import java.util.Date;
public class LatestUpdate {
	private Date time;
	private String fileType;
	public LatestUpdate()
	{
		time=new Date();
		fileType="";
	}
	public String searchLatestFlie(String webPath)
	{
		String fileName="";
		String filePath=webPath+"Notes/p/";
		File dir=new File(filePath);
		String[] child=dir.list();
		if(child.length>0)
		{
			File tmpFile=new File(filePath+child[0]);
			fileName=child[0];
			time=new Date(tmpFile.lastModified());
			for(int i=1;i<child.length;++i)
			{
				fileType="notes";
				File file=new File(filePath+child[i]);
				Long lastModified = file.lastModified();
				Date date = new Date(lastModified);
				if(time.before(date)) {time=date;fileName=child[i];}
			}
		}
		return fileName;
	}
	public String getType()
	{
		return fileType;
	}
}