<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gysmc=null;
String dqbm=null;
String gyslb=null;
String zclb=null;
String bz=null;
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
gyslb=cf.GB2Uni(request.getParameter("gyslb"));
zclb=cf.GB2Uni(request.getParameter("zclb"));
bz=cf.GB2Uni(request.getParameter("bz"));
int mrazhs=0;
ls=request.getParameter("mrazhs");
try{
	if (!(ls.equals("")))  mrazhs=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mrazhs������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ�հ�װ��������]����ת����������:"+e);
	return;
}

String ppbm=request.getParameter("ppbm");
String gysbm=request.getParameter("gysbm");

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݿ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhjzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݽ���ʱ��]����ת����������:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
String[] ssfgs=request.getParameterValues("ssfgs");
String cwdm=cf.GB2Uni(request.getParameter("cwdm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String ppmc=null;
	ls_sql="select ppmc";
	ls_sql+=" from  sq_ppxx";
	ls_sql+=" where ppbm='"+ppbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ppmc=rs.getString(1);
	}
	rs.close();
	ps.close();

	String gys=null;
	ls_sql="select gys";
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where gysbm='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gys=rs.getString(1);
	}
	rs.close();
	ps.close();

	//�������ֹ�˾���м�飬��Ʒ�ƹ�Ӧ����Ȩ�ֹ�˾��Ҫ����������Ӧ����Ȩ�ֹ�˾��������������������������ʼ
	int mark=0;
	for (int i=0;i<ssfgs.length ;i++ )
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_gyssqfgs";
		ls_sql+=" where gysbm='"+gysbm+"' and ssfgs='"+ssfgs[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count<1)
		{
			String dwmc=null;
			ls_sql="select dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+ssfgs[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dwmc=rs.getString(1);
			}
			rs.close();
			ps.close();

			mark++;

			out.println("<P>���󣡡�"+dwmc+"�����ڹ�Ӧ�̡�"+gys+"���ķ���Χ��");
		}
	}

	if (mark>0)
	{
		String dwmc="";
		ls_sql="select dwmc";
		ls_sql+=" from  sq_gyssqfgs,sq_dwxx";
		ls_sql+=" where sq_gyssqfgs.ssfgs=sq_dwxx.dwbh and sq_gyssqfgs.gysbm='"+gysbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			dwmc+=rs.getString(1)+"��";
		}
		rs.close();
		ps.close();

		if (dwmc.equals(""))
		{
			out.println("<P>���ѣ���Ӧ�̡�"+gys+"��δ¼�����Χ");
		}
		else{
			out.println("<P>���ѣ���Ӧ�̡�"+gys+"���ķ���Χ��"+dwmc+"��");
		}

		return;

	}
	//�������ֹ�˾���м�飬��Ʒ�ƹ�Ӧ����Ȩ�ֹ�˾��Ҫ�����ڡ���Ӧ����Ȩ�ֹ�˾��========================����


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where gysmc='"+gysmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("����Ʒ�ƹ�Ӧ�������Ѵ���");
		return;
	}

	int gysbh=0;
	ls_sql="select NVL(max(gysbh),0)";
	ls_sql+=" from  sq_gysxx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gysbh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gysbh++;
	
	conn.setAutoCommit(false);

	ls_sql="insert into sq_gysxx ( gysbh,gysmc,dqbm,gyslb,zclb,bz,mrazhs,ppbm,ppmc,gysbm,gys,sfyyh,yhkssj,yhjzsj,yhnr,cwdm) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,gysbh);
	ps.setString(2,gysmc);
	ps.setString(3,dqbm);
	ps.setString(4,gyslb);
	ps.setString(5,zclb);
	ps.setString(6,bz);
	ps.setInt(7,mrazhs);
	ps.setString(8,ppbm);
	ps.setString(9,ppmc);
	ps.setString(10,gysbm);
	ps.setString(11,gys);
	ps.setString(12,sfyyh);
	ps.setDate(13,yhkssj);
	ps.setDate(14,yhjzsj);
	ps.setString(15,yhnr);
	ps.setString(16,cwdm);
	ps.executeUpdate();
	ps.close();


	for (int i=0;i<ssfgs.length ;i++ )
	{
		ls_sql="insert into sq_ppgyssqfgs (gysbh,ssfgs ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,gysbh);
		ps.setString(2,ssfgs[i]);
		ps.executeUpdate();
		ps.close();
	}

		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>