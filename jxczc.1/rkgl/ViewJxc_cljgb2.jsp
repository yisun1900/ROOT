<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String clbm="";
String dqbm="";
String gysmc="";
String lsj="";
String xsj="";
String cxhdbl="";
String myqjf="";
String sfycx="";
String cxkssj="";
String cxjzsj="";
String cxj="";
String lscxhdbl="";
String cxmyqjf="";
String xsfs="";
double zcpzsl=0;
String dhsl="";
String ycgsl="";
String whereclbm="";
String wheredqbm="";
String clmc="";
String xh="";
String gg="";
String zp="";
String scsmc=""; 
String ppmc="";
String cldlbm=""; 
String clxlbm="";
String ccpzsl="";
String bfpzsl="";
String wheresql="";

%>

<html>
<head>
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">���ϱ���</td>
  <td bgcolor="#FFFFCC">&nbsp; </td>
  <td width="15%" rowspan="4" align="right">��Ƭ</td>
  <td width="35%" rowspan="4">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="#000000">�ڲ�����</font></td>
  <td width="35%">&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">��������</td>
  <td>&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">����</td>
  <td>&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#9999FF"><font color=#FF0000>�ڿ�����</font></td>
  <td bgcolor="#9999FF"><font color=green>&nbsp; </font></td>
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">���ÿ��</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">�ͻ���������</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">�Ѳɹ�����</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">���ϴ���</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
  <td width="15%" align="right" bgcolor="#99CCFF">����С��</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
  <td width="15%" align="right" bgcolor="#99CCFF">��Ʒ��</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">�ͺ�</td>
  <td bgcolor="#99CCFF">&nbsp; </td>
  <td align="right" bgcolor="#99CCFF">���</td>
  <td bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">��Ӧ��</td>
  <td colspan="3" bgcolor="#CCFFCC">&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">��ע</td>
  <td colspan="3" bgcolor="#CCFFCC">&nbsp; </td>
  </tr>
</table>
</body>
</html>
