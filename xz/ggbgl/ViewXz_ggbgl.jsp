<%@ page contentType="text/html;charset=gbk" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_ggbgl_ggbh=null;//公告编号
String xz_ggbgl_ggmc=null;//公告名称
String xz_ggbgl_ggnr=null;//公告内容
String xz_ggbgl_fbsj=null;//发布时间
String xz_ggbgl_fbr=null;//发布人
String xz_ggbgl_fbbm=null;//发布部门
String xz_ggbgl_lrr=null;//录入人
String xz_ggbgl_lrsj=null;//录入时间
String fj=null;//附件
String ggfw=null;//公告范围
//String ggfgs=null;
//String ggbm=null;
//String ggyhz=null;
String ggbh=null;

String yhzmc_1=null;//临时存放用户组名称，yhzmc在修改前已经占用
String fgsmc_1=null;//临时存放分公司名称
String bmmc_1=null;//临时存放部门名称
ggbh=cf.GB2Uni(request.getParameter("ggbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
oracle.sql.CLOB   clob=null;   
String   s=null;
try {
	conn=cf.getConnection();
//从xz_ggbgl查出基本信息
	ls_sql="select ggfw,fj,xz_ggbgl.ggbh as xz_ggbgl_ggbh,xz_ggbgl.ggmc as xz_ggbgl_ggmc,xz_ggbgl.ggnr as xz_ggbgl_ggnr,xz_ggbgl.fbsj as xz_ggbgl_fbsj,xz_ggbgl.fbr as xz_ggbgl_fbr,xz_ggbgl.fbbm as xz_ggbgl_fbbm,xz_ggbgl.lrr as xz_ggbgl_lrr,xz_ggbgl.lrsj as xz_ggbgl_lrsj ";
	ls_sql+=" from  sq_dwxx,xz_ggbgl";
	ls_sql+=" where xz_ggbgl.fbbm=sq_dwxx.dwbh and (xz_ggbgl.ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ggfw=cf.fillNull(rs.getString("ggfw"));
		fj=cf.fillNull(rs.getString("fj"));
		xz_ggbgl_ggbh=cf.fillNull(rs.getString("xz_ggbgl_ggbh"));
		xz_ggbgl_ggmc=cf.fillNull(rs.getString("xz_ggbgl_ggmc"));
		xz_ggbgl_ggnr=cf.fillNull(rs.getString("xz_ggbgl_ggnr"));
		xz_ggbgl_fbsj=cf.fillNull(rs.getDate("xz_ggbgl_fbsj"));
		xz_ggbgl_fbr=cf.fillNull(rs.getString("xz_ggbgl_fbr"));
		xz_ggbgl_fbbm=cf.fillNull(rs.getString("xz_ggbgl_fbbm"));
		xz_ggbgl_lrr=cf.fillNull(rs.getString("xz_ggbgl_lrr"));
		xz_ggbgl_lrsj=cf.fillNull(rs.getDate("xz_ggbgl_lrsj"));

		 
	  
		clob=(oracle.sql.CLOB)rs.getClob("xz_ggbgl_ggnr");   
		if(clob!=null)
		{
			Reader is=clob.getCharacterStream();   
			BufferedReader br=new BufferedReader(is);   
			s = br.readLine();   
			while(s!=null)
			{   
				xz_ggbgl_ggnr+=s;   
				s=br.readLine();   
			}   
		}   


	}
	rs.close();
	ps.close();

	
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>


<table width="100%" >
  <tr>
    <td width="100%"> 
      <div align="center">信息公告（公告编号：<%=xz_ggbgl_ggbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">标题</td>
            <td colspan="3"><%=xz_ggbgl_ggmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%" align="right">附件</td>
            <td colspan="3"><a href="\xz\ggbgl\file\<%=fj%>" >点击下载附件：<%=fj%></a></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">发布人</div>
            </td>
            <td width="34%"> <%=xz_ggbgl_fbr%></td>
            <td width="17%"> 
              <div align="right">发布时间</div>
            </td>
            <td width="33%"> <%=xz_ggbgl_fbsj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">录入人</div>
            </td>
            <td width="34%"><%=xz_ggbgl_lrr%> </td>
            <td width="17%"> 
              <div align="right">录入时间</div>
            </td>
            <td width="33%"> <%=xz_ggbgl_lrsj%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">发布部门</div>
            </td>
            <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+xz_ggbgl_fbbm+"'",xz_ggbgl_fbbm,true);
%></td>
            <td align="right">公告范围</td>
            <td><%
	cf.selectToken(out,"1+公告集团所有员工&2+公告分公司&3+公告部门&4+公告用户组&5+选择某个员工",ggfw,true);
%></td>
          </tr>
</table>


        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" onclick="return false;">
		<tr bgcolor="#FFFFFF"> 
            <td width="16%"> 
              <div align="right">公告内容</div>
            </td>
            <td colspan="3"><%=xz_ggbgl_ggnr%></td>
          </tr>
		</table>


        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" >
          <tr bgcolor="#999999" align="center"> 
            <td colspan="4">公告对象</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="4"> 
              <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" align="center"><b>分公司</b></td>
                  <td width="15%" align="center"><b>部门</b></td>
                  <td width="72%"><b>公告员工</b></td>
                </tr>
                <%
	String ssfgs=null;
	String fgsmc=null;
	String ssdw=null;
	String ssdwmc=null;
	String yhmc=null;
	String yhstr="";

	ls_sql="select distinct xz_ggdx.ssfgs,dwmc";
	ls_sql+=" from  xz_ggdx,sq_dwxx";
	ls_sql+=" where xz_ggdx.ssfgs=sq_dwxx.dwbh and xz_ggdx.ggbh='"+ggbh+"'";
	ls_sql+=" order by xz_ggdx.ssfgs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
		fgsmc=rs.getString("dwmc");

		ls_sql="select distinct xz_ggdx.dwbh,dwmc";
		ls_sql+=" from  xz_ggdx,sq_dwxx";
		ls_sql+=" where xz_ggdx.dwbh=sq_dwxx.dwbh and xz_ggdx.ssfgs='"+ssfgs+"' and xz_ggdx.ggbh='"+ggbh+"'";
		ls_sql+=" order by xz_ggdx.dwbh";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			ssdw=rs1.getString("dwbh");
			ssdwmc=rs1.getString("dwmc");

			yhstr="";
			ls_sql="select yhmc";
			ls_sql+=" from  xz_ggdx";
			ls_sql+=" where xz_ggdx.ssfgs='"+ssfgs+"' and xz_ggdx.dwbh='"+ssdw+"' and xz_ggdx.ggbh='"+ggbh+"'";
			ls_sql+=" order by yhmc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				yhmc=rs2.getString("yhmc");

				yhstr+=yhmc+"、";
			}
			rs2.close();
			ps2.close();
			
			%> 
                <tr bgcolor="#FFFFFF"> 
                  <td width="13%" align="center"><%=fgsmc%></td>
                  <td width="15%" align="center"><%=ssdwmc%></td>
                  <td width="72%"><%=yhstr%></td>
                </tr>
                <%
		}
		rs1.close();
		ps1.close();

	}
	rs.close();
	ps.close();




%> 
              </table>
            </td>
          </tr>
        </table>

	  </div>
    </td>
  </tr>
</table>
</body>
</html>

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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
 

<script  LANGUAGE="javascript">
<!--
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

//-->
</script>
