<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String dqbm=null;

String jc_mmydd_khxm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sqdj=null;
String htrq=null;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double fwf=0;
double wdzje=0;
double htje=0;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.khxm,jhazsj,sqdj,htrq,mmhtje,wjhtje,blhtje,fwf,wdzje,htje";
	ls_sql+=" from  jc_mmydd,crm_khxx";
	ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+) and yddbh='"+yddbh+"'";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jc_mmydd_khxm=cf.fillNull(rs.getString("khxm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("sqdj"));
		htrq=cf.fillNull(rs.getDate("htrq"));
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		fwf=rs.getDouble("fwf");
		wdzje=rs.getDouble("wdzje");
		htje=rs.getDouble("htje");
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>松下亿达木门确认表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td width="100%" > 
        <table width="100%" border="0" style='FONT-SIZE: 20px'>
          <tr> 
            <td width="40%"><strong>附件号：<%=yddbh%></strong></td>
            <td width="60%"><strong>元 洲 木 门 合 同 附 件</strong></td>
          </tr>
        </table>
    </td>
  </tr>
  <tr> 
    <td> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td width="280" scope="row">客户姓名：<%=jc_mmydd_khxm%></td>
          <td width="265" scope="row"> 
            <div align="left"> 传真工厂记录：</div>
          </td>
          
        <td width="200">&nbsp;</td>
        </tr>
      </table>
      <b style='FONT-SIZE: 14px'>木制品部分</b> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="20%">图片</td>
          <td  width="20%">图片</td>
          <td  width="20%">图片</td>
          <td  width="20%">图片</td>
          <td  width="20%">图片</td>
        </tr>
		<tr align="center"> 

<%
	String mmxh=null;
	String zp=null;

	int row=0;
	ls_sql="SELECT distinct jc_mmdgdmx.mmxh,jc_mmxhb.zp";
	ls_sql+=" FROM jc_mmdgdmx,jc_mmxhb";
    ls_sql+=" where jc_mmdgdmx.mmxh=jc_mmxhb.mmxh and jc_mmdgdmx.yddbh='"+yddbh+"' and jc_mmxhb.dqbm='"+dqbm+"'  and jc_mmdgdmx.lx='1'";
    ls_sql+=" order by jc_mmdgdmx.mmxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		mmxh=cf.fillHtml(rs.getString("mmxh"));
		zp=cf.fillHtml(rs.getString("zp"));

		row++;

		%>
		  <td align="center"><IMG SRC="/jcjj/mmxh/images/<%=zp%>" height="250"><BR><%=row%>:款式/编号：<%=mmxh%></td>
		<%

		if (row%5==0)
		{
			%>
			</tr>
			<tr align="center"> 
			<%
		}


	}
	rs.close();
	ps.close();
%> 
		</tr>
      </table>
		
      <%
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


<table width="100%" border="0" style='FONT-SIZE: 16px'>
  <tr> 
    <td colspan="3"> 
      <table width="100%" border="0" style='FONT-SIZE: 16px'>
        <tr> 
          <td colspan="2">客户签字：</td>
          <td width="630">经办人：</td>
        </tr>
        <tr> 
          <td colspan="2">签订日期：<%=htrq%></td>
          <td width="630">签订日期：<%=htrq%></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>



