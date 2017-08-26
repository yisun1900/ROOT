<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<style>
	A:link,A:visited ,A:active {TEXT-DECORATION: none}
	A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
</style>
<script>
	function hide()
	{
		document.getElementById("print").style.display="none"
		document.getElementById("print2").style.display="none"
	}
</script>
<body>
<%
String bg1="#E8E8FF";
String bg2="#FFFFFF";
String yhbh=(String)session.getAttribute("khbh");//用户编号
String lrr=(String)session.getAttribute("yhdlm");//用户登录时的名称
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
Connection conn1  = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try{
    int zsl = 0;
	int zjs = 0;
	double zje = 0;
	String sumsql = "";
	conn1=cf.getConnection();    //得到连接
	sumsql = " select count(*) zjs,sum(gmsl) zsl,sum(gmje) zje";
	sumsql+=" from HY_KHHDPT ";
	sumsql+=" where khbh='"+yhbh+"' and khwjbz='N' ";
//	out.println(sql);
	ps1= conn1.prepareStatement(sumsql);
	rs1=ps1.executeQuery();
	if (rs1.next())                            
	{
		zjs=rs1.getInt(1);
		zsl=rs1.getInt(2);
		zje=rs1.getDouble(3);
		%>
		<DIV id="print" align="center">
		<a href="#" onmouseup=hide() onclick=document.execCommand("print")><font color="red" size="+1"><B>---=====打印=====---</font></a><br></B>
		</DIV>
		<div align="right">
		<font size="-1"><B> 共<font size="-1" color="red"><%=zjs%></font>种商品  合计<font size="-1" color="red"><%=zsl%></font>件  &nbsp;&nbsp;&nbsp;&nbsp
		</div>
		</center>
		<%
	}
	rs1.close();
	ps1.close();
	}
	catch (Exception e) {
	out.print("Exception: " + e);
	return;
	}
	finally 
	{
		try{
			if (rs1 != null) rs1.close(); 
			if (ps1 != null) ps1.close(); 
			if (conn1 != null) cf.close(conn1); 
		}
		catch (Exception e){
			if (conn1 != null) cf.close(conn1); 
		}
	}%>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF" style="FONT-SIZE: 12px;border-collapse:collapse">
  <%
try{
String ls_sql = "";
String gmsl = "";
String gmje = "";
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
int i=0;
	conn=cf.getConnection();
	ls_sql = "select  jc_zcjgb.zcbm,zcmc,zclbbm,jc_zcjgb.xh,gg,zcysbm,jldwbm,lsj,yhj,zp,jc_zcjgb.bz,sfycx,cxj,cxkssj,cxjzsj,DECODE(sfyh,'Y','有货','N','<font color=\"#FF0000\">无货</font>') sfyh,gmsl ";
	ls_sql+=" from HY_KHHDPT,jc_zcjgb ";
	ls_sql+=" where jc_zcjgb.zcbm=HY_KHHDPT.zcbm(+) and  HY_KHHDPT.khbh='"+yhbh+"' and HY_KHHDPT.khwjbz='N' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next()) 
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
		gmsl=cf.fillNull(rs.getString("gmsl"));
//		out.print(i);
		if (i==0){out.print("<tr>");}
		else if (i!=1 && i%2==0){out.print("</tr><tr>");}
		i++;
		%>
  <td  bgcolor="#FFFFFF" align="center" valign="top" width="20%"><IMG SRC="/jcjj/zcbj/images/<%=zp%>"  border=0 width="200"><BR> 
		  </td>
        <td  bgcolor="#FFFFFF" width="30%"> <div align="left"> <font color="#0000CC"><b>主材编码</font>：<%=zcbm%></b> 
            <br>
			<font color="#0000CC"><b>定购数量</font>：<%=gmsl%></b><br>
            <font color="#0000CC"><b>主材名称</font>：<%=zcmc%></b><br>
            <font color="#0000CC">类别系列</font>：<%=zclbbm%> <br>
            <font color="#0000CC">型&nbsp;&nbsp;&nbsp;&nbsp;号</font>：<%=xh%><br>
            <font color="#0000CC">规&nbsp;&nbsp;&nbsp;&nbsp;格</font>：<%=gg%><br>
            <font color="#0000CC">颜&nbsp;&nbsp;&nbsp;&nbsp;色</font>：<%=zcysbm%><br>
            <font color="#0000CC">市场标价</font>：￥<%=lsj%> /<%=jldwbm%><br>
            <font color="#0000CC">销售限价</font>：￥<%=yhj%> /<%=jldwbm%><br>
            <%
		if (sfycx.equals("Y"))
		{
%>
            <font color="#0000CC">促 销 价</font>：<font color="#FF0000">￥<%=cxj%></font><br>
            <font color="#0000CC">开始时间</font>：<font color="#FF0000"><%=cxkssj%></font><br>
            <font color="#0000CC">结束时间</font>：<font color="#FF0000"><%=cxjzsj%></font><br>
            <%
		}
		else{
%>
            <font color="#0000CC">有 促 销</font>：无<br>
            <%
		}
%>
            <font color="#0000CC">是否有货</font>：<%=sfyh%><br>
            <font color="#0000CC">展厅位置</font>：XX展区XX货柜<br>
            <font color="#0000CC">备&nbsp;&nbsp;&nbsp;&nbsp;注</font>：<%=bz%> <br>
          </div></td>		<%
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
}
%>
</table>
&nbsp;<BR>
<DIV id="print2" align="center">
<a href="#" onmouseup=hide() onclick=document.execCommand("print")><font color="red" size="+1"><B>---=====打印=====---</B></font></a></B>
</DIV>
</body>