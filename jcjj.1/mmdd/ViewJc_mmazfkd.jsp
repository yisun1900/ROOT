<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String spks=null;
String spzl=null;
String spgn=null;
String spfw=null;
String azjs=null;
String fwtd=null;
String fwgf=null;
String mfsh=null;
String mfaz=null;
String zssm=null;
String syxt=null;
String sydb=null;
String wzzq=null;
String qlxc=null;
String cscp=null;
String jsbyzs=null;
String bzgkjxy=null;
String bzgkjcf=null;
String bsdtt=null;
String bjsgkxf=null;
String bsygksb=null;
String bjsgkyq=null;
String azhs=null;
String bz=null;
String whereyddbh=null;
whereyddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,spks,spzl,spgn,spfw,azjs,fwtd,fwgf,mfsh,mfaz,zssm,syxt,sydb,wzzq,qlxc,cscp,jsbyzs,bzgkjxy,bzgkjcf,bsdtt,bjsgkxf,bsygksb,bjsgkyq,azhs,bz ";
	ls_sql+=" from  jc_mmazfkd";
	ls_sql+=" where (1=1) and  (yddbh='"+whereyddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		spks=cf.fillNull(rs.getString("spks"));
		spzl=cf.fillNull(rs.getString("spzl"));
		spgn=cf.fillNull(rs.getString("spgn"));
		spfw=cf.fillNull(rs.getString("spfw"));
		azjs=cf.fillNull(rs.getString("azjs"));
		fwtd=cf.fillNull(rs.getString("fwtd"));
		fwgf=cf.fillNull(rs.getString("fwgf"));
		mfsh=cf.fillNull(rs.getString("mfsh"));
		mfaz=cf.fillNull(rs.getString("mfaz"));
		zssm=cf.fillNull(rs.getString("zssm"));
		syxt=cf.fillNull(rs.getString("syxt"));
		sydb=cf.fillNull(rs.getString("sydb"));
		wzzq=cf.fillNull(rs.getString("wzzq"));
		qlxc=cf.fillNull(rs.getString("qlxc"));
		cscp=cf.fillNull(rs.getString("cscp"));
		jsbyzs=cf.fillNull(rs.getString("jsbyzs"));
		bzgkjxy=cf.fillNull(rs.getString("bzgkjxy"));
		bzgkjcf=cf.fillNull(rs.getString("bzgkjcf"));
		bsdtt=cf.fillNull(rs.getString("bsdtt"));
		bjsgkxf=cf.fillNull(rs.getString("bjsgkxf"));
		bsygksb=cf.fillNull(rs.getString("bsygksb"));
		bjsgkyq=cf.fillNull(rs.getString("bjsgkyq"));
		azhs=cf.fillNull(rs.getString("azhs"));
		bz=cf.fillNull(rs.getString("bz"));
	}
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">木门安装反馈单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">预订单编号</div>
            </td>
            <td width="29%"> <%=yddbh%> </td>
            <td width="21%"> 
              <div align="right">商品款式</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",spks,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">商品质量</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",spzl,true);
%> </td>
            <td width="21%"> 
              <div align="right">商品功能</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",spgn,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">商品服务</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",spfw,true);
%> </td>
            <td width="21%"> 
              <div align="right">安装技术</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",azjs,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">服务态度</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",fwtd,true);
%> </td>
            <td width="21%"> 
              <div align="right">服务规范</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "1+很满意&2+满意&3+不满意",fwgf,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">免费送货</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",mfsh,true);
%> </td>
            <td width="21%"> 
              <div align="right">免费安装</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",mfaz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">准时上门</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",zssm,true);
%> </td>
            <td width="21%"> 
              <div align="right">使用鞋套</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",syxt,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">使用垫布</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",sydb,true);
%> </td>
            <td width="21%"> 
              <div align="right">位置正确</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",wzzq,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">清理现场</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",qlxc,true);
%> </td>
            <td width="21%"> 
              <div align="right">擦拭产品</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",cscp,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">介绍保养知识</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",jsbyzs,true);
%> </td>
            <td width="21%"> 
              <div align="right">不在顾客家吸烟</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bzgkjxy,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">不在顾客家吃饭</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bzgkjcf,true);
%> </td>
            <td width="21%"> 
              <div align="right">不随地吐痰</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bsdtt,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">不接受顾客小费</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bjsgkxf,true);
%> </td>
            <td width="21%"> 
              <div align="right">不使用顾客家水杯</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bsygksb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%"> 
              <div align="right">不接受顾客宴请</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",bjsgkyq,true);
%> </td>
            <td width="21%"> 
              <div align="right">安装耗时</div>
            </td>
            <td width="29%"> <%
	cf.radioToken(out, "Y+是&N+否",azhs,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="21%" align="right">备注</td>
            <td colspan="3"><%=bz%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
