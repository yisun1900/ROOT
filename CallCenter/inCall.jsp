<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>呼叫中心</TITLE>
</HEAD>

<BODY> 

<%
String xh=request.getParameter("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String khlx="";
String ldhm="";
String khbh="";
String lywjml="";
String lywj="";


String	khxm="";
String	xb="";
String	fwdz="";
String	sjs="";
String	zjxm="";
String	sgdmc="";

String	tsjlh="";
String	tsbxsj="";
String	tsnr="";

try {
	conn=cf.getConnection();

	ls_sql="select ldhm,khbh,lywjml,lywj,khlx";
	ls_sql+=" from  call_ldjl";
	ls_sql+=" where xh='"+xh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ldhm=cf.fillNull(rs.getString("ldhm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		lywjml=cf.fillNull(rs.getString("lywjml"));
		lywj=cf.fillNull(rs.getString("lywj"));
		khlx=cf.fillNull(rs.getString("khlx"));
	}
	rs.close();
	ps.close();

	if (khlx.equals("1"))
	{
		ls_sql="select khxm,DECODE(xb,'M','男','W','女') xb,fwdz,sjs,zjxm,sgdmc";
		ls_sql+=" FROM crm_zxkhxx,sq_sgd";
		ls_sql+=" where khbh='"+khbh+"' and crm_zxkhxx.sgd=sq_sgd.sgd(+)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			xb=cf.fillNull(rs.getString("xb"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			sjs=cf.fillNull(rs.getString("sjs"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));

			khxm=khxm+"（"+xb+"）（未签单）";
		}
	}
	else if (khlx.equals("2"))
	{
		ls_sql="select khxm,DECODE(xb,'M','男','W','女') xb,fwdz,sjs,zjxm,sgdmc";
		ls_sql+=" FROM crm_khxx,sq_sgd";
		ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			xb=cf.fillNull(rs.getString("xb"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			sjs=cf.fillNull(rs.getString("sjs"));
			zjxm=cf.fillNull(rs.getString("zjxm"));
			sgdmc=cf.fillNull(rs.getString("sgdmc"));
			
			khxm=khxm+"（"+xb+"）（签单）";
		}
		rs.close();
		ps.close();

		ls_sql="select tsjlh,tsbxsj,tsnr";
		ls_sql+=" from  crm_tsjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and clzt in('1','2')";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=" order by tsjlh desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tsjlh=rs.getString("tsjlh");
			tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
			tsnr=rs.getString("tsnr");
		}
		rs.close();
		ps.close();
	}


}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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


<div align="center">呼叫中心－来电客户信息
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  

  <tr>
    <td width="12%" align="center">来电号码</td>
    <td width="88%"><input name="innum" type="text" size="20" maxlength="20" value="<%=ldhm%>" readonly></td>
  </tr>
  
  <tr>
    <td align="center">客户信息
      <input name="khbh" type="hidden" size="20" >
    <input name="xh" type="hidden" size="20" ></td>
    <td  ><table width="100%" border="0">
      <tr height="27">
        <td width="37%"><B>姓名</B>:<U><%=khxm%></U></td>
        <td width="21%" ><B>质检</B>:<U><%=zjxm%></U></td>
        <td width="21%" ><B>设计师</B>:<U><%=sjs%></U></td>
        <td width="21%" ><B>施工队</B>:<U><%=sgdmc%></U></td>
      </tr>
      <tr height="27">
        <td colspan="3" ><B>房屋地址</B>:<U><%=fwdz%></U></td>
        <td ><input name="button2" type="button"  onClick="window.open('ViewCrm_khxx.jsp?khbh=<%=khbh%>')" value=查看客户></td>
      </tr>
      <tr height="27">
        <td >
			<B>记录号</B>:<U><%=tsjlh%></U></td>
        <td colspan="2" >
			<B>投诉报修时间</B>:<U><%=tsbxsj%></U></td>
        <td ><input name="button" type="button"  onClick="window.open('/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>')" value=查看投诉></td>
      </tr>
      <tr  >
        <td colspan="4"><B>投诉报修内容</B>:
		<BR>&nbsp;&nbsp;&nbsp;&nbsp;<U><%=tsnr%></U></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td align="center">录音文件</td>
    <td height="37"><%=lywj%></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>



