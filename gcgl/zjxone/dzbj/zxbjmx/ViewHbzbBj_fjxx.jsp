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

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String wybh=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
double dj=0;

int fjsl=0;
double fjmj=0;
double fjg=0;
double tj=0;
double zdyxmmj=0;
double zdybzmj=0;
int xuhao=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

double jqgjbz=0;
double bgjbz=0;
double tvocgjbz=0;

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

double alljq=0;
double allb=0;
double alltvoc=0;
double alltj=0;

double jqbfb=0;
double bbfb=0;
double tvocbfb=0;

String khxm=null;
String lxfs=null;
String fwdz=null;
String sjs=null;
String bjjbmc=null;

String jqsflStr=null;
String bsflStr=null;
String tvocsflStr=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='jqgjbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jqgjbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='bgjbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bgjbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
	ls_sql+=" where csbm='tvocgjbz'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tvocgjbz=rs.getDouble("csz");
	}
	rs.close();
	ps.close();

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


	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<center>
    <span class="STYLE2">����ָ��Ԥ����</span>
</center>
  <table width="100%" border="0" style='FONT-SIZE: 14px'>
    <tr>
      <td width="50%"><strong>�ͻ�������</strong><%=khxm%></td>
      <td width="50%"><strong>�� �� ʦ��</strong><%=sjs%></td>
    </tr>
    <tr>
      <td><strong>���ݵ�ַ��</strong><%=fwdz%></td>
      <td><strong>���ۼ���</strong><%=bjjbmc%></td>
    </tr>
  </table>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >

  <tr bgcolor="#CCCCCC"  align="center">
    <td width="4%" rowspan="2"><font color="#0000FF"><b>�������</b></font></td>
    <td width="12%" rowspan="2">��������</td>
    <td width="7%" rowspan="2"><font color="#0000FF"><b>����������O��</b></font></td>
    <td width="7%" rowspan="2"><font color="#0000FF"><b>����ߣ��ף�</b></font></td>
    <td width="7%" rowspan="2"><font color="#0000FF"><b>���������������</b></font></td>
    <td colspan="2"><font color="#0000FF"><b>��ȩ�ͷ���(mg/m3)</b></font></td>
    <td colspan="2"><font color="#0000FF"><b>���ͷ���(mg/m3)</b></font></td>
    <td colspan="2"><font color="#0000FF"><b>TVOC�ͷ���(mg/m3)</b></font></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%"><font color="#0000FF"><b>    ���ұ�׼</b></font></td>
	  <td  width="15%"><font color="#0000FF"><b>�Զ���</b></font>��<font color="#0000FF"><b>��׼��Ŀ</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>    ���ұ�׼</b></font></td>
	  <td  width="15%"><font color="#0000FF"><b>�Զ���</b></font>��<font color="#0000FF"><b>��׼��Ŀ</b></font></td>
	  <td  width="6%"><font color="#0000FF"><b>���ұ�׼</b></font></td>
	  <td  width="15%"><font color="#0000FF"><b>�Զ���</b></font>��<font color="#0000FF"><b>��׼��Ŀ</b></font></td>
  </tr>

<%
	String bjjb=null;	
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	ls_sql="SELECT jgwzbm,fjmj,fjg,xuhao,fjmj*fjg tj,zdyxmmj,zdybzmj";
	ls_sql+=" FROM bj_fjxx";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by xuhao";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		jgwzbm=rs.getString("jgwzbm");
		fjmj=rs.getDouble("fjmj");
		fjg=rs.getDouble("fjg");
		tj=rs.getDouble("tj");
		zdyxmmj=rs.getDouble("zdyxmmj");
		zdybzmj=rs.getDouble("zdybzmj");
		xuhao=rs.getInt("xuhao");


		ls_sql="SELECT ROUND(sum(bj_gclmx.zjhsl*bj_jzglfxb.jqsfl),4) jqsfl,ROUND(sum(bj_gclmx.zjhsl*bj_jzglfxb.bsfl),4) bsfl,ROUND(sum(bj_gclmx.zjhsl*bj_jzglfxb.tvocsfl),4) tvocsfl";
		ls_sql+=" FROM bj_gclmx,bj_jzglfxb";
		ls_sql+=" where bj_gclmx.khbh='"+khbh+"' and bj_gclmx.jgwzbm='"+jgwzbm+"'";
		ls_sql+=" and bj_gclmx.dqbm=bj_jzglfxb.dqbm and bj_gclmx.xmbh=bj_jzglfxb.xmbh and bj_jzglfxb.bjjbbm='"+bjjb+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jqsfl=rs1.getDouble("jqsfl");
			bsfl=rs1.getDouble("bsfl");
			tvocsfl=rs1.getDouble("tvocsfl");
		}
		rs1.close();
		ps1.close();


		//�Զ���ľ��
		zdyxmjqsfl=zdyxmjqbz*zdyxmmj;
		zdyxmjqsfl=cf.round(zdyxmjqsfl,4);
	
		zdyxmbsfl=zdyxmbbz*zdyxmmj;
		zdyxmbsfl=cf.round(zdyxmbsfl,4);
	
		zdyxmtvocsfl=zdyxmtvocbz*zdyxmmj;
		zdyxmtvocsfl=cf.round(zdyxmtvocsfl,4);

		//�Զ����ֽ
		zdybcjqsfl=zdybzjqbz*zdybzmj;
		zdybcjqsfl=cf.round(zdybcjqsfl,4);
	
		zdybcbsfl=zdybzbbz*zdybzmj;
		zdybcbsfl=cf.round(zdybcbsfl,4);
	
		zdybctvocsfl=zdybztvocbz*zdybzmj;
		zdybctvocsfl=cf.round(zdybctvocsfl,4);

		zdyxmjqsfl+=zdybcjqsfl;
		zdyxmbsfl+=zdybcbsfl;
		zdyxmtvocsfl+=zdybctvocsfl;
		
		alljq+=zdyxmjqsfl+jqsfl;
		allb+=zdyxmbsfl+bsfl;
		alltvoc+=zdyxmtvocsfl+tvocsfl;
		alltj+=tj;


		if (tj!=0)
		{
			jqsfl=cf.round(jqsfl/tj,4);
			bsfl=cf.round(bsfl/tj,4);
			tvocsfl=cf.round(tvocsfl/tj,4);

			zdyxmjqsfl=cf.round(zdyxmjqsfl/tj,4);
			zdyxmbsfl=cf.round(zdyxmbsfl/tj,4);
			zdyxmtvocsfl=cf.round(zdyxmtvocsfl/tj,4);
		}
		else{
			jqsfl=0;
			bsfl=0;
			tvocsfl=0;

			zdyxmjqsfl=0;
			zdyxmbsfl=0;
			zdyxmtvocsfl=0;
		}


		if (cf.round((jqsfl+zdyxmjqsfl),4)!=0)
		{
			if ((jqsfl+zdyxmjqsfl)>jqgjbz)
			{
				if (zdyxmjqsfl!=0 && jqsfl!=0)
				{
					jqsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmjqsfl,"0.####")+"��"+cf.formatDouble(jqsfl,"0.####")+"��"+cf.formatDouble(cf.round((jqsfl+zdyxmjqsfl),4),"0.####")+"</font>";
				}
				else if (zdyxmjqsfl!=0 && jqsfl==0)
				{
					jqsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmjqsfl,"0.####")+"(�Զ���)</font>";
				}
				else if (zdyxmjqsfl==0 && jqsfl!=0)
				{
					jqsflStr="<font color=\"#FF0000\">"+cf.formatDouble(jqsfl,"0.####")+"</font>";
				}
			}
			else{
				if (zdyxmjqsfl!=0 && jqsfl!=0)
				{
					jqsflStr=cf.formatDouble(zdyxmjqsfl,"0.####")+"��"+cf.formatDouble(jqsfl,"0.####")+"��"+cf.formatDouble(cf.round((jqsfl+zdyxmjqsfl),4),"0.####");
				}
				else if (zdyxmjqsfl!=0 && jqsfl==0)
				{
					jqsflStr=cf.formatDouble(zdyxmjqsfl,"0.####")+"(�Զ���)";
				}
				else if (zdyxmjqsfl==0 && jqsfl!=0)
				{
					jqsflStr=cf.formatDouble(jqsfl,"0.####");
				}
			}
		}
		else{
			jqsflStr="&nbsp;";
		}

		if (cf.round((bsfl+zdyxmbsfl),4)!=0)
		{
			if (cf.round((bsfl+zdyxmbsfl),4)>bgjbz)
			{
				if (zdyxmbsfl!=0 && bsfl!=0)
				{
					bsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmbsfl,"0.####")+"��"+cf.formatDouble(bsfl,"0.####")+"��"+cf.formatDouble(cf.round((bsfl+zdyxmbsfl),4),"0.####")+"</font>";
				}
				else if (zdyxmbsfl!=0 && bsfl==0)
				{
					bsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmbsfl,"0.####")+"(�Զ���)</font>";
				}
				else if (zdyxmbsfl==0 && bsfl!=0)
				{
					bsflStr="<font color=\"#FF0000\">"+cf.formatDouble(bsfl,"0.####")+"</font>";
				}
			}
			else{
				if (zdyxmbsfl!=0 && bsfl!=0)
				{
					bsflStr=cf.formatDouble(zdyxmbsfl,"0.####")+"��"+cf.formatDouble(bsfl,"0.####")+"��"+cf.formatDouble(cf.round((bsfl+zdyxmbsfl),4),"0.####");
				}
				else if (zdyxmbsfl!=0 && bsfl==0)
				{
					bsflStr=cf.formatDouble(zdyxmbsfl,"0.####")+"(�Զ���)";
				}
				else if (zdyxmbsfl==0 && bsfl!=0)
				{
					bsflStr=cf.formatDouble(bsfl,"0.####");
				}
			}
		}
		else{
			bsflStr="&nbsp;";
		}


		if (cf.round((tvocsfl+zdyxmtvocsfl),4)!=0)
		{
			if (cf.round((tvocsfl+zdyxmtvocsfl),4)>tvocgjbz)
			{
				if (zdyxmtvocsfl!=0 && tvocsfl!=0)
				{
					tvocsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmtvocsfl,"0.####")+"��"+cf.formatDouble(tvocsfl,"0.####")+"��"+cf.formatDouble(cf.round((tvocsfl+zdyxmtvocsfl),4),"0.####")+"</font>";
				}
				else if (zdyxmtvocsfl!=0 && tvocsfl==0)
				{
					tvocsflStr="<font color=\"#FF0000\">"+cf.formatDouble(zdyxmtvocsfl,"0.####")+"(�Զ���)</font>";
				}
				else if (zdyxmtvocsfl==0 && tvocsfl!=0)
				{
					tvocsflStr="<font color=\"#FF0000\">"+cf.formatDouble(tvocsfl,"0.####")+"</font>";
				}
			}
			else{
				if (zdyxmtvocsfl!=0 && tvocsfl!=0)
				{
					tvocsflStr=cf.formatDouble(zdyxmtvocsfl,"0.####")+"��"+cf.formatDouble(tvocsfl,"0.####")+"��"+cf.formatDouble(cf.round((tvocsfl+zdyxmtvocsfl),4),"0.####");
				}
				else if (zdyxmtvocsfl!=0 && tvocsfl==0)
				{
					tvocsflStr=cf.formatDouble(zdyxmtvocsfl,"0.####")+"(�Զ���)";
				}
				else if (zdyxmtvocsfl==0 && tvocsfl!=0)
				{
					tvocsflStr=cf.formatDouble(tvocsfl,"0.####");
				}
			}
		}
		else{
			tvocsflStr="&nbsp;";
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
		<td><%=xuhao%></td>
		<td><A HREF="ViewHbzbXmbh.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&bjjb=<%=bjjb%>" target="_blank"><%=jgwzbm%></A></td>
		<td><%=fjmj%></td>
		<td><%=fjg%></td>
		<td><%=tj%></td>
		<td><%=jqgjbz%></td>
		<td><%=jqsflStr%></td>
		<td><%=bgjbz%></td>
		<td><%=bsflStr%></td>
		<td><%=tvocgjbz%></td>
		<td><%=tvocsflStr%></td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();

	if (alltj!=0)
	{
		alljq=cf.round(alljq/alltj,4);
		allb=cf.round(allb/alltj,4);
		alltvoc=cf.round(alltvoc/alltj,4);

		jqbfb=cf.round((jqgjbz-alljq)*100/jqgjbz,2);
		bbfb=cf.round((bgjbz-allb)*100/bgjbz,2);
		tvocbfb=cf.round((tvocgjbz-alltvoc)*100/tvocgjbz,2);
	}
	else{
		alljq=0;
		allb=0;
		alltvoc=0;
	}


	if (alljq!=0)
	{
		if (alljq>jqgjbz)
		{
			jqsflStr="<font color=\"#FF0000\">"+cf.formatDouble(alljq,"0.####")+"</font>";
		}
		else{
			jqsflStr=cf.formatDouble(alljq,"0.####");
		}
	}
	else{
		jqsflStr="&nbsp;";
	}

	if (allb!=0)
	{
		if (allb>bgjbz)
		{
			bsflStr="<font color=\"#FF0000\">"+cf.formatDouble(allb,"0.####")+"</font>";
		}
		else{
			bsflStr=cf.formatDouble(allb,"0.####");
		}
	}
	else{
		bsflStr="&nbsp;";
	}

	if (alltvoc!=0)
	{
		if (alltvoc>tvocgjbz)
		{
			tvocsflStr="<font color=\"#FF0000\">"+cf.formatDouble(alltvoc,"0.####")+"</font>";
		}
		else{
			tvocsflStr=cf.formatDouble(alltvoc,"0.####");
		}
	}
	else{
		tvocsflStr="&nbsp;";
	}


	%> 
	<tr bgcolor="<%=bgcolor%>" align="center"> 
	<td>&nbsp;</td>
	<td>���巿��</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(alltj,"0.####")%></td>
	<td><%=jqgjbz%></td>
	<td><%=jqsflStr%></td>
	<td><%=bgjbz%></td>
	<td><%=bsflStr%></td>
	<td><%=tvocgjbz%></td>
	<td><%=tvocsflStr%></td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
</table>

<BR>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px' >

  <tr bgcolor="#FFFFFF">
    <td width="28%"><div align="center"><strong>����Ԥ�������<br>
    �����巿�ݣ���</strong></div></td>
    <td width="72%"><table width="100%" border="0" style='FONT-SIZE: 14px'>
        <tr>
          <td width="34%"><strong>��ȩ�ͷ���Ϊ��<%=cf.formatDouble(alljq,"0.####")%>mg/m3,</strong></td>
          <td width="66%"><strong>���ڹ��꣺<%=cf.formatDouble(jqbfb,"0.##")%>%��</strong></td>
        </tr>
        <tr>
          <td><strong> ���� �� ��Ϊ��<%=cf.formatDouble(allb,"0.####")%>mg/m3,</strong></td>
          <td><strong>���ڹ��꣺<%=cf.formatDouble(bbfb,"0.##")%>%��</strong></td>
        </tr>
        <tr>
          <td><strong>TVOC�ͷ���Ϊ��<%=cf.formatDouble(alltvoc,"0.####")%>mg/m3,</strong></td>
          <td><strong>���ڹ��꣺<%=cf.formatDouble(tvocbfb,"0.##")%>%��</strong></td>
        </tr>
      </table></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="29" colspan="2"><div align="center"><strong>
<%
	if (jqbfb<0 || bbfb<0 || tvocbfb<0)
	{
		%>
		�󸮲����ڻ�����ơ�����װ�޷��롣
		<%
	}
	else {
		%>
		�����ڻ�����ơ�����װ�޷��롣
		<%
	}
%>
	</strong></div></td>
  </tr>
</table>
</body>
</html>



