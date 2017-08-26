<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程监察表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
//		pageObj.setType("EXCEL",response);
	}
%>
<%
String tjrq=request.getParameter("tjrq");
String tjrq2=request.getParameter("tjrq2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int allzsgs=0;//目前在施工程总数
int allwggs=0;//本期内完工总数
int allwpds=0;//未派单总数
int allpdwkgs=0;//派单后未开工总数
int wkgs=0;//本期内开工延期数
int ljwkgs=0;//累计开工延期数
int wybs=0;//本期内隐蔽工程验收延期数
int ljwybs=0;//累计隐蔽工程验收延期数
int wzqs=0;//本期内中期验收延期数
int ljwzqs=0;//累计中期验收延期数
int wjgs=0;//本期内完工延期数
int ljwjgs=0;//累计完工延期数

try {
	conn=cf.getConnection();


	//目前在施工程总数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='1' and gcjdbm!='5'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allzsgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//本期内完工总数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm!='5'";
	ls_sql+=" and sjjgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and sjjgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allwggs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//未派单总数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and pdclzt='1' ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allwpds=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//派单后未开工总数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and gcjdbm='1' and pdclzt!='1'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		allpdwkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();


	//本期内开工延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where kgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and kgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (kgrq<sjkgrq or (sjkgrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//累计开工延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' and kgrq<=SYSDATE";
	ls_sql+=" and (kgrq<sjkgrq or (sjkgrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwkgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

/*
	//本期内隐蔽工程验收延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhybgcrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and jhybgcrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and (jhybgcrq<sybgcrq or (sybgcrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wybs=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//累计隐蔽工程验收延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhybgcrq<=SYSDATE";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (jhybgcrq<sybgcrq or (sybgcrq is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwybs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//本期内中期验收延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhzqsj>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and jhzqsj<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and (jhzqsj<szqsj or (szqsj is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wzqs=rs.getInt(1);
	}
	ps.close();
	rs.close();
	//累计中期验收延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jhzqsj<=SYSDATE";
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and (jhzqsj<szqsj or (szqsj is null and crm_khxx.gcjdbm!='5') )";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwzqs=rs.getInt(1);
	}
	ps.close();
	rs.close();

*/
	//本期内完工延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where jgrq>=TO_DATE('"+tjrq+"','YYYY-MM-DD')";
	ls_sql+=" and jgrq<=TO_DATE('"+tjrq2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.zt='2' ";
	ls_sql+=" and ((jgrq<sjjgrq and gcjdbm='5') or (gcjdbm!='5'))";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

	//累计完工延期数
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.zt='2' ";
	ls_sql+=" and ((jgrq<sjjgrq and gcjdbm='5') or (gcjdbm!='5' and jgrq<=SYSDATE))";
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ljwjgs=rs.getInt(1);
	}
	ps.close();
	rs.close();

}
catch (Exception e) {
	out.print("Exception: " +ls_sql);
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

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">工程进度跟踪统计 
<br>时间范围（<%=tjrq%>----<%=tjrq2%>）
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14" >
  <tr> 
    <td width="30%" > 
      <div align="center"><b>类 型&nbsp; </b></div>
    </td>
    <td width="20%" > 
      <div align="center"><b>数 量</b></div>
    </td>
    <td width="33%" > 
      <div align="center"><b>类 型&nbsp; </b></div>
    </td>
    <td width="17%" > 
      <div align="center"><b>数 量</b></div>
    </td>
  </tr>
  <tr align="center"> 
    <td width="30%" >目前在施工程总数</td>
    <td width="20%" ><A HREF="WwgList.jsp?tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>" target="_blank"><%=allzsgs%>起</A></td>
    <td width="33%" >本期内完工总数</td>
    <td width="17%" ><%=allwggs%></td>
  </tr>
  <tr>
    <td width="30%" align="center" >未派单总数</td>
    <td width="20%" align="center" ><%=allwpds%></td>
    <td width="33%" align="right" >
      <div align="center">派单后未开工总数</div>
    </td>
    <td width="17%" >
      <div align="center"><%=allpdwkgs%></div>
    </td>
  </tr>
  <tr> 
    <td width="30%" align="right" > 
      <div align="center">本期内开工延期数</div>
    </td>
    <td width="20%" > 
      <div align="center"><A HREF="ViewWkgmx.jsp?tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>" target="_blank"><%=wkgs%>起</A></div>
    </td>
    <td width="33%" align="right" > 
      <div align="center">累计开工延期数</div>
    </td>
    <td width="17%" > 
      <div align="center"><%=ljwkgs%></div>
    </td>
  </tr>
  <tr> 
    <td width="30%" align="right" > 
      <div align="center">本期内隐蔽工程验收延期数</div>
    </td>
    <td width="20%" > 
      <div align="center"><a href="ViewWybmx.jsp?tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>" target="_blank"><%=wybs%>起</a></div>
    </td>
    <td width="33%" align="right" > 
      <div align="center">累计隐蔽工程验收延期数</div>
    </td>
    <td width="17%" >
      <div align="center"><%=ljwybs%></div>
    </td>
  </tr>
  <tr> 
    <td width="30%" align="right" > 
      <div align="center">本期内中期验收延期数</div>
    </td>
    <td width="20%" > 
      <div align="center"><A HREF="ViewWzqmx.jsp?tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>" target="_blank"><%=wzqs%>起</A></div>
    </td>
    <td width="33%" align="right" > 
      <div align="center">累计中期验收延期数</div>
    </td>
    <td width="17%" > 
      <div align="center"><%=ljwzqs%></div>
    </td>
  </tr>
  <tr> 
    <td width="30%" align="right" > 
      <div align="center">本期内完工延期数</div>
    </td>
    <td width="20%" > 
      <div align="center"><A HREF="ViewWwgmx.jsp?tjrq=<%=tjrq%>&tjrq2=<%=tjrq2%>&fgs=<%=fgs%>&dwbh=<%=dwbh%>" target="_blank"><%=wjgs%>起</A></div>
    </td>
    <td width="33%" align="right" > 
      <div align="center">累计完工延期数</div>
    </td>
    <td width="17%" > 
      <div align="center"><%=ljwjgs%></div>
    </td>
  </tr>
</table>

</body>
</html>
