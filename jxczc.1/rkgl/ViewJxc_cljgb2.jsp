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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">材料编码</td>
  <td bgcolor="#FFFFCC">&nbsp; </td>
  <td width="15%" rowspan="4" align="right">照片</td>
  <td width="35%" rowspan="4">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="15%" align="right"><font color="#000000">内部编码</font></td>
  <td width="35%">&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">材料名称</td>
  <td>&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFCC">
  <td align="right">地区</td>
  <td>&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#9999FF"><font color=#FF0000>在库数量</font></td>
  <td bgcolor="#9999FF"><font color=green>&nbsp; </font></td>
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">可用库存</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">客户订货数量</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
  <td align="right" bgcolor="#9999FF"><font color="#FF0000">已采购数量</font></td>
  <td bgcolor="#9999FF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#99CCFF">材料大类</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
  <td width="15%" align="right" bgcolor="#99CCFF">材料小类</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" width="15%" bgcolor="#99CCFF"> 
    品牌</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
  <td width="15%" align="right" bgcolor="#99CCFF">子品牌</td>
  <td width="35%" bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#99CCFF">型号</td>
  <td bgcolor="#99CCFF">&nbsp; </td>
  <td align="right" bgcolor="#99CCFF">规格</td>
  <td bgcolor="#99CCFF">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">供应商</td>
  <td colspan="3" bgcolor="#CCFFCC">&nbsp; </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="15%" align="right" bgcolor="#CCFFCC">备注</td>
  <td colspan="3" bgcolor="#CCFFCC">&nbsp; </td>
  </tr>
</table>
</body>
</html>
