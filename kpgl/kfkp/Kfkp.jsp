<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̼���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String qssj=request.getParameter("qssj");
String jzsj=request.getParameter("jzsj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String yhdlm=null;
String yhmc=null;
int gchfsl=0;
int tsbxsl=0;
int tsbxhfsl=0;
int dhzxsl=0;
int hj=0;

int allgchfsl=0;
int alltsbxsl=0;
int alltsbxhfsl=0;
int alldhzxsl=0;
int allhj=0;


String all=null;
Hashtable spanColHash=null;

try {
	conn=cf.getConnection();

%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center"> �ͷ����� <br>
    ʱ�䷶Χ��<%=qssj%>----<%=jzsj%>��
</div>

<br><center>������ͳ��</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
    <td width="12%" > 
      <div align="center"><b>����</b></div>
    </td>
    <td width="18%" > 
      <div align="center"><b>���̻ط�����</b></div>
    </td>
    <td width="19%" > 
      <div align="center"><b>Ͷ�߱��޵Ǽ�����</b></div>
    </td>
    <td width="20%" > 
      <div align="center"><b>Ͷ�߱��޻ط����� </b></div>
    </td>
    <td width="18%" > 
      <div align="center"><b>��ѯ�Ǽ�����</b></div>
    </td>
    <td width="13%" > 
      <div align="center"><b>�ϼ�</b></div>
    </td>
  </tr>

<%
	//ȫ��δ��������
	ls_sql="select yhdlm,yhmc ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='FBJ11' and sfzszg in('Y','N')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		yhdlm=rs1.getString("yhdlm");
		yhmc=rs1.getString("yhmc");

		hj=0;
		//���̻ط�����
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where hfr='"+yhmc+"'";
		ls_sql+=" and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gchfsl=rs.getInt(1);
			allgchfsl+=gchfsl;
			hj+=gchfsl;
			allhj+=gchfsl;
		}
		ps.close();
		rs.close();

		//Ͷ�߱��޵Ǽ�����
		ls_sql="select count(*)";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where slr='"+yhmc+"'";
		ls_sql+=" and slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsbxsl=rs.getInt(1);
			alltsbxsl+=tsbxsl;
			hj+=tsbxsl;
			allhj+=tsbxsl;
		}
		ps.close();
		rs.close();

		//Ͷ�߱��޻ط�����
		ls_sql="select count(*)";
		ls_sql+=" from  crm_tshfjl";
		ls_sql+=" where hfr='"+yhmc+"'";
		ls_sql+=" and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsbxhfsl=rs.getInt(1);
			alltsbxhfsl+=tsbxhfsl;
			hj+=tsbxhfsl;
			allhj+=tsbxhfsl;
		}
		ps.close();
		rs.close();

		//��ѯ�绰����
		ls_sql="select count(*)";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where lrr='"+yhmc+"' and zt='1'";
		ls_sql+=" and lrsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
		ls_sql+=" and lrsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			dhzxsl=rs.getInt(1);
			alldhzxsl+=dhzxsl;
			hj+=dhzxsl;
			allhj+=dhzxsl;
		}
		ps.close();
		rs.close();

		%> 
		  <tr align="center"> 
			<td width="12%" ><%=yhmc%></td>
			<td width="18%" ><%=gchfsl%></td>
			<td width="19%" ><%=tsbxsl%></td>
			<td width="20%" ><%=tsbxhfsl%></td>
			<td width="18%" ><%=dhzxsl%></td>
			<td width="13%" ><%=hj%></td>
		  </tr>
		<%	
	}
	ps1.close();
	rs1.close();
%>

  <tr align="center"> 
    <td width="12%" ><b>�ϼ�</b></td>
    <td width="18%" ><b><%=allgchfsl%></b></td>
    <td width="19%" ><b><%=alltsbxsl%></b></td>
    <td width="20%" ><b><%=alltsbxhfsl%></b></td>
    <td width="18%" ><b><%=alldhzxsl%></b></td>
    <td width="13%" ><b><%=allhj%></b></td>
  </tr>
</table>

<br><center>
  Ͷ�߻طü�ʱ��ͳ�� 
</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="37%">Ͷ�߶�������״λط�</td>
	<td  width="27%">��������</td>
	<td  width="36%">��������</td>
</tr>
<%
	//��ȡ���ֵ
	ls_sql=" select max(count(*))";
	ls_sql+=" from crm_tshfjl,crm_tsjlhfmx,crm_tsjl";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD') and lx='1'";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";

	all=cf.executeQuery(ls_sql);

	ls_sql=" select ROUND(crm_tshfjl.hfsj-slsj)||'��' ts,count(*),'<A HREF=\"ViewTsjsx.jsp?qssj="+qssj+"&jzsj="+jzsj+"&day='||ROUND(crm_tshfjl.hfsj-slsj)||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)||'</A>'";
	ls_sql+=" from crm_tshfjl,crm_tsjlhfmx,crm_tsjl";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD') and lx='1'";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tshfjl.hfsj=(select min(crm_tshfjl.hfsj) from crm_tshfjl,crm_tsjlhfmx where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjl.tsjlh=crm_tsjlhfmx.tsjlh)";
	ls_sql+=" group by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";
	ls_sql+=" order by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";

	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("ts","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<br><center>
  Ͷ������δ�ط�ͳ��(δ�᰸) 
</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="37%">��Ͷ��ʱ�䣨�죩</td>
	<td  width="27%">��������</td>
	<td  width="36%">��������</td>
</tr>
<%

	ls_sql=" select ROUND(SYSDATE-slsj),count(*),'<A HREF=\"ViewTswhf.jsp?qssj="+qssj+"&jzsj="+jzsj+"&day='||ROUND(SYSDATE-slsj)||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)||'</A>'";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where zxhfsj is null and lx='1' and clzt!='3'";
//	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
//	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by ROUND(SYSDATE-slsj)";
	ls_sql+=" order by ROUND(SYSDATE-slsj)";

	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("ts","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>


<br><center>
  ���޻طü�ʱ��ͳ�� 
</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="37%">���޶�������״λط�</td>
	<td  width="27%">��������</td>
	<td  width="36%">��������</td>
</tr>
<%
	//��ȡ���ֵ
	ls_sql=" select max(count(*))";
	ls_sql+=" from crm_tshfjl,crm_tsjlhfmx,crm_tsjl";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD') and lx='2'";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";

	all=cf.executeQuery(ls_sql);

	ls_sql=" select ROUND(crm_tshfjl.hfsj-slsj)||'��' ts,count(*),'<A HREF=\"ViewTsjsx.jsp?qssj="+qssj+"&jzsj="+jzsj+"&day='||ROUND(crm_tshfjl.hfsj-slsj)||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)||'</A>'";
	ls_sql+=" from crm_tshfjl,crm_tsjlhfmx,crm_tsjl";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD') and lx='2'";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tshfjl.hfsj=(select min(crm_tshfjl.hfsj) from crm_tshfjl,crm_tsjlhfmx where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjl.tsjlh=crm_tsjlhfmx.tsjlh)";
	ls_sql+=" group by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";
	ls_sql+=" order by ROUND(crm_tshfjl.hfsj-crm_tsjl.slsj)";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("ts","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<br><center>
  ��������δ�ط�ͳ��(δ�᰸)
</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="37%">�ѱ���ʱ�䣨�죩</td>
	<td  width="27%">��������</td>
	<td  width="36%">��������</td>
</tr>
<%

	ls_sql=" select ROUND(SYSDATE-slsj),count(*),'<A HREF=\"ViewBxwhf.jsp?qssj="+qssj+"&jzsj="+jzsj+"&day='||ROUND(SYSDATE-slsj)||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)||'</A>'";
	ls_sql+=" from crm_tsjl";
	ls_sql+=" where zxhfsj is null and lx='2' and clzt!='3'";
//	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
//	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by ROUND(SYSDATE-slsj)";
	ls_sql+=" order by ROUND(SYSDATE-slsj)";
//	out.println(ls_sql);

	pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("ts","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>


<br><center>
  ���̻ط�������ͳ�ƣ������δ�طã� 
</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="7%">�ͻ����</td>
    <td  width="8%">�ͻ�����</td>
    <td  width="9%">ʵ��������</td>
    <td  width="9%">ʵ��������</td>
    <td  width="9%">����ʱ��</td>
    <td  width="9%">�ⶳʱ��</td>
    <td  width="10%">���Ͻ����ط�</td>
    <td  width="10%">���ι��̻ط�</td>
    <td  width="8%">���ڻط�</td>
    <td  width="10%">�깤�ط�</td>
    <td  width="11%">�ϼ�</td>
  </tr>
  <%

	String khbh=null;
	String khxm=null;
	String sjkgrq=null;
	String sjjgrq=null;
	String str1=null;
	String str2=null;
	String str3=null;
	String str4=null;

	int hf1=0;
	int hf2=0;
	int hf3=0;
	int hf4=0;
	int hfall=0;

	ls_sql="select khbh,khxm,sjkgrq,sjjgrq ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where gcjdbm='5'";
	ls_sql+=" and qyrq>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by khbh";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		khbh=rs1.getString("khbh");
		khxm=rs1.getString("khxm");
		sjkgrq=cf.fillHtml(rs1.getDate("sjkgrq"));
		sjjgrq=cf.fillHtml(rs1.getDate("sjjgrq"));

		hfall=0;
		//���Ͻ����ط�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='21'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hf1=rs.getInt(1);

			hfall+=hf1;
		}
		ps.close();
		rs.close();
		//���ι��̻ط�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='22'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hf2=rs.getInt(1);

			hfall+=hf2;
		}
		ps.close();
		rs.close();
		//���ڻط�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='23'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hf3=rs.getInt(1);

			hfall+=hf3;
		}
		ps.close();
		rs.close();
		//�깤�ط�
		ls_sql="select count(*)";
		ls_sql+=" from  crm_hfjl";
		ls_sql+=" where khbh='"+khbh+"' and hflxbm='24'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			hf4=rs.getInt(1);

			hfall+=hf4;
		}
		ps.close();
		rs.close();

		if ( hf1==0 )
		{
			str1="<font color=\"#FF66FF\" >��</font>";
		}
		else{
			str1=""+hf1;
		}
		if ( hf2==0 )
		{
			str2="<font color=\"#FF66FF\" >��</font>";
		}
		else{
			str2=""+hf2;
		}
		if ( hf3==0 )
		{
			str3="<font color=\"#FF66FF\" >��</font>";
		}
		else{
			str3=""+hf3;
		}
		if ( hf4==0 )
		{
			str4="<font color=\"#FF66FF\" >��</font>";
		}
		else{
			str4=""+hf4;
		}

%> 
  <tr  align="center"> 
    <td width="7%" ><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khbh%></A></td>
    <td width="8%" ><%=khxm%></td>
    <td width="9%" ><%=sjkgrq%></td>
    <td width="9%" ><%=sjjgrq%></td>
    <td width="9%" >&nbsp;</td>
    <td width="9%" >&nbsp;</td>
    <td width="10%" ><%=str1%></td>
    <td width="10%" ><%=str2%></td>
    <td width="8%" ><%=str3%></td>
    <td width="10%" ><%=str4%></td>
    <td width="11%" ><%=hfall%>��</td>
  </tr>
  <%
	}
	ps1.close();
	rs1.close();

%> 
</table>

<br><center>���̻ط�ͳ��</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="22%">�ط�����</td>
	<td  width="30%">ʵ�ط�ʱ����Ӧ�ط�ʱ���</td>
	<td  width="19%">����</td>
	<td  width="29%">����</td>
</tr>
<%
	//��ȡ���ֵ
	ls_sql=" select max(count(*))";
	ls_sql+=" from crm_hfjl,dm_hflxbm";
	ls_sql+=" where crm_hfjl.hflxbm=dm_hflxbm.hflxbm and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by crm_hfjl.hflxbm,hflxmc,hfsj-yhfrq";

	all=cf.executeQuery(ls_sql);

	ls_sql=" select hflxmc,hfsj-yhfrq||'��',count(*),'<A HREF=\"ViewGchfmx.jsp?hflxbm='||crm_hfjl.hflxbm||'&qssj="+qssj+"&jzsj="+jzsj+"&day='||(hfsj-yhfrq)||'\" target=\"_blank\"><img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)||'</A>'";
	ls_sql+=" from crm_hfjl,dm_hflxbm";
	ls_sql+=" where crm_hfjl.hflxbm=dm_hflxbm.hflxbm and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by crm_hfjl.hflxbm,hflxmc,hfsj-yhfrq";
	ls_sql+=" order by crm_hfjl.hflxbm,hfsj-yhfrq";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[3]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<br><center>ÿ�칤�̻ط�����ͳ��</center>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td colspan="3">���̻ط�ʱ��</td>
    <td rowspan="2">�ط�����</td>
    <td rowspan="2">�ط�����</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="14%">��</td>
    <td  width="11%">��</td>
    <td  width="12%">��</td>
  </tr>
  <%
	//��ȡ���ֵ
	ls_sql=" select max(count(*))";
	ls_sql+=" from crm_hfjl";
	ls_sql+=" where hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by TO_CHAR(hfsj,'YYYY'),TO_CHAR(hfsj,'MM'),TO_CHAR(hfsj,'DD')";

	all=cf.executeQuery(ls_sql);

	ls_sql=" select TO_CHAR(hfsj,'YYYY') nian,TO_CHAR(hfsj,'MM') yue,TO_CHAR(hfsj,'DD') ri,count(*),'<img src=\"/images/ColuGif.gif\" width='||count(*)*200/"+all+"||' height=14>&nbsp;'||count(*)";
	ls_sql+=" from crm_hfjl";
	ls_sql+=" where hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" group by TO_CHAR(hfsj,'YYYY'),TO_CHAR(hfsj,'MM'),TO_CHAR(hfsj,'DD')";
	ls_sql+=" order by TO_CHAR(hfsj,'YYYY'),TO_CHAR(hfsj,'MM'),TO_CHAR(hfsj,'DD')";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(30000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";//����ÿҳ��ʾ��¼��

//������ʾ�ϲ���
	spanColHash=new Hashtable();
	spanColHash.put("nian","1");//�в����������Hash��
	spanColHash.put("yue","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>



</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%> 

