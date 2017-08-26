<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
</head>
<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String psph=request.getParameter("psph");
String gysmc=null;
int sl=0;

try {
	conn=cf.getConnection();

	String psdzt="";
	String shjl="";
	ls_sql="SELECT jxc_clpsd.shjl,jxc_clpsd.psdzt";
	ls_sql+=" FROM jxc_clpsd";
	ls_sql+=" where jxc_clpsd.psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		shjl=cf.fillNull(rs.getString("shjl"));
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (  (psdzt.equals("0") || psdzt.equals("1")) || (psdzt.equals("6") && shjl.equals("N")))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过
	{
		out.println("<P>错误！状态不正确，不能打印，只有提交或者审核通过后才能打印");
		return;
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<div align="center"><font size="5"><b>选择打印（单号：<%=psph%>）</b></font> 

  <table border="1" cellspacing="0" cellpadding="1" width="50%" style='FONT-SIZE: 15px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="18%" height="26">选择</td>
      <td  width="8%" height="26">点击打印</td>
    </tr>
     
    <tr > 
      <td  height="25"> 
        <div align="center">库存品</div>      </td>
      <td  height="25"> 
        <div align="center"><A HREF="/jxcdy/fdxpClddy.jsp?psph=<%=psph%>" target="_blank">打印</A></div>      </td>
    </tr>
    <tr > 
      <td  height="25"> 
        <div align="center">代销品</div>      </td>
      <td  height="25"> 
        <div align="center"><A HREF="/jxcdy/dxpClddy.jsp?psph=<%=psph%>" target="_blank">打印</A></div>      </td>

    </tr>
	   <tr > 
      <td  height="25"> 
        <div align="center">选择材料</div>      </td>
      <td  height="25"> 
        <div align="center"><A HREF="cldddChooseClbm.jsp?psph=<%=psph%>" target="_blank">打印</A></div>      </td>

    </tr>
    <tr align="center" > 
      <td  height="58" colspan="2"> 
        <input type="button" name="Button" value="打印完成" onClick="window.open('MarkDy.jsp?psph=<%=psph%>')">      </td>
    </tr>
  </table>
 
</body>

</html>
</script>

