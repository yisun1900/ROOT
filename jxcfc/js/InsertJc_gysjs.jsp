<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] ckph=request.getParameterValues("ckph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
double cbzj=0;
double ycfzj=0;
double qtfzj=0;
double qtycf=0;
String gys=null;
String ppbm=null;
String ssfgs=request.getParameter("ssfgs");

try {
	conn=cf.getConnection();

	int ddgyssl=0;
	ls_sql =" select count(distinct gysmc)";
	ls_sql+=" from jxc_ckmx";
	ls_sql+=" where "+cf.arrayToInSQL(ckph,"ckph");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddgyssl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddgyssl>1)
	{
		out.println("���󣡲���ͬһ��Ӧ�̶���");
		return;
	}

	int ddppsl=0;
	ls_sql =" select count(distinct ppmc)";
	ls_sql+=" from jxc_ckmx";
	ls_sql+=" where "+cf.arrayToInSQL(ckph,"ckph");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ddppsl=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();
	if (ddppsl>1)
	{
		out.println("���󣡲���ͬһƷ��");
		return;
	}

	ls_sql =" select distinct gysmc,ppmc";
	ls_sql+=" from jxc_ckmx";
	ls_sql+=" where rownum<2 and "+cf.arrayToInSQL(ckph,"ckph");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		gys=rs1.getString(1);
		ppbm=rs1.getString(2);
	}
	rs1.close();
	ps1.close();



	
	ls_sql =" select sum(ckzcb) ";
	ls_sql+=" from jxc_ckd";
	ls_sql+=" where "+cf.arrayToInSQL(ckph,"ckph");
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		cbzj=rs1.getDouble(1);
	}
	rs1.close();
	ps1.close();

%>


<CENTER >
  <B><font size="3">���ĳ��̽���</font></B>
</CENTER>

<form method="post" action="" name="editform" >
<div align="center">���ĳ��̽��㣨��Ӧ�̣�<%=gys%>��Ʒ�ƣ�<%=ppbm%>��</div> 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">������˾</font></td>
      <td bgcolor="#FFFFFF">
		
		<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
      </select></td>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font><font color="#0000CC">������</font> </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jsr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="18%" align="right" bgcolor="#FFFFFF"> <font color="#FF0000">*</font>����ʱ�� </td>
      <td width="32%" bgcolor="#FFFFFF"><input type="text" name="jssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">���ϳɱ�</font></td>
      <td><input type="text" name="cbzj" value="<%=cbzj%>" size="20" maxlength="20" readonly/></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font>�۳�����</td>
      <td><input type="text" name="kcfy" value="0" size="20" maxlength="20" onChange="f_jsjg(editform)"/></td>
      <td align="right"><font color="#FF0000">*</font><font color="#0000CC">������</font></td>
      <td><input type="text" name="jsje" value="<%=cf.round(cbzj+ycfzj+qtfzj,2)%>" size="20" maxlength="20" readonly/></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFFF">����˵��</td>
      <td colspan="3"><textarea name="jssm" cols="71" rows="3"></textarea></td>
    </tr>
    <tr> 
      <td colspan="4" align="center">
<%
	for (int i=0;i<ckph.length ;i++ )
	{
		%>
          <input type="hidden" name="ckph"  value="<%=ckph[i]%>" >
		<%
	}
%>
			<input type="hidden" name="gys"  value="<%=gys%>" >          
			<input type="hidden" name="ppbm"  value="<%=ppbm%>" >          
			<input type="button"  value="����" onClick="f_do(editform)" name="button">
			<input type="reset"  value="����" name="reset"></td>
    </tr>
  </table>
</form>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="6%">�ͻ�����</td>
    <td  width="14%">��ַ</td>
    <td  width="8%">��������</td>
    <td  width="7%">����ʱ��</td>
    <td  width="16%">��������</td>
    <td  width="12%">���</td>
    <td  width="12%">�ͺ�</td>
    <td  width="5%">��λ</td>
    <td  width="6%">����</td>
    <td  width="6%">����</td>
    <td  width="8%">�����ܼ�</td>
  </tr>
  <%

	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String getckph=null;
	String getcksj=null;
	int row=0;
	double zjsl=0;
	double zjje=0;
	double zjycf=0;
	double zjqtfy=0;
	double zjcxhdje=0;

	ls_sql =" select distinct jxc_clpsd.khbh,khxm,fwdz,jxc_ckd.ckph,jxc_ckd.cksj";
	ls_sql+=" from jxc_ckd,jxc_clpsd,crm_khxx";
	ls_sql+=" where jxc_ckd.lydh=jxc_clpsd.psph " ;
	ls_sql+=" and jxc_clpsd.khbh=crm_khxx.khbh" ;
	ls_sql+=" and "+cf.arrayToInSQL(ckph,"jxc_ckd.ckph");
    ls_sql+=" order by jxc_clpsd.khbh,jxc_ckd.ckph";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=cf.fillNull(rs1.getString("khbh"));
		khxm=cf.fillNull(rs1.getString("khxm"));
		fwdz=cf.fillNull(rs1.getString("fwdz"));
		getckph=cf.fillNull(rs1.getString("ckph"));
		getcksj=cf.fillNull(rs1.getDate("cksj"));

		
		int count=0;
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM jxc_ckmx ";
		ls_sql+=" where ckph='"+getckph+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		String clmc=null;
		String gg=null;
		String xh=null;
		String jldwbm=null;
		double cksl=0;
		double cbdj=0;
		double je=0;
		double ycf=0;
		double qtfy=0;
		String cxhdbl=null;
		double cxhdje=0;
		String bz=null;

		double xjsl=0;
		double xjje=0;
		double xjycf=0;
		double xjqtfy=0;
		double xjcxhdje=0;

//		String getckph=null;


		ls_sql =" SELECT clmc,gg,xh,jldwbm,cksl,cbdj,ROUND(NVL(cbdj*cksl,0),2) je ";
		ls_sql+=" FROM jxc_ckmx ";
		ls_sql+=" where ckph='"+getckph+"'";
		ls_sql+=" order by clmc,xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clmc=cf.fillHtml(rs.getString("clmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xh=cf.fillHtml(rs.getString("xh"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			cksl=rs.getDouble("cksl");
			cbdj=rs.getDouble("cbdj");
			je=rs.getDouble("je");


			xjsl+=cksl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;


			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td rowspan="<%=count%>"><%=khxm%></td>
				<td  rowspan="<%=count%>"><%=fwdz%></td>
				<td><A HREF="/jxcfc/ckgl/ViewCwCldJxc_ckd.jsp?ckph=<%=getckph%>" target="_blank"><%=getckph%></A></td>
				<td><%=getcksj%></td>
				<td><%=clmc%></td>
				<td ><%=gg%></td>
				<td ><%=xh%></td>
				<td ><%=jldwbm%></td>
				<td ><%=cksl%></td>
				<td ><%=cbdj%></td>
				<td ><%=je%></td>
			  </tr>
			  <%
		}

		while (rs.next())//��ʾͬһ�ͻ����¶���
		{
			clmc=cf.fillHtml(rs.getString("clmc"));
			gg=cf.fillHtml(rs.getString("gg"));
			xh=cf.fillHtml(rs.getString("xh"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			cksl=rs.getDouble("cksl");
			cbdj=rs.getDouble("cbdj");
			je=rs.getDouble("je");

			xjsl+=cksl;
			xjje+=je;
			xjycf+=ycf;
			xjqtfy+=qtfy;
			xjcxhdje+=cxhdje;

			row++;

			%> 
			  <tr bgcolor="#FFFFFF"  align="center"> 
				<td><A HREF="/jxcfc/ckgl/ViewCwCldJxc_ckd.jsp?ckph=<%=getckph%>" target="_blank"><%=getckph%></A></td>
				<td><%=getcksj%></td>
				<td ><%=clmc%></td>
				<td ><%=gg%></td>
				<td ><%=xh%></td>
				<td ><%=jldwbm%></td>
				<td ><%=cksl%></td>
				<td ><%=cbdj%></td>
				<td ><%=je%></td>
			  </tr>
			  <%
		}
		rs.close();
		ps.close();
		

		zjsl+=xjsl;
		zjje+=xjje;
		zjycf+=xjycf;
		zjqtfy+=xjqtfy;
		zjcxhdje+=xjcxhdje;

		zjsl=cf.round(zjsl,2);
		zjje=cf.round(zjje,2);
		zjycf=cf.round(zjycf,2);
		zjqtfy=cf.round(zjqtfy,2);
		zjcxhdje=cf.round(zjcxhdje,2);
		
		
		%> 
		  <tr bgcolor="#E8E8FF"  align="center" height="22"> 
			<td colspan="8"><font size="2"><b>[<%=khxm%>]С�� </b></font></td>
			<td><%=cf.formatDouble(xjsl)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(xjje)%></td>
		  </tr>
		  <%
	}
	rs1.close();
	ps1.close();

	
	%> 
	  <tr bgcolor="#E8E8FF"  align="center" height="32"> 
		<td colspan="8"><font size="3"><b>�ܼ�</b></font></td>
		<td><%=cf.formatDouble(zjsl)%></td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(zjje)%></td>
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


</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//����FormName:Form������
{
	var jsje=FormName.cbzj.value*1.0-FormName.kcfy.value*1.0;
	jsje=round(jsje,2);

	FormName.jsje.value=jsje;

}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	javaTrim(FormName.jsr)=="") {
		alert("��ѡ��[������]��");
		FormName.jsr.focus();
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kcfy)=="") {
		alert("��ѡ��[�۳�����]��");
		FormName.kcfy.focus();
		return false;
	}
	if(!(isFloat(FormName.kcfy, "�۳�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("��ѡ��[������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "������"))) {
		return false;
	}

	FormName.action="SaveInsertJc_gysjs.jsp";
	FormName.submit();
	return true;
}
function f_szbz(FormName)//����FormName:Form������
{
	FormName.action="chooseJs.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
