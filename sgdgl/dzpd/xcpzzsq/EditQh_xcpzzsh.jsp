<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<%

String sqsj=null;
String tbr=null;
String zznr=null;
String sl=null;
String gg=null;
String xs=null;
String wznr=null;
String ysyq=null;
String qtyq=null;
String wcsj=null;
String jg=null;
String fyzj=null;
String yjwcsj=null;
String sjwcsj=null;
String scwjm=null;
String bz=null;
String zgbmjlyj=null;
String whereshbbh=cf.GB2Uni(request.getParameter("shbbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select dwbh,sqsj,tbr,zznr,sl,gg,xs,wznr,ysyq,qtyq,wcsj,jg,fyzj,yjwcsj,sjwcsj,bz,zgbmjlyj,scwjm ";
	ls_sql+=" from  qh_xcpzzsh";
	ls_sql+=" where  (shbbh='"+whereshbbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sqsj=cf.fillNull(rs.getDate("sqsj"));
		tbr=cf.fillNull(rs.getString("tbr"));
		zznr=cf.fillNull(rs.getString("zznr"));
		sl=cf.fillNull(rs.getString("sl"));
		gg=cf.fillNull(rs.getString("gg"));
		xs=cf.fillNull(rs.getString("xs"));
		wznr=cf.fillNull(rs.getString("wznr"));
		ysyq=cf.fillNull(rs.getString("ysyq"));
		qtyq=cf.fillNull(rs.getString("qtyq"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		jg=cf.fillNull(rs.getString("jg"));
		fyzj=cf.fillNull(rs.getString("fyzj"));
		yjwcsj=cf.fillNull(rs.getDate("yjwcsj"));
		sjwcsj=cf.fillNull(rs.getDate("sjwcsj"));
		bz=cf.fillNull(rs.getString("bz"));
		scwjm=cf.fillNull(rs.getString("scwjm"));
		zgbmjlyj=cf.fillNull(rs.getString("zgbmjlyj"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditQh_xcpzzsh.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���벿�ű��</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sqsj" size="20" maxlength="10"  value="<%=sqsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" size="20" maxlength="6"  value="<%=sl%>" >
              </td>
              <td width="15%"> 
                <div align="right">���ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=wcsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xs" size="20" maxlength="30"  value="<%=xs%>" >
              </td>
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" size="20" maxlength="30"  value="<%=gg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ɫҪ��</div>
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="ysyq" cols="81" rows="3"><%=ysyq%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">�������� 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="zznr" cols="81" rows="3"><%=zznr%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">�������� 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="wznr" cols="81" rows="4"><%=wznr%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">����Ҫ�� 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="qtyq" cols="81" rows="3"><%=qtyq%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ļ���</div>
              </td>
              <td width="85%" colspan="3"> 
                <input type="text" name="scwjm" size="81" maxlength="200"  value="<%=scwjm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <p align="right">���ܲ��ž������ 
              </td>
              <td width="85%" colspan="3"> 
                <textarea name="zgbmjlyj" cols="81" rows="2"><%=zgbmjlyj%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereshbbh"  value="<%=whereshbbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(editform)" name="button2">
                  <input type="button"  value="�ϴ����ļ�" onClick="f_do2(editform)" name="button">
                  <input type="reset"  value="����" name="reset">
                </div>
                <div align="center"> &nbsp;</div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[���벿�ű��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	
	if(	javaTrim(FormName.zznr)=="") {
		alert("������[��������]��");
		FormName.zznr.focus();
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.xs)=="") {
		alert("������[��ʽ]��");
		FormName.xs.focus();
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "���ʱ��"))) {
		return false;
	}
		
	
	FormName.submit();
	return true;
}
function f_do2(FormName)//����FormName:Form������
{

	FormName.action="loadFile.jsp";	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
