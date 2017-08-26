<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String pageErrorInfo = null;
	SmartUpload su = null;
	String ls=getServletContext().getRealPath("");
	String loadname=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;

	try{
		su = new SmartUpload();
		su.initialize(pageContext);
		su.upload();

		conn=cf.getConnection();
		//----------------------------
		File suFile = null;
		int fileCount = 0;
	    
		//��ȡ���ݹ����Ĳ���
		String ysjlh = su.getRequest().getParameter("ysjlh");

		String fileExt = "";
		int fileSize = 0;
		String AllowedExtensions = su.getRequest().getParameter("ext");//�����ϴ����ļ�����
		double maxFileSize = 100;//���ļ�����С����λKB
		//У���ļ����ͺʹ�С
		for (int i=0; i<su.getFiles().getCount();i++)
			{
				suFile = su.getFiles().getFile(i);
				if (suFile.isMissing())
					continue;
				//У���ļ���С
				fileSize = suFile.getSize()/1024;//�ֽ�ת����KB
				if(fileSize==0) fileSize=1;
				if(maxFileSize<fileSize) System.out.println("�����ϴ���Ƭ���������ܳ���["+maxFileSize+"KB]");
	
				//У���ļ�����
				if (suFile.getFileExt() == null	|| "".equals(suFile.getFileExt())) 
				{
					fileExt = ",,";
				} 
				else {
					fileExt = "," + suFile.getFileExt().toLowerCase() + ",";
				}
				if (!"".equals(AllowedExtensions)
						&& AllowedExtensions.indexOf(fileExt) == -1) {
					System.out.println("���ϴ����ļ�[" + suFile.getFileName()
							+ "]������Ϊϵͳ��ֹ�ϴ����ļ����ͣ������ϴ���");
				}
				fileCount++;
		  }
	        if (fileCount==0) System.out.println("��ѡ���ϴ����ļ�");
	        //׼�������ļ�
	       // String filePath="D:\\tomcat\\webapps\\ROOT\\gcgl\\gcjdgz\\fxys\\fxysimages\\";//������д��Ŀ�д���ϴ��ļ�������·��
		  String filePath="";
	        for (int i=0; i<su.getFiles().getCount();i++) 
				{
					
					suFile = su.getFiles().getFile(i);
					loadname=ysjlh.toUpperCase()+"-"+suFile.getFileName();
					String oldysjlh="";
					ls_sql="SELECT ysjlh";
					ls_sql+=" FROM crm_gcfxyszp";
					ls_sql+=" where yszpmc='"+loadname+"'";
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery(ls_sql);
					if (rs.next())
					{
						oldysjlh=rs.getString(1);

						if (!oldysjlh.equals(ysjlh))
						{
							out.println("����[��Ƭ����]�Ѵ���");
							return;
						}
					}
					rs.close();
					ps.close();
					filePath=ls+"/gcgl/gcjdgz/fxys/fxysimages/"+loadname;
					suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//�����ļ�
					//�������ݿ�
					if (!oldysjlh.equals(ysjlh))
					{
						ls_sql="insert into crm_gcfxyszp(yszpmc,ysjlh) values(?,?)";
						ps= conn.prepareStatement(ls_sql);
						ps.setString(1,loadname);
						ps.setString(2,ysjlh);
						ps.executeUpdate();
						ps.close();

						int zpsl=0;
						ls_sql="SELECT count(*)";
						ls_sql+=" FROM crm_gcfxyszp";
						ls_sql+=" where ysjlh='"+ysjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						rs =ps.executeQuery();
						if (rs.next())
						{
							zpsl=rs.getInt(1);
						}
						rs.close();
						ps.close();
					
						ls_sql="update crm_gcfxysjl set zpsl=?";
						ls_sql+=" where ysjlh='"+ysjlh+"'";
						ps= conn.prepareStatement(ls_sql);
						ps.setInt(1,zpsl);
						ps.executeUpdate();
						ps.close();
					}


				}
	        
				//return null;
	   
		//------------------------------
	}catch(Exception e){
		pageErrorInfo = e.getMessage();
	}finally{
		su = null;
		if(pageErrorInfo!=null){
			System.out.print(pageErrorInfo);
		}
	}
%>