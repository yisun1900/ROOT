<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;

String xzjg=cf.GB2Uni(request.getParameter("xzjg"));
double dj=0;
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ������]����ת����������:"+e);
	return;
}

String zcpzwzbm=null;
String zcysbm=null;
double sl=0;
double je=0;
double ycf=0;

zcpzwzbm=cf.GB2Uni(request.getParameter("zcpzwzbm"));
zcysbm=cf.GB2Uni(request.getParameter("zcysbm"));


ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����je������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("ycf");
try{
	if (!(ls.equals("")))  ycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷�]����ת����������:"+e);
	return;
}

String qtfy=cf.GB2Uni(request.getParameter("qtfy"));
double qtfyje=0;
ls=request.getParameter("qtfyje");
try{
	if (!(ls.equals("")))  qtfyje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtfyje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ѽ��]����ת����������:"+e);
	return;
}

double cxhdbl=0;
double cxhdje=0;
double cbj=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxhdje");
try{
	if (!(ls.equals("")))  cxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɱ���]����ת����������:"+e);
	return;
}

String bz=cf.GB2Uni(request.getParameter("bz"));

String ddbh=request.getParameter("ddbh");
String zjxbh=request.getParameter("zjxbh");
String zcbm=request.getParameter("zcbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int mark=0;
	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String qddm=null;
	String jzsjs=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,qddm,jzsjs,ppbm,gys,ppmc";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_zczjxmx,jc_zcddmx";
	ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh=jc_zcddmx.xh and jc_zcddmx.zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		out.println("<BR><font color=\"#FF0000\"><B>���󣡸��������ѱ�ѡ��</B></font>");
		mark=1;
	}



	String getppbm=null;
	String getgys=null;
	String getppmc=null;
	ls_sql="select dwbh,gys,ppmc";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getppbm=cf.fillNull(rs.getString("dwbh"));
		getgys=cf.fillNull(rs.getString("gys"));
		getppmc=cf.fillNull(rs.getString("ppmc"));
	}
	else{
		out.println("<font color=\"#FF0000\"><B>���󣡸������Ĳ�����</B></font>");
		mark=1;
	}
	rs.close();
	ps.close();

	if (!getppbm.equals(ppbm) || !getgys.equals(gys) || !getppmc.equals(ppmc))
	{
		out.println("<font color=\"#FF0000\"><B>����[Ʒ�ƹ�Ӧ�̡���Ӧ�̡�Ʒ��]�붩����һ��</B></font>");
		mark=1;
	}

	conn.setAutoCommit(false);

	if (mark==0)
	{
		String cxhdbz=null;
		if (cxhdbl>0)
		{
			cxhdbz="Y";
		}
		else{
			cxhdbz="N";
		}

		long xh=0;
		ls_sql="select NVL(max(xh),0)";
		ls_sql+=" from  jc_zcddmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();
		xh++;
		
		ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,xzjg,dj,cbj,sl,je,ycf,qtfy,qtfyje,zjhsl,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz)"; 
		ls_sql+="                select ?,?,?,?          ,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xh,gg       ,?     ,jldwbm,sfbhpj,pjts,lsj,yhj  ,cbj  ,cxhdbl  ,sfycx,cxkssj,cxjzsj,cxj,cxcbj,lscxhdbl  ,?,?,?,?,?,?,?,?,?,?,?,?                                       ,?,?,?,?,?,'2',?,SYSDATE                      ,?,?,?,?,?,?";//1����ͬ�2������
		ls_sql+=" from  jc_zcjgb";
		ls_sql+=" where zcbm='"+zcbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,xh);
		ps.setString(2,ddbh);
		ps.setString(3,khbh);
		ps.setString(4,zcbm);

		ps.setString(5,zcysbm);

		ps.setString(6,xzjg);
		ps.setDouble(7,dj);
		ps.setDouble(8,cbj);
		ps.setDouble(9,0);
		ps.setDouble(10,0);
		ps.setDouble(11,0);
		ps.setString(12,qtfy);
		ps.setDouble(13,0);
		ps.setDouble(14,0);
		ps.setDouble(15,0);
		ps.setDouble(16,0);
		ps.setDouble(17,0);


		ps.setString(18,zcpzwzbm);
		ps.setString(19,cxhdbz);
		ps.setDouble(20,cxhdbl);
		ps.setDouble(21,0);
		ps.setDouble(22,0);
		ps.setString(23,yhmc);

		ps.setString(24,"1");//1������д��2����д
		ps.setString(25,"");
		ps.setString(26,fgsbh);
		ps.setString(27,qddm);
		ps.setString(28,jzsjs);
		ps.setString(29,bz);
		ps.executeUpdate();
		ps.close();

		ls_sql ="insert into jc_zczjxmx (ddbh,zjxbh,xh   ,zjsl,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje,bz  ,lx,sxbz) ";
		ls_sql+=" values( ?,?,?   ,?,?,?,?,?,?,?  ,'2','1')";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,zjxbh);
		ps.setLong(3,xh);

		ps.setDouble(4,sl);
		ps.setDouble(5,je);
		ps.setDouble(6,cxhdje);
		ps.setDouble(7,ycf);
		ps.setDouble(8,qtfyje);
		ps.setDouble(9,sl*cbj);//�����ɱ����
		ps.setString(10,bz);
		ps.executeUpdate();
		ps.close();

		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}

	conn.commit();


}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

	
	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql ="SELECT jc_zcddmx.xh xh,DECODE(jc_zczjxmx.lx,'1','ԭ��Ŀ','2','����') lx,DECODE(jc_zczjxmx.sxbz,'1','����д','2','��д') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,zclbbm,jc_zcddmx.zcbm zcbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(xzjg,'1','���ۼ�','2','<font color=\"#FF0000\">������</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,jc_zczjxmx.zjcxhdje,jc_zcddmx.zjhsl,jc_zcddmx.zjhje,jc_zcddmx.zjhycf,jc_zcddmx.zjhqtfy,jc_zcddmx.zjhcxhdje,cxhdbl||'%' cxhdbl,jc_zczjxmx.bz  ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditJc_zcddmxMain.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"lx","sxbz","zclbbm","zcmc","xinghao","gg","xzjg","dj","jldwbm","cxhdbl","zjsl","zjje","zjycf","zjqtfy","zjcxhdje","zjhsl","zjhje","zjhycf","zjhqtfy","zjhcxhdje","zcpzwzbm","zcysbm","sxhtyy","zcbm","dwbh","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е�����"};//��ť����ʾ����
	String[] buttonLink={"DeleteJc_zcddmx.jsp?zjxbh="+zjxbh+"&ddbh="+ddbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��������ϸ���������ţ�<%=zjxbh%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">����</td>
	<td  width="3%">��д��־</td>
	<td  width="7%">ϵ��</td>
	<td  width="5%">��������</td>
	<td  width="5%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="3%">ѡ��۸�</td>
	<td  width="3%">����</td>
	<td  width="2%">������λ</td>
	<td  width="3%">��������</td>
	<td  width="3%" bgcolor="#CC99FF">��������</td>
	<td  width="4%" bgcolor="#CC99FF">�������Ϸ�</td>
	<td  width="3%" bgcolor="#CC99FF">����Զ�̷�</td>
	<td  width="3%" bgcolor="#CC99FF">����������</td>
	<td  width="4%" bgcolor="#CC99FF">�����������</td>
	<td  width="3%">ԭ����</td>
	<td  width="4%">ԭ���Ϸ�</td>
	<td  width="3%">ԭԶ�̷�</td>
	<td  width="3%">ԭ������</td>
	<td  width="4%">ԭ�������</td>
	<td  width="4%">��װλ��</td>
	<td  width="3%">��ɫ</td>
	<td  width="5%">��д��ͬԭ��</td>
	<td  width="3%">���ı���</td>
	<td  width="5%">Ʒ�ƹ�Ӧ��</td>
	<td  width="5%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>