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
String shjl=null;
String shr=null;
String shsj=null;
String shsm=null;

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
	ls_sql="select dqbm,ssfgs,xsdlx,xszsl,xszje,sklx,sfqk,shfmc,shrlxfs,shfdz,xsy,xsrq,xsdzt,nian,lrr,lrsj,bz,shbm,shjl,shr,shsj,shsm ";
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
		shjl=cf.fillNull(rs.getString("shjl"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));
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
<title>���۵������ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">���۵������ά�����������ţ�<%=xsph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">���۵�����</span></td> 
  <td width="32%"> 
<%
	cf.selectItem(out,"select xsdlx,xsdlxmc from dm_xsdlx order by xsdlx",xsdlx,true);
%>    </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�����ֹ�˾</span></td>
  <td>
    <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>  </td>
  <td align="right"><span class="STYLE2">�ջ�����</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh",shbm,true);
%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�տ�����</span></td>
  <td>
    <%
	cf.selectToken(out,"1+�ֽ�&2+ת��&3+֧Ʊ&9+����",sklx,true);
%> </td>
  <td align="right"><span class="STYLE2">�Ƿ�ȫ��</span></td>
  <td><%
	cf.radioToken(out,"1+ȫ��&2+���ֿ�&3+δ����",sfqk,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ջ�������</span></td>
  <td colspan="3"><%=shfmc%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ջ�����ϵ��ʽ</span></td>
  <td colspan="3"><%=shrlxfs%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ջ�����ַ</span></td>
  <td colspan="3"><%=shfdz%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">����Ա</span></td> 
  <td width="32%"><%=xsy%> </td>
  <td align="right" width="18%"><span class="STYLE2">��������</span></td> 
  <td width="32%"><%=xsrq%> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">¼����</span></td>
  <td><%=lrr%></td><td align="right"><font color="#0000CC">¼��ʱ��</font></td>
    <td><%=lrsj%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">¼�벿��</span></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">��ע</span></td>
  <td colspan="3"><%=bz%>  </td></tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFF99">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��˽���</td>
  <td><%
	cf.radioToken(out, "shjl","Y+ͬ��&N+��ͬ��",shjl);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����</span></td>
  <td><input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" >  </td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">���ʱ��</span></td>
  <td><input type="text" name="shsj" size="20" maxlength="10"  value="<%=shsj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���˵��</td>
  <td colspan="3"><textarea name="shsm" cols="72" rows="3"><%=shsm%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="xsph"  value="<%=xsph%>" >
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input name="button" type="button" onClick="window.open('ViewJxc_fcxsd.jsp?xsph=<%=xsph%>')"  value="�鿴��ϸ">
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
	if(	!radioChecked(FormName.shjl)) {
		alert("��ѡ��[��˽���]��");
		FormName.shjl[0].focus();
		return false;
	}
	if (FormName.shjl[1].checked)
	{
		if(	javaTrim(FormName.shsm)=="") {
			alert("������[���˵��]��");
			FormName.shsm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}


	FormName.action="SaveXgShJxc_fcxsd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
