<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String dqbm=null;
String ssfgs=null;
String xsdlx=null;
String xszsl=null;
String xszje=null;
String sklx=null;
String sfqk=null;
String shfmc=null;
String shrlxfs=null;
String shfdz=null;
String xsy=null;
String xsrq=null;
String xsdzt=null;
String nian=null;
String lrr=null;
String lrsj=null;
String shbm=null;

String bz=null;
String xsph=cf.GB2Uni(request.getParameter("xsph"));

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dqbm,ssfgs,xsdlx,xszsl,xszje,sklx,sfqk,shfmc,shrlxfs,shfdz,xsy,xsrq,xsdzt,nian,lrr,lrsj,bz,shbm ";
	ls_sql+=" from  jxc_fcxsd";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		xsdlx=cf.fillNull(rs.getString("xsdlx"));
		xszsl=cf.fillNull(rs.getString("xszsl"));
		xszje=cf.fillNull(rs.getString("xszje"));
		sklx=cf.fillNull(rs.getString("sklx"));
		sfqk=cf.fillNull(rs.getString("sfqk"));
		shfmc=cf.fillNull(rs.getString("shfmc"));
		shrlxfs=cf.fillNull(rs.getString("shrlxfs"));
		shfdz=cf.fillNull(rs.getString("shfdz"));
		xsy=cf.fillNull(rs.getString("xsy"));
		xsrq=cf.fillNull(rs.getDate("xsrq"));
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
		nian=cf.fillNull(rs.getString("nian"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		shbm=cf.fillNull(rs.getString("shbm"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">���޸Ĺ������˻������������ţ�<%=xsph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������˻�������</td> 
  <td width="32%"> 
    <select name="xsdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx where xsdlx='6' order by xsdlx",xsdlx);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����ֹ�˾</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right">�ջ�����</td>
  <td><select name="shbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",shbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�տ�����</td>
  <td><select name="sklx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+�ֽ�&2+ת��&3+֧Ʊ&9+����",sklx);
%>
  </select></td>
  <td align="right">�Ƿ�ȫ��</td>
  <td><%
	cf.radioToken(out, "sfqk","1+ȫ��&2+���ֿ�&3+δ����",sfqk);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">������</span></td>
  <td colspan="3"><input type="text" name="shfmc" size="73" maxlength="50"  value="<%=shfmc%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ջ�����ϵ��ʽ</td>
  <td colspan="3"><input type="text" name="shrlxfs" size="73" maxlength="50"  value="<%=shrlxfs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ջ�����ַ</td>
  <td colspan="3"><input type="text" name="shfdz" size="73" maxlength="100"  value="<%=shfdz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����Ա</td> 
  <td width="32%"> 
    <input type="text" name="xsy" size="20" maxlength="50"  value="<%=xsy%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="xsrq" size="20" maxlength="10"  value="<%=xsrq%>" onDblClick="JSCalendar(this)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><font color="#0000CC">¼�벿��</font></td>
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
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="xsph"  value="<%=xsph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input type="button"  value="���ò���¼��" onClick="f_pllr(insertform)" >
      <input type="button"  value="ѡ��¼��" onClick="f_cklr(insertform)" >
      <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)"  >
      <input type="button"  value=" �� �� " onClick="f_tj(insertform)" >
      <input name="button" type="button" onClick="f_print(insertform)"  value="��ӡ" >
      <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}
	if(	javaTrim(FormName.xsdlx)=="") {
		alert("��ѡ��[�������˻�������]��");
		FormName.xsdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if (FormName.xsdlx.value=="5")//5���ڲ�ʹ��
	{
		if(	javaTrim(FormName.shbm)=="") {
			alert("��ѡ��[�ջ�����]��");
			FormName.shbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.xsrq)=="") {
		alert("������[��������]��");
		FormName.xsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xsrq, "��������"))) {
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

	FormName.action="SaveEditJxc_fcxsd.jsp";
	FormName.submit();
	return true;
}

function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="PlInsertJxc_clbm.jsp";
	FormName.submit();
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="tjxsd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xsph)=="") {
		alert("������[��������]��");
		FormName.xsph.focus();
		return false;
	}

	FormName.action="/jxcdy/dyxsd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
