<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>不合格照片重拍</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>


<%
String yszpmc=request.getParameter("yszpmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ysjlh=null;
String zpxm=null;
String zpml=null;
String zplx=null;
String zpsm=null;

String zpshbz=null;
String shr=null;
String shsj=null;
String shsm=null;


try 
{
	conn=cf.getConnection();

	ls_sql="SELECT ysjlh,zpxm,zplx,zpml,zpsm,DECODE(zpshbz,'Y','合格','B','不合格','N','未审核','C','不合格重拍') zpshbz,shr,shsj,shsm";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  yszpmc='"+yszpmc+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysjlh=rs.getString("ysjlh");
		zpxm=cf.fillNull(rs.getString(2));
		zplx=cf.fillNull(rs.getString("zplx"));
		zpml=cf.fillNull(rs.getString("zpml"));
		zpsm=cf.fillNull(rs.getString("zpsm"));
		zpshbz=cf.fillNull(rs.getString("zpshbz"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shsm=cf.fillNull(rs.getString("shsm"));

	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载照片失败，Exception:" + e);
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


<body bgcolor="#FFFFFF">
<CENTER><B>不合格照片重拍</B><BR><HR>

<form method="post" action="SaveLoadYsZpCp.jsp" name="loadform" enctype="multipart/form-data" >

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

		  <tr bgcolor="#FFFFFF">
		    <td align="right">验收记录号</td>
		    <td><%=ysjlh%></td>
		    <td width="30%" rowspan="10" > 
	        <div align="center"><A HREF="ViewImage.jsp?zhaopian=/yblimg/gcys/<%=zpml%>/<%=java.net.URLEncoder.encode(yszpmc,"UTF-8")%>" target="_blank"><img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="200"></A></div></td>
      </tr>
	    <tr bgcolor="#FFFFFF">
		  <td width="13%" align="right">文件名称</td>
		  <td width="57%"><%=yszpmc%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">照片对应项目</td>
		  <td><%=zpxm%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">照片说明</td>
		  <td><%=zpsm%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">是否合格</td>
		  <td><%=zpshbz%></td>
	  </tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right"  >审核人</td>
		  <td  ><%=shr%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right" >审核时间</td>
		  <td  ><%=shsj%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right" >审核说明</td>
		  <td  ><%=shsm%></td>
    </tr>
		<tr bgcolor="#FFFFFF"> 
		  <td align="right"  ><b>请选择上载照片</b></td>
		  <td  ><input type="file" name="loadname" value="" size="60"></td>
		</tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right"  >&nbsp;</td>
		  <td  ><input name="button" type="button" onClick="f_onclick(loadform)"  value="上载图片">
	      <input type="hidden" name="yszpmc" value="<%=yszpmc%>" >
	      <input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
	      <input type="hidden" name="zpml" value="<%=zpml%>" >
		  </td>
    </tr>
</table>


</form>

</CENTER>
</body>
</html>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	javaTrim(FormName.loadname)=="") {
		alert("请选择上载照片！");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>