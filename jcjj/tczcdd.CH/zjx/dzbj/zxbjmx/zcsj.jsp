<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbjjbbm=null;
String bjjbbm=null;

String bjjbbmQ=null;
String khsjsfycxmcQ=null;
double khsjcjQ=0;

String zjxxh=request.getParameter("zjxxh");
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String bjbbh=null;
String bjbbhm=null;
String ssfgs=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();


	ls_sql="select bjjbbm,khbjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjbbm,DECODE(sjsfycx,'1','�޴���','2','<font color=\"#FF0000\">�д���</font>','3','<font color=\"#0000FF\">�����ƴ���</font>') sjsfycxmc,sjcj";
	ls_sql+=" from  bj_khzcxmxjq";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbmQ=cf.fillNull(rs.getString("bjjbbm"));
		khsjsfycxmcQ=cf.fillNull(rs.getString("sjsfycxmc"));
		khsjcjQ=rs.getDouble("sjcj");
	}
	rs.close();
	ps.close();

	ls_sql="select bjbbh,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();



%>

<html>
<head>
<title>������Ŀ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<form method="post" action="SaveZcsj.jsp" name="editform">
<div align="center">
  ������Ŀ����
	<BR>
	<BR>
  <font color="#FF0000">*</font><font color="#0000CC">ԭ����</font>
      <select name="khbjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+khbjjbbm+"'",khbjjbbm);
%>
        </select>
</div>
	<BR>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center" bgcolor="#E8E8FF">
  <td width="13%">ѡ������</td>
  <td width="9%">�����󼶱�</td>
  <td width="9%">������λ</td>
  <td width="9%">�������</td>
  <td width="14%">�����Ƿ��д���</td>
</tr>

<%
	String bjjbbm1=null;
	String bjjbmc=null;
	String jldw=null;
	double sjcj=0;
	String sjsfycx=null;
	String sjsfycxmc=null;

	ls_sql="SELECT bjjbbm1,bjjbmc,jldw,sjcj";
	ls_sql+=" FROM bj_tcsjcjb,bdm_bjjbbm";
	ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bj_tcsjcjb.bjjbbm='"+khbjjbbm+"' and bj_tcsjcjb.tcsjflbm='"+tcsjflbm+"'";
	ls_sql+=" and bj_tcsjcjb.bjjbbm1=bdm_bjjbbm.bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbbm1=cf.fillNull(rs.getString("bjjbbm1"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=rs.getDouble("sjcj");

		//ȡ����������Ϣ
		int htsjbz=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and bjjbbm='"+bjjbbm1+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			htsjbz=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (htsjbz>0)
		{
			ls_sql="select sjcj,DECODE(sjsfycx,'1','�޴���','2','���������ƴ���','3','���������ƴ���') sjsfycxmc";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and bjjbbm='"+bjjbbm1+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sjcj=rs1.getDouble("sjcj");
				sjsfycxmc=cf.fillNull(rs1.getString("sjsfycxmc"));
			}
			rs1.close();
			ps1.close();
		}
		else{
			if (bjjbbm1.equals(bjjbbmQ))//����ǰ�ͻ�ѡ���˴�������������ԭ�۸�
			{
				sjcj=khsjcjQ;
				sjsfycxmc=khsjsfycxmcQ;
			}
			else{
				sjsfycxmc="�޴���";
			}
		}




		String jbmark="";

		if (bjjbbm1.equals(bjjbbm))//�ͻ�ѡ���˴�������
		{
			jbmark="checked";
		}


		%>
		<tr bgcolor="#FFFFFF" align="center">
		  <td align="left">
			<input type="radio" <%=jbmark%> name="bjjbbm" value="<%=bjjbbm1%>" >������<%=bjjbmc%>
		  </td>

		  <td><%=bjjbmc%></td>
		  <td><%=jldw%></td>
		  <td><%=sjcj%></td>
		  <td><%=sjsfycxmc%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>



    <tr> 
      <td colspan="8" align="center" >
		<input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input type="hidden" name="tcsjflbm"  value="<%=tcsjflbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">	</td>
    </tr>
  </table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if (FormName.bjjbbm.length==null)
	{
		if(	!FormName.bjjbbm.checked) {
			alert("������[��������һ��]��");
			FormName.bjjbbm.focus();
			return false;
		}
	}
	else{
		if(	!radioChecked(FormName.bjjbbm)) {
			alert("��ѡ��[��������һ��]��");
			FormName.bjjbbm[0].focus();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
