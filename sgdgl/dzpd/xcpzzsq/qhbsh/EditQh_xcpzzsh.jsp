<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%

String qh_xcpzzsh_shbbh=null;
String qh_xcpzzsh_sqsj=null;
String qh_xcpzzsh_tbr=null;
String qh_xcpzzsh_zznr=null;
String qh_xcpzzsh_sl=null;
String qh_xcpzzsh_gg=null;
String qh_xcpzzsh_xs=null;
String qh_xcpzzsh_wznr=null;
String qh_xcpzzsh_ysyq=null;
String qh_xcpzzsh_qtyq=null;
String qh_xcpzzsh_wcsj=null;
String qh_xcpzzsh_qhbshsj=null;
String qh_xcpzzsh_qhbshr=null;
String qh_xcpzzsh_jg=null;
String qh_xcpzzsh_fyzj=null;
String qh_xcpzzsh_yjwcsj=null;
String qh_xcpzzsh_sjwcsj=null;
String qh_xcpzzsh_qhbshyj=null;
String qh_xcpzzsh_shdwbh=null;
String qh_xcpzzsh_bz=null;
String sq_dwxx_dwmc=null;
String qh_xcpzzsh_zgbmjlyj=null;
String qh_xcpzzsh_zjlyj=null;
String whereqh_xcpzzsh_shbbh=null;
whereqh_xcpzzsh_shbbh=cf.GB2Uni(request.getParameter("shbbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select qh_xcpzzsh.shbbh as qh_xcpzzsh_shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.tbr as qh_xcpzzsh_tbr,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.qhbshsj as qh_xcpzzsh_qhbshsj,qh_xcpzzsh.qhbshr as qh_xcpzzsh_qhbshr,qh_xcpzzsh.jg as qh_xcpzzsh_jg,qh_xcpzzsh.fyzj as qh_xcpzzsh_fyzj,qh_xcpzzsh.yjwcsj as qh_xcpzzsh_yjwcsj,qh_xcpzzsh.sjwcsj as qh_xcpzzsh_sjwcsj,qh_xcpzzsh.qhbshyj as qh_xcpzzsh_qhbshyj,qh_xcpzzsh.shdwbh as qh_xcpzzsh_shdwbh,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj,qh_xcpzzsh.zjlyj as qh_xcpzzsh_zjlyj ";
	ls_sql+=" from  qh_xcpzzsh,sq_dwxx";
	ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh and  (qh_xcpzzsh.shbbh='"+whereqh_xcpzzsh_shbbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qh_xcpzzsh_shbbh=cf.fillNull(rs.getString("qh_xcpzzsh_shbbh"));
		qh_xcpzzsh_sqsj=cf.fillNull(rs.getDate("qh_xcpzzsh_sqsj"));
		qh_xcpzzsh_tbr=cf.fillNull(rs.getString("qh_xcpzzsh_tbr"));
		qh_xcpzzsh_zznr=cf.fillNull(rs.getString("qh_xcpzzsh_zznr"));
		qh_xcpzzsh_sl=cf.fillNull(rs.getString("qh_xcpzzsh_sl"));
		qh_xcpzzsh_gg=cf.fillNull(rs.getString("qh_xcpzzsh_gg"));
		qh_xcpzzsh_xs=cf.fillNull(rs.getString("qh_xcpzzsh_xs"));
		qh_xcpzzsh_wznr=cf.fillNull(rs.getString("qh_xcpzzsh_wznr"));
		qh_xcpzzsh_ysyq=cf.fillNull(rs.getString("qh_xcpzzsh_ysyq"));
		qh_xcpzzsh_qtyq=cf.fillNull(rs.getString("qh_xcpzzsh_qtyq"));
		qh_xcpzzsh_wcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_wcsj"));
		qh_xcpzzsh_qhbshsj=cf.fillNull(rs.getDate("qh_xcpzzsh_qhbshsj"));
		qh_xcpzzsh_qhbshr=cf.fillNull(rs.getString("qh_xcpzzsh_qhbshr"));
		qh_xcpzzsh_jg=cf.fillNull(rs.getString("qh_xcpzzsh_jg"));
		qh_xcpzzsh_fyzj=cf.fillNull(rs.getString("qh_xcpzzsh_fyzj"));
		qh_xcpzzsh_yjwcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_yjwcsj"));
		qh_xcpzzsh_sjwcsj=cf.fillNull(rs.getDate("qh_xcpzzsh_sjwcsj"));
		qh_xcpzzsh_qhbshyj=cf.fillNull(rs.getString("qh_xcpzzsh_qhbshyj"));
		qh_xcpzzsh_shdwbh=cf.fillNull(rs.getString("qh_xcpzzsh_shdwbh"));
		qh_xcpzzsh_bz=cf.fillNull(rs.getString("qh_xcpzzsh_bz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		qh_xcpzzsh_zgbmjlyj=cf.fillNull(rs.getString("qh_xcpzzsh_zgbmjlyj"));
		qh_xcpzzsh_zjlyj=cf.fillNull(rs.getString("qh_xcpzzsh_zjlyj"));
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

<table width="100%" bgcolor="#CCFFFF">
  <tr>
    <td width="100%"> 
      <div align="center"> ��������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��˱���</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_shbbh%>
	<%session.setAttribute("shbbh",qh_xcpzzsh_shbbh);%>
  </td>
  <td width="15%"> 
    <div align="right">����ʱ��</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_sqsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�����</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_tbr%>
  </td>
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_zznr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_sl%>
  </td>
  <td width="15%"> 
    <div align="right">���</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_gg%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ʽ</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_xs%>
  </td>
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_wznr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ɫҪ��</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_ysyq%>
  </td>
  <td width="15%"> 
    <div align="right">����Ҫ��</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_qtyq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���ʱ��</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_wcsj%>
  </td>
  <td width="15%"> 
    <div align="right">��ע</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_bz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��λ����</div>
  </td>
  <td width="35%"> 
    <%=sq_dwxx_dwmc%>
  </td>
  <td width="15%"> 
    <div align="right">���ܲ��ž������</div>
  </td>
  <td width="35%"> 
    <%=qh_xcpzzsh_zgbmjlyj%>
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������󻮲���������д</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditQh_xcpzzsh.jsp" name="editform">
<table width="100%" border="0" style="font-size: 12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="26%"> 
    <p align="right">�����
  </td>
  <td width="30%"> 
    <input type="text" name="tbr" size="20">
  </td>
  <td width="16%"> 
    <p align="right">���ʱ��
  </td>
  <td width="28%"> 
    <input type="text" name="qhbshsj" value=<%=cf.today()%> size="20">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="26%"> 
    <p align="right">�۸�
  </td>
  <td width="30%"> 
    <input type="text" name="jg" size="20" onblur="calValue(editform)">
  </td>
  <td width="16%"> 
    <p align="right">�����ܼ�
  </td>
  <td width="28%"> 
    <input type="text" name="fyzj" size="20">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="26%"> 
    <p align="right">Ԥ�����ʱ��
  </td>
  <td width="30%"> 
    <input type="text" name="yjwcsj" value="<%=cf.today()%>" size="20">
  </td>
  <td width="16%"> 
    <p align="right">ʵ�����ʱ��
  </td>
  <td width="28%"> 
    <input type="text" name="sjwcsj" value="<%=cf.today()%>" size="20">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="26%"> 
    <p align="right">��ע
  </td>
  <td width="74%" colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>
  </td>
</tr>
<input type="hidden" name="whereshbbh"  value="" >
<tr bgcolor="#FFFFFF">
  <td width="26%"> 
    <p align="right">�󻮲�������
  </td>
  <td width="74%" colspan="3"> 
    <font color="#FF0000"><textarea name="qhbshyj" cols="72" rows="3"></textarea>
    </font>
  </td>
</tr>
	    <tr> 
              <td width="26%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="36%" height="2"> 
                <div align="right"> 
                  <p align="left"> 
                  <input type="button"  value="ȷ��" onClick="f_do(editform)">
                </div>
              </td>
              <td width="3%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
function calValue(FormName){
if (javaTrim(FormName.jg)!="")
{
	
FormName.fyzj.value=parseFloat(FormName.jg.value)*parseFloat(<%=qh_xcpzzsh_sl%>);
}		
}
function f_do(FormName)//����FormName:Form������
{
if(	javaTrim(FormName.tbr)=="") {
		alert("������[�����]��");
		FormName.tbr.focus();
		return false;
	}	
if(	javaTrim(FormName.jg)=="") {
		alert("������[�۸�]��");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "�۸�"))) {
		return false;
	}
if(!(isFloat(FormName.fyzj, "�����ܼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.qhbshsj)=="") {
		alert("������[�󻮲����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhbshsj, "�󻮲����ʱ��"))) {
		return false;
	}
if(	javaTrim(FormName.yjwcsj)=="") {
		alert("������[Ԥ�����ʱ��]��");
		FormName.yjwcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjwcsj, "Ԥ�����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjwcsj)=="") {
		alert("������[ʵ�����ʱ��]��");
		FormName.sjwcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjwcsj, "ʵ�����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qhbshyj)=="") {
		alert("������[�󻮲�������]��");
		FormName.qhbshyj.focus();
		return false;
	}	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
