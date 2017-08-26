<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>
<%
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
%>
<style>
img {nobar:expression(this.galleryImg='no')}
p {font-size: 15px;font-weight: bold;}
</style>
<title>查看大图</title>
<body bgcolor="#eeeeee">
<%
String zcbm=null;
String zcmc=null;
String zclbbm=null;
String zcdlmc=null;
String xh=null;
String gg=null;
String zcysbm=null;
String jldwbm=null;
String lsj=null;
String yhj=null;
String dwmc=null;
String bz=null;
String zp=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sfyh=null;
zcbm=request.getParameter("zcbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT zcbm,zcmc,zclbbm,xh,gg,zcysbm,jldwbm,lsj,yhj,zp,jc_zcjgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where  zcbm='"+zcbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		bz=cf.fillNull(rs.getString("bz"));
		zp=cf.fillNull(rs.getString("zp"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		sfyh=cf.fillNull(rs.getString("sfyh"));
%>
 <table width="100%" border="1" align="center"  cellpadding="0" cellspacing="0" bordercolor="#999999" style="FONT-SIZE: 15px;border-collapse:collapse"  class="dgInit"> <tr>
 <td bgcolor="#eeeeee" align="center" valign="top"> <IMG SRC="/jcjj/zcbj/images/<%=zp%>"  onerror="this.src='../images/error1.jpg'" border=0>
		  </td>
        <td bgcolor="#eeeeee"> <div align="left">
		<p><font color="#CC0000">主材编码</font>：<font color="#0000CC"><%=zcbm%></font> <br>
            <font color="#CC0000">主材名称</font>：<br><font color="#0000CC"><%=zcmc%></font><br>
            <font color="#CC0000">类别系列</font>：<br><font color="#0000CC"><%=zclbbm%></font> <br>
            <font color="#CC0000">型&nbsp;&nbsp;&nbsp;&nbsp;号</font>：<br><font color="#0000CC"><%=xh%></font><br>
            <font color="#CC0000">规&nbsp;&nbsp;&nbsp;&nbsp;格</font>：<br><font color="#0000CC"><%=gg%></font><br>
            <font color="#CC0000">颜&nbsp;&nbsp;&nbsp;&nbsp;色</font>：<br><font color="#0000CC"><%=zcysbm%></font><br>
            <font color="#CC0000">市场标价</font>：<font color="#0000CC">￥<%=lsj%> /<%=jldwbm%></font><br>
            <font color="#CC0000">销售限价</font>：<font color="#0000CC">￥<%=yhj%> /<%=jldwbm%></font><br>
            <%
		if (sfycx.equals("Y"))
		{
%>
            <font color="#CC0000">促 销 价</font>：<font color="#FF0000">￥<%=cxj%></font><br>
            <font color="#CC0000">开始时间</font>：<font color="#FF0000"><%=cxkssj%></font><br>
            <font color="#CC0000">结束时间</font>：<font color="#FF0000"><%=cxjzsj%></font><br>
            <%
		}
		else{
%>
            <font color="#CC0000">有 促 销</font>：<font color="#0000CC">无</font><br>
            <%
		}
%>
            <font color="#CC0000">是否有货</font>：<font color="#0000CC"><%=sfyh%></font><br>
            <font color="#CC0000">展厅位置</font>：<font color="#0000CC">XX展区XX货柜</font><br>
            <font color="#CC0000">备&nbsp;&nbsp;&nbsp;&nbsp;注</font>：<font color="#0000CC"><%=bz%></font> <br>
			</p>
          </div></td>
		  </tr>
		  </table>
		    <%
	
	}
	else {%>
		//out.print("您访问的主材不存在！");
		<script language="javascript">
		alert("您访问的主材不存在！");
//	    return;
		window.close()
		</script>
		<%}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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