<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbjjbbm=null;
String khsjsfycx=null;
String bjjbbm=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

String bjbbh=null;
String bjbbhm=null;
String ssfgs=null;
String dqbm=null;

int sjslmax=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjjbbm,sjsfycx,khbjjbbm";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		khsjsfycx=cf.fillNull(rs.getString("sjsfycx"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
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

	//�����ײ�������������
	ls_sql="select sl";
	ls_sql+=" from  bj_tcsjslxz";
	ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjslmax=rs.getInt("sl");
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
  <td width="19%">ѡ���Ż�</td>
  <td width="9%">�����󼶱�</td>
  <td width="9%">������λ</td>
  <td width="9%">�������</td>
  <td width="14%">�����Ƿ��д���</td>
  <td width="9%">������ʼʱ��</td>
  <td width="9%" >��������ʱ��</td>
  <td width="9%">�����������</td>
</tr>

<%
	String bjjbbm1=null;
	String bjjbmc=null;
	String jldw=null;
	double sjcj=0;
	String sjsfycx=null;
	String sjsfycxmc=null;
	String cxkssj=null;
	String cxjssj=null;
	double cxsjcj=0;
	ls_sql="SELECT bjjbbm1,bjjbmc,jldw,sjcj,sjsfycx,DECODE(sjsfycx,'1','�޴���','2','<font color=\"#FF0000\">�д���</font>','3','<font color=\"#0000FF\">�����ƴ���</font>') sjsfycxmc,cxkssj,cxjssj,cxsjcj";
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
		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));//�����Ƿ��д���  1���޴�����2�����������ƴ�����3�����������ƴ��� 
		sjsfycxmc=cf.fillNull(rs.getString("sjsfycxmc"));

		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxsjcj=rs.getDouble("cxsjcj");

		if (sjsfycx.equals("2") || sjsfycx.equals("3"))//�ж��Ƿ����
		{
			if (cxkssj.compareTo(cf.today())>0)//δ��ʼ
			{
				sjsfycx="1";
				sjsfycxmc="�޴���";
				cxkssj="";
				cxjssj="";
				cxsjcj=0;
			}

			if (cxjssj.compareTo(cf.today())<0)//�ѽ���
			{
				sjsfycx="1";
				sjsfycxmc="�޴���";
				cxkssj="";
				cxjssj="";
				cxsjcj=0;
			}
		}


		String cxsjcjStr="";
		if (cxsjcj!=0)
		{
			cxsjcjStr=cxsjcj+"";
		}

		String jbmark="";
		String slmark="";
		String noslmark="";
		if (bjjbbm1.equals(bjjbbm))
		{
			jbmark="checked";

			if (khsjsfycx.equals("3"))//1���޴�����2�����������ƴ�����3�����������ƴ���
			{
				slmark="checked";
				noslmark="";
			}
			else{
				slmark="";
				noslmark="checked";
			}
		}

		%>
		<tr bgcolor="#FFFFFF" align="center">
		  <td align="left">
			<%
			if (sjsfycx.equals("3"))//1���޴�����2�����������ƴ�����3�����������ƴ���
			{
				%>
				<input type="radio" <%=jbmark%> name="bjjbbm" value="<%=bjjbbm1%>" onClick="alert('���ѣ����������ɴ��ۣ������ͬʱ��[<%=sjslmax%>��]�����������ۿۣ����Ҳ�ѡ���������Ƿ����')">������<%=bjjbmc%>
				<%
			}
			else{
				%>
				<input type="radio" <%=jbmark%> name="bjjbbm" value="<%=bjjbbm1%>" onClick='f_noch(editform)'>������<%=bjjbmc%>
				<%
			}
			%>
		  </td>
		  <td align="left">
 			
			<%

			if (sjsfycx.equals("3"))//1���޴�����2�����������ƴ�����3�����������ƴ���
			{
				%>
				<input type="radio" name="sjsfycx" <%=slmark%> value="<%=bjjbbm1%>">ѡ������ۣ�<%=cxsjcj%>
				<BR>
				<input type="radio" name="sjsfycx" <%=noslmark%> value="">ѡ�������ۣ�<%=sjcj%>
				<%
			}
			else if (sjsfycx.equals("2"))//1���޴�����2�����������ƴ�����3�����������ƴ���
			{
				%>
				�����Żݼ�:<%=cxsjcj%>
				<%
			}
			else if (sjsfycx.equals("1"))
			{
				%>
				���Ż�,������:<%=sjcj%>
				<%
			}

			%>
			
			</td>
		  <td><%=bjjbmc%></td>
		  <td><%=jldw%></td>
		  <td><%=sjcj%></td>
		  <td><%=sjsfycxmc%></td>
		  <td><%=cxkssj%></td>
		  <td><%=cxjssj%></td>
		  <td><%=cxsjcjStr%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>



    <tr> 
      <td colspan="8" align="center" >
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
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

function f_noch(FormName)//����FormName:Form������
{
	if (FormName.sjsfycx!=null)
	{
		for (var i=0;i<FormName.sjsfycx.length ;i++ )
		{
			FormName.sjsfycx[i].checked=false;
		}
	}
 }

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
