<%@ page contentType="application/vnd.ms-excel;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>导出数据 </title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">

<table width="250%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#CCCCCC" align="center"> 
	<td width="3%">所属施工队</td>
	<td width="3%">班长名称</td>
	<td width="3%">姓名</td>
	<td width="2%">性别</td>
	<td width="4%">籍贯</td>
	<td width="4%">出生日期</td>
	<td width="3%">工种</td>
	<td width="4%">入职时间</td>
	<td width="3%">等级</td>

	<td width="4%">类型</td>
	<td width="8%">身份证号</td>

	<td width="10%">电话</td>
	<td width="6%">住址</td>
	<td width="4%">紧急联系人</td>
	<td width="6%">联系人电话</td>
	<td width="8%">紧急联系人地址</td>
	<td width="8%">培训说明</td>
	<td width="5%">上岗证编号</td>
	<td width="5%">银行卡</td>
	<td width="3%">是否签订劳务派遣合同</td>
	<td width="3%">是否通过考试</td>

</tr>

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;

int row=0;

try 
{
	conn=cf.getConnection();    //得到连接



	String ssfgs=request.getParameter("ssfgs");
	
	String sgdmc=null;
	String bzmc=null;

	String xm=null;
	String xb=null;
	String jg=null;
	String csrq=null;
	String gz=null;
	String rzsj=null;
	String dj=null;
	String lx=null;
	String sfzh=null;
	String dh=null;
	String zz=null;
	String jjlxr=null;
	String jjlxrdh=null;
	String jjlxrdz=null;
	String pxsm=null;
	String sgzbh=null;
	String yhk=null;
	String sfqdlwpqht=null;
	String sfkstg=null;



	
	ls_sql=" select sgdmc,bzmc,sq_grxxb.xm,sq_grxxb.xb,sq_grxxb.jg,sq_grxxb.csrq ,sq_grxxb.gz,sq_grxxb.rzsj,sq_grxxb.dj,sq_grxxb.lx,sq_grxxb.sfzh ,sq_grxxb.dh,sq_grxxb.zz,sq_grxxb.jjlxr,sq_grxxb.jjlxrdh,sq_grxxb.jjlxrdz,sq_grxxb.pxsm,sq_grxxb.sgzbh,sq_grxxb.yhk,DECODE(sq_grxxb.sfqdlwpqht,'Y','是','N','否') sfqdlwpqht,DECODE(sq_grxxb.sfkstg,'Y','是','N','否') sfkstg" ;
	ls_sql+=" from sq_grxxb,sq_sgd " ;
	ls_sql+=" where sq_grxxb.sgd=sq_sgd.sgd(+) " ;
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_grxxb.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (ssfgs!=null)
	{
		if (!ssfgs.equals(""))	
		{
			ls_sql+=" and sq_grxxb.ssfgs='"+ssfgs+"'" ;
		}
	}
	ls_sql+=" order by  sq_grxxb.ssfgs,sq_grxxb.sgd,sq_grxxb.bzmc,sq_grxxb.xm" ;
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while(rs.next())
	{         
		sgdmc = cf.fillNull(rs.getString("sgdmc"));			    
		bzmc = cf.fillNull(rs.getString("bzmc"));			    
		xm = cf.fillNull(rs.getString("xm"));			    
		xb = cf.fillNull(rs.getString("xb"));			    
		jg = cf.fillNull(rs.getString("jg"));			    
		csrq = cf.fillNull(rs.getDate("csrq"));			    
		gz = cf.fillNull(rs.getString("gz"));			    
		rzsj = cf.fillNull(rs.getDate("rzsj"));			    
		dj = cf.fillNull(rs.getString("dj"));			    
		lx = cf.fillNull(rs.getString("lx"));			    
		sfzh = cf.fillNull(rs.getString("sfzh"));			    
		dh = cf.fillNull(rs.getString("dh"));			    
		zz = cf.fillNull(rs.getString("zz"));			    
		jjlxr = cf.fillNull(rs.getString("jjlxr"));			    
		jjlxrdh = cf.fillNull(rs.getString("jjlxrdh"));			    
		jjlxrdz = cf.fillNull(rs.getString("jjlxrdz"));			    
		pxsm = cf.fillNull(rs.getString("pxsm"));			    
		sgzbh = cf.fillNull(rs.getString("sgzbh"));			    
		yhk = cf.fillNull(rs.getString("yhk"));			    
		sfqdlwpqht = cf.fillNull(rs.getString("sfqdlwpqht"));			    
		sfkstg = cf.fillNull(rs.getString("sfkstg"));	
		
		sfzh="sfz:"+sfzh;
		yhk="yhk:"+yhk;
		
		row++;


			%> 
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=sgdmc%> 
		  </td>
		  <td><%=bzmc%> 
		  </td>
		  <td><%=xm%>
		  </td>
		  <td><%=xb%>
		  </td>
		  <td><%=jg%>
		  </td>
		  <td><%=csrq%>
		  </td>
		  <td> <%=gz%>
		  </td>
		  <td> <%=rzsj%>
		  </td>
		  <td> <%=dj%> 
		  </td>
		  <td ><%=lx%>
		  </td>
		  <td ><%=sfzh%>
		  </td>
		  <td ><%=dh%>
		  </td>
		  <td ><%=zz%>
		  </td>
		  <td ><%=jjlxr%>
		  </td>
		  <td ><%=jjlxrdh%>
		  </td>
		  <td ><%=jjlxrdz%>
		  </td>
		  <td ><%=pxsm%>
		  </td>
		  <td ><%=sgzbh%>
		  </td>
		  <td ><%=yhk%>
		  </td>
		  <td ><%=sfqdlwpqht%>
		  </td>
		<td ><%=sfkstg%>
		  </td>
		</tr>
		<%


	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("操作失败，Exception:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
  </table>
</body>
</html>
