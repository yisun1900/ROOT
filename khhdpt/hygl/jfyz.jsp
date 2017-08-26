<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/khhdpt/checklogin.jsp" %>

<html>
<head>
<title>会员管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="/khhdpt/images/stype.css" rel=stylesheet type=text/css>
</head>

<body bgcolor="#FFFFFF"  style='FONT-SIZE: 13px'>
<table width="100%" border="0" height="534" style='FONT-SIZE: 13px'>
  <tr>
    <td width="12%" background="/khhdpt/images/jieshao_4-1.jpg" valign="top" height="657"> 
      <table width="114" height="834" border="0" cellpadding="0" cellspacing="0"  style='FONT-SIZE: 13px'>
        <tr> 
          <td valign="top" background="../images/jieshao_4-1.jpg" height="346"> 
            <table width="132" border="0"  style='FONT-SIZE: 13px'>
              <tr> 
                <td width="25" height="18">&nbsp;</td>
                <td width="97">&nbsp;</td>
              </tr>

              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/red_forum.gif" ></div></td>
                <td width="97"><A HREF="HyglIndex.jsp">会员尊享服务</A></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/red_forum.gif" ></div></td>
                <td width="97"><A HREF="jfyz.jsp">积分原则</A></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/red_forum.gif" ></div></td>
                <td width="97"><A HREF="jfcx.jsp">查询积分</A></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src="../tubiao/red_forum.gif" width="25"></div></td>
                <td width="97"><A HREF="jfhk.jsp">积分回馈</a></td>
              </tr>
              <tr> 
                <td height="30" width="25"> 
                  <div align="center"><img src='../tubiao/red_forum.gif' ></div></td>
                <td width="97"><A HREF="cjwt.jsp">常见问题</a></td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td>
    <td width="88%" valign="top" height="657"> 目前位置－->会员俱乐部－->积分原则 
      <table width="100%" border="0">
        <tr align="center"> 
          <td colspan="2" height="63">积分原则</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="35">家装合同积分</td>
          <td width="52%" height="35">&nbsp;</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="33">工程增项积分</td>
          <td width="52%" height="33">&nbsp;</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="34">工程减项扣分</td>
          <td width="52%" height="34">&nbsp;</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="35">主材积分</td>
          <td width="52%" height="35">&nbsp;</td>
        </tr>
        <tr>
          <td align="right" width="48%" height="31">木门积分</td>
          <td width="52%" height="31">&nbsp;</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="31">橱柜积分</td>
          <td width="52%" height="31">&nbsp;</td>
        </tr>
        <tr> 
          <td align="right" width="48%" height="36">家具积分</td>
          <td width="52%" height="36">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
