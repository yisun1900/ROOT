<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ͻ���ȯ�Ǽ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bz=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
int fwmj=0;
String kgzsm=null;
String clfStr=null;
String sgebfbStr=null;
String kgzbz=null;

double zqgczjf=0;
double zjxje=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kgzbz,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm,crm_khxx.bz";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,kgzsm,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		clf=rs.getDouble("clf");
		sgebfb=rs.getDouble("sgebfb");
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		fwmj=rs.getInt("fwmj");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillHtml(rs.getString("bz"));

	}
	rs.close();
	ps.close();


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(jlh,8,3)),0)";
	ls_sql+=" from  cw_khfqdj";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=khbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_khfqdj.jsp" name="insertform"  >
<div align="center">�ͻ���ȯ�Ǽ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��ȯ���</td>
	<td  width="10%">��ȯ����</td>
	<td  width="7%">��ȯ���</td>
	<td  width="7%">��Ч����</td>
	<td  width="7%">��¼��</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="6%">ʹ�ñ�־</td>
	<td  width="7%">ʹ�ü�¼��</td>
	<td  width="7%">ɾ��ʱ��</td>
	<td  width="27%">��ע</td>
</tr>
<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();

	ls_sql="SELECT fqbh,fqmc,fqje,yxrq,cw_khfqdj.jlh,cw_khfqdj.lrr,cw_khfqdj.lrsj, DECODE(sybz,'1','δ��','2','��ʹ��'),syjlh,scsj,cw_khfqdj.bz  ";
	ls_sql+=" FROM cw_khfqdj ";
    ls_sql+=" where cw_khfqdj.khbh='"+khbh+"'";
    ls_sql+=" order by cw_khfqdj.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_khfqdjCxList.jsp","","","");
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF">���ۼ���</td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ע</font></td>
    <td colspan="3" bgcolor="#FFFFFF"><%=bz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">��¼��</font></td> 
  <td width="32%"> 
    <input type="text" name="jlh" value="<%=jlh%>" size="20" maxlength="10" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">�ͻ����</font></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��ȯ����</td> 
  <td width="32%"> 
    <select name="fqmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="���ĵ���ȯ">���ĵ���ȯ</option>
    </select>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>��ȯ���</td> 
  <td width="32%"> 
    <input type="text" name="fqbh" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��ȯ���</td> 
  <td width="32%"> 
    <input type="text" name="fqje" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">��Ч����</td> 
  <td width="32%"> 
    <input type="text" name="yxrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jlh)=="") {
		alert("������[��¼��]��");
		FormName.jlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fqmc)=="") {
		alert("��ѡ��[��ȯ����]��");
		FormName.fqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fqbh)=="") {
		alert("������[��ȯ���]��");
		FormName.fqbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fqje)=="") {
		alert("������[��ȯ���]��");
		FormName.fqje.focus();
		return false;
	}
	if(!(isFloat(FormName.fqje, "��ȯ���"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxrq, "��Ч����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
