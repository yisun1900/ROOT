<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 24px;
	font-weight: bold;
	font-family: "����";
}
-->
</style>
</head>

<%
String khbh=request.getParameter("khbh");
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String bjjb=request.getParameter("bjjb");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";

int row=0;

String xmbh=null;
String xmmc=null;
String glmc=null;
String pp=null;
String xh=null;

double tj=0;
double zdyxmmj=0;
double zdybzmj=0;

double jqsfl=0;
double bsfl=0;
double tvocsfl=0;
double hj=0;
double zjhsl=0;

double jqsflAll=0;
double bsflAll=0;
double tvocsflAll=0;
double hjAll=0;

String jqsflStr=null;
String bsflStr=null;
String tvocsflStr=null;
String hjStr=null;


double zdyxmjqbz=0;
double zdyxmbbz=0;
double zdyxmtvocbz=0;

double zdybzjqbz=0;
double zdybzbbz=0;
double zdybztvocbz=0;

double zdyxmjqsfl=0;
double zdyxmbsfl=0;
double zdyxmtvocsfl=0;

double zdybcjqsfl=0;
double zdybcbsfl=0;
double zdybctvocsfl=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmjqbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmjqbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmbbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmbbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdyxmtvocbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdyxmtvocbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybzjqbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybzjqbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybzbbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybzbbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='zdybztvocbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdybztvocbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	
	
	ls_sql="SELECT fjmj*fjg tj,zdyxmmj,zdybzmj";
	ls_sql+=" FROM bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
    ls_sql+=" order by xuhao";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tj=rs.getDouble("tj");
		zdyxmmj=rs.getDouble("zdyxmmj");
		zdybzmj=rs.getDouble("zdybzmj");
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>


<center>
    <span class="STYLE2">����ָ�꣨<%=jgwzbm%>��<%=tj%>������</span>
</center>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >

  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">��Ŀ���</td>
	  <td  width="22%"><font color="#0000FF"><b>��Ŀ����</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>������</b></font></td>
	  <td  width="18%"><font color="#0000FF"><b>��������</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>Ʒ��</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>�ͺ�</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>��ȩ�ͷ���</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>���ͷ���</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>TVOC�ͷ���</b></font></td>

    </tr>

<%


	ls_sql="SELECT bj_gclmx.xmbh,bj_bjxmmx.xmmc,bj_jzglfxb.glmc,bj_jzglfxb.pp,bj_jzglfxb.xh,bj_gclmx.zjhsl,bj_gclmx.zjhsl*bj_jzglfxb.jqsfl jqsfl,bj_gclmx.zjhsl*bj_jzglfxb.bsfl bsfl,bj_gclmx.zjhsl*bj_jzglfxb.tvocsfl tvocsfl";
	ls_sql+=" FROM bj_gclmx,bj_bjxmmx,bj_jzglfxb";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_gclmx.dqbm=bj_jzglfxb.dqbm and bj_gclmx.xmbh=bj_jzglfxb.xmbh and bj_jzglfxb.bjjbbm='"+bjjb+"'";
	ls_sql+=" and bj_gclmx.khbh=bj_bjxmmx.khbh and bj_gclmx.xmbh=bj_bjxmmx.xmbh  ";
	ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:��׼��Ŀ;2:�Զ�����Ŀ
//		out.println(ls_sql);
	ls_sql+=" order by bj_gclmx.xmbh,bj_jzglfxb.glmc";//1:��׼��Ŀ;2:�Զ�����Ŀ
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		glmc=rs.getString("glmc");
		pp=cf.fillHtml(rs.getString("pp"));
		xh=cf.fillHtml(rs.getString("xh"));
		zjhsl=rs.getDouble("zjhsl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");

		if (tj!=0)
		{
			jqsfl=cf.round(jqsfl/tj,4);
			bsfl=cf.round(bsfl/tj,4);
			tvocsfl=cf.round(tvocsfl/tj,4);
		}
		else{
			jqsfl=0;
			bsfl=0;
			tvocsfl=0;
		}

		hj=jqsfl+bsfl+tvocsfl;

		jqsflAll+=jqsfl;
		bsflAll+=bsfl;
		tvocsflAll+=tvocsfl;
		hjAll+=hj;



		if (jqsfl!=0)
		{
			jqsflStr=cf.formatDouble(jqsfl,"0.####")+"/����";
		}
		else{
			jqsflStr="&nbsp;";
		}

		if (bsfl!=0)
		{
			bsflStr=cf.formatDouble(bsfl,"0.####")+"/����";
		}
		else{
			bsflStr="&nbsp;";
		}

		if (tvocsfl!=0)
		{
			tvocsflStr=cf.formatDouble(tvocsfl,"0.####")+"/����";
		}
		else{
			tvocsflStr="&nbsp;";
		}

		if (hj!=0)
		{
			hjStr=hj+"/����";
		}
		else{
			hjStr="&nbsp;";
		}
	
		
		
		
		
		
		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		<td><%=xmbh%></td>
		<td><%=xmmc%></td>
		<td><%=zjhsl%></td>
		<td><%=glmc%></td>
		<td><%=pp%></td>
		<td><%=xh%></td>
		<td><%=jqsflStr%></td>
		<td><%=bsflStr%></td>
		<td><%=tvocsflStr%></td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();


	
	jqsflAll=cf.round(jqsflAll,4);
	bsflAll=cf.round(bsflAll,4);
	tvocsflAll=cf.round(tvocsflAll,4);
	hjAll=cf.round(hjAll,4);
	
	if (jqsflAll!=0)
	{
		jqsflStr=jqsflAll+"/����";
	}
	else{
		jqsflStr="&nbsp;";
	}

	if (bsflAll!=0)
	{
		bsflStr=bsflAll+"/����";
	}
	else{
		bsflStr="&nbsp;";
	}

	if (tvocsflAll!=0)
	{
		tvocsflStr=tvocsflAll+"/����";
	}
	else{
		tvocsflStr="&nbsp;";
	}

	if (hjAll!=0)
	{
		hjStr=hjAll+"/����";
	}
	else{
		hjStr="&nbsp;";
	}
%>
	<tr bgcolor="<%=bgcolor%>" align="center"> 
	<td colspan="2">��׼������Ŀ�ϼ�</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=jqsflStr%></td>
	<td><%=bsflStr%></td>
	<td><%=tvocsflStr%></td>
	</tr>

  </table>

<P><center>�Զ��屨����Ŀ</center>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >

  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="8%">��Ŀ���</td>
	  <td  width="22%"><font color="#0000FF"><b>��Ŀ����</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>������</b></font></td>
	  <td  width="18%"><font color="#0000FF"><b>��������</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>Ʒ��</b></font></td>
	  <td  width="11%"><font color="#0000FF"><b>�ͺ�</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>��ȩ�ͷ���</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>���ͷ���</b></font></td>
	  <td  width="8%"><font color="#0000FF"><b>TVOC�ͷ���</b></font></td>
  </tr>

<%


	ls_sql="SELECT bj_gclmx.xmbh,bj_bjxmmx.xmmc,bj_gclmx.zjhsl";
	ls_sql+=" FROM bj_gclmx,bj_bjxmmx";
	ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
	ls_sql+=" and bj_gclmx.khbh=bj_bjxmmx.khbh and bj_gclmx.xmbh=bj_bjxmmx.xmbh  ";
	ls_sql+=" and bj_bjxmmx.bjlx='2'";//1:��׼��Ŀ;2:�Զ�����Ŀ
	ls_sql+=" order by bj_gclmx.xmbh ";//1:��׼��Ŀ;2:�Զ�����Ŀ
//		out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		zjhsl=rs.getDouble("zjhsl");

				
		
		if (row%2==0)
		{
			bgcolor="#FFFFCC";
		}
		else{
			bgcolor="#FFFFFF";
		}


		//���ÿ������
		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		<td><%=xmbh%></td>
		<td><%=xmmc%></td>
		<td><%=zjhsl%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();
%>
</table>

<%

	//�Զ���ľ��
	zdyxmjqsfl=zdyxmjqbz*zdyxmmj;

	zdyxmbsfl=zdyxmbbz*zdyxmmj;

	zdyxmtvocsfl=zdyxmtvocbz*zdyxmmj;

	//�Զ����ֽ
	zdybcjqsfl=zdybzjqbz*zdybzmj;

	zdybcbsfl=zdybzbbz*zdybzmj;

	zdybctvocsfl=zdybztvocbz*zdybzmj;


	if (tj!=0)
	{
		zdyxmjqsfl=cf.round(zdyxmjqsfl/tj,4);
		zdyxmbsfl=cf.round(zdyxmbsfl/tj,4);
		zdyxmtvocsfl=cf.round(zdyxmtvocsfl/tj,4);

		zdybcjqsfl=cf.round(zdybcjqsfl/tj,4);
		zdybcbsfl=cf.round(zdybcbsfl/tj,4);
		zdybctvocsfl=cf.round(zdybctvocsfl/tj,4);
	}
	else{
		zdyxmjqsfl=0;
		zdyxmbsfl=0;
		zdyxmtvocsfl=0;

		zdybcjqsfl=0;
		zdybcbsfl=0;
		zdybctvocsfl=0;
	}


%>
  </table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
    <tr align="center">
      <td width="14%" rowspan="2">&nbsp;</td>
      <td colspan="3"><strong>�Զ���ľ����Ŀ</strong></td>
      <td colspan="3"><strong>�Զ����ֽ��Ŀ</strong></td>
      <td width="14%" rowspan="2"><strong>�ϼ�</strong></td>
    </tr>
    <tr align="center">
      <td width="12%"><strong>ÿƽ���ͷ���</strong></td>
      <td width="12%"><strong>�Զ������</strong></td>
      <td width="12%"><strong>���ͷ���</strong></td>
      <td width="12%"><strong>ÿƽ���ͷ���</strong></td>
      <td width="12%"><strong>�Զ������</strong></td>
      <td width="12%"><strong>���ͷ���</strong></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>��ȩ</b></font></td>
      <td><%=cf.formatDouble(zdyxmjqbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmjqsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzjqbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybcjqsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmjqsfl+zdybcjqsfl),4),"0.####")%></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>��</b></font></td>
      <td><%=cf.formatDouble(zdyxmbbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmbsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzbbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybcbsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmbsfl+zdybcbsfl),4),"0.####")%></td>
    </tr>
    <tr align="center">
      <td><font color="#0000FF"><b>TVOC</b></font></td>
      <td><%=cf.formatDouble(zdyxmtvocbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdyxmtvocsfl,"0.####")%></td>
      <td><%=cf.formatDouble(zdybztvocbz,"0.####")%></td>
      <td><%=cf.formatDouble(zdybzmj,"0.####")%></td>
      <td><%=cf.formatDouble(zdybctvocsfl,"0.####")%></td>
      <td><%=cf.formatDouble(cf.round((zdyxmtvocsfl+zdybctvocsfl),4),"0.####")%></td>
    </tr>
  </table>
</body>
</html>


<%
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>