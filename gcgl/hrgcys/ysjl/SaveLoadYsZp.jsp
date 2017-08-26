<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.*,java.util.* "%>
<%@ page import='ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String pageErrorInfo = null;
SmartUpload su = null;
String ls=getServletContext().getRealPath("");
String loadname=null;


Vector vector = new Vector();


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try{
	su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();

	
	//----------------------------
	File suFile = null;
	int fileCount = 0;
	
	//��ȡ���ݹ����Ĳ���
	String ysjlh = su.getRequest().getParameter("ysjlh");
	String zpml = su.getRequest().getParameter("zpml");
	String zplx = su.getRequest().getParameter("zplx");
	String zpxm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpxm"),"UTF-8");
	String zpsm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpsm"),"UTF-8");



	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//�����ϴ����ļ�����
	double maxFileSize = 1024*30;//���ļ�����С����λKB
	//У���ļ����ͺʹ�С
	for (int i=0; i<su.getFiles().getCount();i++)
	{
		suFile = su.getFiles().getFile(i);
		if (suFile.isMissing())
			continue;
		//У���ļ���С
		fileSize = suFile.getSize()/1024;//�ֽ�ת����KB
		if(fileSize==0) fileSize=1;
		if(maxFileSize<fileSize) out.println("�����ϴ���Ƭ���������ܳ���["+maxFileSize+"KB]");

		//У���ļ�����
		if (suFile.getFileExt() == null	|| "".equals(suFile.getFileExt())) 
		{
			fileExt = ",,";
		} 
		else {
			fileExt = "," + suFile.getFileExt().toLowerCase() + ",";
		}

		if (!"".equals(AllowedExtensions) && AllowedExtensions.indexOf(fileExt) == -1) 
		{
			out.println("���ϴ����ļ�[" + suFile.getFileName()+ "]������Ϊϵͳ��ֹ�ϴ����ļ����ͣ������ϴ���");
		}

		fileCount++;
	}

	if (fileCount==0) out.println("��ѡ���ϴ����ļ�");
	//׼�������ļ�
	// String filePath="D:\\tomcat\\webapps\\ROOT\\gcgl\\gcjdgz\\fxys\\fxysimages\\";//������д��Ŀ�д���ϴ��ļ�������·��
	String filePath="";
	for (int i=0; i<su.getFiles().getCount();i++) 
	{
	
		suFile = su.getFiles().getFile(i);
		loadname=ysjlh.toUpperCase()+"-"+zpxm+"-"+suFile.getFileName();

		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");


		filePath=ls+"/yblimg/gcys/"+zpml+"/"+loadname;
		System.out.println("/yblimg/gcys/"+zpml+"/"+loadname);

		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//�����ļ�

		String inF=filePath;
		String outF=filePath;
		int outWidth=800;
		int outHeight=800;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  

		vector.add(loadname);

	}

	conn=cf.getConnection();


	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM crm_heysjl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();


	String fgsbh = "";
	ls_sql="SELECT fgsbh";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=rs.getString(1);
	}
	rs.close();
	ps.close();

	String zpsfxsh = "";//��Ƭ�Ƿ������  Y������ˣ�N������
	ls_sql="SELECT zpsfxsh";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsfxsh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	
	String kkzpbz="0";//0���ɿ�   1�ɿ�

	if (zpsfxsh.equals("N"))//Y������ˣ�N������
	{
		kkzpbz="1";
	}

	Iterator iterator = vector.iterator();

	while(iterator.hasNext())
	{
		String yszpmc=(String)iterator.next();

		//�������ݿ�
		ls_sql =" delete from crm_heyszp  ";
		ls_sql+=" where yszpmc='"+yszpmc+"' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into crm_heyszp(yszpmc,ysjlh,zplx,zpxm,zpsm,kkzpbz,khbh,zpml,zpshbz) values(?,?,?,?,?,?,?,?,'N')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yszpmc);
		ps.setString(2,ysjlh);
		ps.setString(3,zplx);
		ps.setString(4,zpxm);
		ps.setString(5,zpsm);
		ps.setString(6,kkzpbz);
		ps.setString(7,khbh);
		ps.setString(8,zpml);
		ps.executeUpdate();
		ps.close();
	}

	
	int zpsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_heysjl set zpsl=?";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zpsl);
	ps.executeUpdate();
	ps.close();
	//------------------------------
}
catch(Exception e)
{
	pageErrorInfo = e.getMessage();

	System.out.print("<BR>����:" + e);
	System.out.print("<BR>SQL=" + ls_sql);
	return;
}
finally
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}

	su = null;
	if(pageErrorInfo!=null){
		System.out.print(pageErrorInfo);
	}
}
%>