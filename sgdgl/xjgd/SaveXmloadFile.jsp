<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*,java.net.*,java.util.* "%>
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
	Vector vector = new Vector();

	su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();

	//----------------------------
	File suFile = null;
	int fileCount = 0;
	
	//��ȡ���ݹ����Ĳ���
	String xjjlh = su.getRequest().getParameter("xjjlh");
	String zpml = su.getRequest().getParameter("zpml");
	String lx = su.getRequest().getParameter("lx");
	String zpgjz = java.net.URLDecoder.decode(su.getRequest().getParameter("zpgjz"),"UTF-8");
	String zpsm = java.net.URLDecoder.decode(su.getRequest().getParameter("zpsm"),"UTF-8");

	String fileExt = "";
	int fileSize = 0;
	String AllowedExtensions = su.getRequest().getParameter("ext");//�����ϴ����ļ�����
	double maxFileSize = 1024*3;//���ļ�����С����λKB
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
		loadname=xjjlh.toUpperCase()+"-"+suFile.getFileName();

		loadname=URLEncoder.encode(loadname);
		loadname=URLDecoder.decode(loadname,"utf-8");
		System.out.println(loadname);


		filePath=ls+"/yblimg/xjgd/"+zpml+"/"+loadname;
		suFile.saveAs(filePath,SmartUpload.SAVE_PHYSICAL);//�����ļ�

		vector.add(loadname);

		String inF=filePath;
		String outF=filePath;
		int outWidth=800;
		int outHeight=800;
		boolean rateIs=true;

		ybl.common.ImgDeal.compressPic(inF,outF,outWidth,outHeight,rateIs);  
	}

	conn=cf.getConnection();

	
	String khbh = "";
	ls_sql="SELECT khbh";
	ls_sql+=" FROM kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
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
		String xjzpmc=(String)iterator.next();
		//�������ݿ�
		ls_sql="insert into kp_xjgdjlzp(xjzpmc,xjjlh,zpsm,lx,zpgjz,zpml,kkzpbz,zpshbz) values(?,?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,xjzpmc);
		ps.setString(2,xjjlh);
		ps.setString(3,zpsm);
		ps.setString(4,lx);
		ps.setString(5,zpgjz);
		ps.setString(6,zpml);
		ps.setString(7,kkzpbz);
		ps.setString(8,"N");//Y����ˣ�N��δ���
		ps.executeUpdate();
		ps.close();
	}
	
	int zpsl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zpsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	ls_sql="update kp_xjgdjl set zpsl=?";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,zpsl);
	ps.executeUpdate();
	ps.close();
	//------------------------------
}
catch(Exception e)
{
	pageErrorInfo = e.getMessage();

	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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