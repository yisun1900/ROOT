<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String dwbh=null;
String fgsbh=null;
String slr=null;
String jhlqrq=null;
String lrr=null;
String lrrq=null;
String sfxsp=null;
String bz=null;

String yjspr=null;
String yjspsj=null;
String yjspjl=null;
String yjspsm=null;

String sjspr=null;
String sjspsj=null;
String sjspjl=null;
String sjspsm=null;

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,fgsbh,slr,jhlqrq,lrr,lrrq,sfxsp,bz,yjspr,yjspsj,yjspjl,yjspsm,sjspr,sjspsj,sjspjl,sjspsm ";
	ls_sql+=" from  oa_xcplqsq";
	ls_sql+=" where  (sqxh="+sqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		slr=cf.fillNull(rs.getString("slr"));
		jhlqrq=cf.fillNull(rs.getDate("jhlqrq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrrq=cf.fillNull(rs.getDate("lrrq"));
		sfxsp=cf.fillNull(rs.getString("sfxsp"));
		bz=cf.fillNull(rs.getString("bz"));

		yjspr=cf.fillNull(rs.getString("yjspr"));
		yjspsj=cf.fillNull(rs.getDate("yjspsj"));
		yjspjl=cf.fillNull(rs.getString("yjspjl"));
		yjspsm=cf.fillNull(rs.getString("yjspsm"));

		sjspr=cf.fillNull(rs.getString("sjspr"));
		sjspsj=cf.fillNull(rs.getDate("sjspsj"));
		sjspjl=cf.fillNull(rs.getString("sjspjl"));
		sjspsm=cf.fillNull(rs.getString("sjspsm"));
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
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" >
  <div align="center">ӡˢƷ��ȡ����---��������</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">ӡˢƷ����</td>
	<td  width="8%">�Ƿ�������</td>
	<td  width="20%">ӡˢƷ����</td>
	<td  width="20%">ӡˢƷ����</td>
	<td  width="8%">������λ</td>
	<td  width="8%">����</td>
	<td  width="8%">�ƻ���ȡ����</td>
	<td  width="8%">ʵ��ȡ����</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT oa_xcplqmx.xcpbm,DECODE(sfxsp,'N','����Ҫ','Y','��Ҫ'),oa_xcplqmx.xcpmc,oa_xcpflbm.xcpflmc,oa_xcplqmx.jldw,TO_CHAR(oa_xcplqmx.dj),oa_xcplqmx.jhlqsl,oa_xcplqmx.slqsl  ";
	ls_sql+=" FROM oa_xcpflbm,oa_xcplqmx  ";
    ls_sql+=" where oa_xcplqmx.xcpflbm=oa_xcpflbm.xcpflbm(+)";
    ls_sql+=" and oa_xcplqmx.sqxh="+sqxh;
    ls_sql+=" order by oa_xcplqmx.xcpbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();


%>
</table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">���쵥λ</font></td>
      <td width="33%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ",dwbh,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">����ֹ�˾</font></td>
      <td width="33%"> <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"' ",fgsbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">������</font></td>
      <td width="33%"> <%=slr%> </td>
      <td align="right" width="17%"><font color="#0000CC">�ƻ���ȡ����</font></td>
      <td width="33%"> <%=jhlqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">¼����</font></td>
      <td width="33%"> <%=lrr%> </td>
      <td align="right" width="17%"><font color="#0000CC">¼������</font></td>
      <td width="33%"> <%=lrrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">�Ƿ�������</font></td>
      <td width="33%"><%
	cf.radioToken(out,"N+����Ҫ&Y+��Ҫ",sfxsp,true);
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��ע</font></td>
      <td colspan="3"> <%=bz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">һ��������</font></td>
      <td width="33%"> <%=yjspr%> </td>
      <td align="right" width="17%"><font color="#0000CC">һ������ʱ��</font></td>
      <td width="33%"> <%=yjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">һ����������</font></td>
      <td width="33%"><%
	cf.radioToken(out,"1+ͬ��&2+�����ϼ�&3+����",yjspjl,true);
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">һ������˵��</font></td>
      <td colspan="3"> <%=yjspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">����������</font></td>
      <td width="33%"> <%=sjspr%> </td>
      <td align="right" width="17%"><font color="#0000CC">��������ʱ��</font></td>
      <td width="33%"> <%=sjspsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">������������</font></td>
      <td width="33%"><%
	cf.radioToken(out,"1+ͬ��&2+�����ϼ�&3+����",sjspjl,true);
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��������˵��</font></td>
      <td colspan="3"> <%=sjspsm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0033">*</font>������</td>
      <td width="33%"> 
        <input type="text" name="ejspr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0033">*</font>����ʱ��</td>
      <td width="33%"> 
        <input type="text" name="ejspsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0033">*</font>��������</td>
      <td width="33%"><%
	cf.radioToken(out, "ejspjl","1+ͬ��&2+�����ϼ�&3+����","");
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����˵��</td>
      <td colspan="3"> 
        <textarea name="ejspsm" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="button"  value="�������" onClick="f_do(editform)">
        </div>
      </td>
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
	if(	javaTrim(FormName.sqxh)=="") {
		alert("������[�������]��");
		FormName.sqxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ejspr)=="") {
		alert("������[������]��");
		FormName.ejspr.focus();
		return false;
	}
	if(	javaTrim(FormName.ejspsj)=="") {
		alert("������[����ʱ��]��");
		FormName.ejspsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ejspsj, "����ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.ejspjl)) {
		alert("��ѡ��[��������]��");
		FormName.ejspjl[0].focus();
		return false;
	}

	FormName.action="SaveEsOa_xcplqsq.jsp"
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
