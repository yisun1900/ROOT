<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
//把主材按房间显示数量
String qydmbh=null;
String qydm=null;

String khbh=request.getParameter("khbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
String hth="";
String sjs=null;
String kgrq="";
String jyjdrq=null;
String jgrq="";
String czmc=null;
String ysmc=null;
String bjjb=null;
String ssfgs=null;
String dzbjbz=null;
String dh=null;
String hxbm=null;
String ysshbz="";
String ysshr="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,crm_zxkhxx.ssfgs,ysshr,DECODE(ysshbz,'N','未审核','Y','通过','M','审核未通过')ysshbz,hth,yjzxsj,zjzbjsj,fwmj,sq_yhxx.dh dh,hxbm";
	ls_sql+=" FROM crm_zxkhxx,bdm_bjjbbm,sq_yhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
	ls_sql+=" and crm_zxkhxx.sjsgh=sq_yhxx.bianhao(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		ssfgs=rs.getString("ssfgs");
		dh=cf.fillHtml(rs.getString("dh"));
		hxbm=cf.fillHtml(rs.getString("hxbm"));
		hth=cf.fillNull(rs.getString("hth"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
	}
	rs.close();
	ps.close();

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="140"></span></td>
    <td colspan="5" height="35"><b><font size="5">松下亿达装饰工程（大连）有限公司</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="center" colspan="9" height="35"><b><font size="3">住宅室内装饰装修主材报价书</font></b></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >客户姓名：<%=khxm%></td>
	<td colspan="4" >客户电话：<%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="9" >工程地址：<%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >户型说明：<%cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);%></td>
	<td colspan="4">
	<input type="checkbox" name="checkbox" value="checkbox">
	平层结构
	<input type="checkbox" name="checkbox2" value="checkbox">
	复式结构
	<input type="checkbox" name="checkbox3" value="checkbox">
	联排别墅
	<input type="checkbox" name="checkbox4" value="checkbox">
	独栋别墅
	<input type="checkbox" name="checkbox5" value="checkbox">
	旧房改造	</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" >设计师：<%=sjs%></td>
	<td width="17%" colspan="2" >设计师电话：<%=dh%></td>
    <td width="18%" align="center">审核人：<%=ysshr%></td>
    <td width="12%" align="center">&nbsp;</td>
  </tr>
</table>

<table border="1" cellspacing="0" bgcolor="#999999" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCFF" height="20" align="center"  >
  <td width="5%">序号</td>
  <td width="20%">工程项目</td>
  <td width="7%">单位</td>
  <td width="7%">工程量</td>
  <td width="7%">单价</td>
  <td width="9%">材料金额</td>
  <td width="9%">其它费</td>
  <td width="414%">用材、工艺及说明</td>
</tr>

<%
	int row1=0;//同房间内行号

	String bgcolor="";

	//套餐升级分类编码:不为空
	String jgwzbm=null;
	String lrxh=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String zcbm=null;
	String zcmc=null;
	String ppmc=null;
	String jldwbm=null;
	String xinghao=null;
	String gg=null;
	double zqdj=0;
	double dpzk=0;
	double dj=0;
	double sl=0;
	double je=0;
	double ycf=0;
	String qtfy=null;
	double qtfyje=0;

	double xjclje=0;
	double zjje=0;
	double xjycf=0;
	double zjycf=0;
	double xjqtfyje=0;
	double zjqtfyje=0;

	ls_sql="SELECT distinct zcpzwzbm";
	ls_sql+=" FROM bj_khzcmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by zcpzwzbm";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		jgwzbm=cf.fillNull(rs1.getString("zcpzwzbm"));

		double xjjefj=0;
		double xjycffj=0;
		double xjqtfyjefj=0;
		ls_sql="SELECT xh,zcdlbm,zcxlbm,zcbm,zcmc,ppmc,xinghao,gg,zcysbm,jldwbm,zqdj,dpzk,zqdj,dpzk,dj,sl,ycf,DECODE(qtfy,'1','安装费','2','加工费','3','其它收费','W','无') qtfy,qtfyje";
		ls_sql+=" FROM bj_khzcmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" and zcpzwzbm='"+jgwzbm+"'";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			lrxh=rs.getString("xh");
			zcdlbm=rs.getString("zcdlbm");
			zcxlbm=rs.getString("zcxlbm");

			zcbm=cf.fillNull(rs.getString("zcbm"));
			zcmc=cf.fillNull(rs.getString("zcmc"));
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			ppmc=cf.fillNull(rs.getString("ppmc"));
			xinghao=cf.fillNull(rs.getString("xinghao"));
			gg=cf.fillNull(rs.getString("gg"));


			zqdj=rs.getDouble("zqdj");
			dpzk=rs.getDouble("dpzk");
			dj=rs.getDouble("dj");
			sl=rs.getDouble("sl");
			ycf=rs.getDouble("ycf");
			qtfy=cf.fillNull(rs.getString("qtfy"));
			qtfyje=rs.getDouble("qtfyje");

			je=cf.round(sl*dj,2);

			xjjefj+=je;
			xjjefj=cf.round(xjjefj,2);

			xjclje+=je;
			xjclje=cf.round(xjclje,2);

			zjje+=je;
			zjje=cf.round(zjje,2);



			xjycf+=ycf;
			xjycf=cf.round(xjycf,2);

			xjycffj+=ycf;
			xjycffj=cf.round(xjycffj,2);

			zjycf+=ycf;
			zjycf=cf.round(zjycf,2);


			xjqtfyje+=qtfyje;
			xjqtfyje=cf.round(xjqtfyje,2);

			xjqtfyjefj+=qtfyje;
			xjqtfyjefj=cf.round(xjqtfyjefj,2);

			zjqtfyje+=qtfyje;
			zjqtfyje=cf.round(zjqtfyje,2);


			row1++;


			if (row1%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}


			//输出每行数据
			%>
			<tr bgcolor="<%=bgcolor%>" align="center"  >
			  <td><%=row1%>
			  </td>
			  <td><%=zcmc%></td>
			  <td><%=jldwbm%></td>
			  <td><%=sl%></td>
			  <td><%=dj%></td>
			  <td><%=je%></td>
			  <td><%=cf.round(ycf+qtfyje,2)%></td>
			  <td align="left"><%=ppmc%>、<%=xinghao%>、<%=gg%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		<tr bgcolor="#FFFFFF" align="center" height="27" >
		  <td colspan="2">【<%=jgwzbm%>】小计</td>
		  <td>元</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=xjjefj%></td>
		  <td><%=cf.round(xjycffj+xjqtfyjefj,2)%></td>
		  <td>&nbsp;</td>
		</tr>
		<%
	}
	rs1.close();
	ps1.close();

	%>
	<tr bgcolor="#FFFFFF" align="center" height="27" >
	  <td colspan="2">合计</td>
	  <td>元</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=xjclje%></td>
	  <td><%=cf.round(xjycf+xjqtfyje,2)%></td>
	  <td>&nbsp;</td>
	</tr>
	<%

	String sfxmmc="";
	double sfbfb=0;
	double sfje=0;
	ls_sql="SELECT sfxmmc,sfbfb,sfje";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx='8'";//8：公司购主材税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");

		zjje+=sfje;
		zjje=cf.round(zjje,2);

		%>
		<tr bgcolor="#FFFFFF" align="center" height="27" >
		  <td colspan="2"><%=sfxmmc%><%=sfbfb%>%</td>
		  <td>元</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=sfje%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sfxmmc,sfbfb,sfje";
	ls_sql+=" FROM bj_sfxmmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and sfxmlx='4'";//8：公司购主材税金
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxmmc=cf.fillNull(rs.getString("sfxmmc"));
		sfbfb=rs.getDouble("sfbfb");
		sfje=rs.getDouble("sfje");

		zjje+=sfje;
		zjje=cf.round(zjje,2);

		%>
		<tr bgcolor="#FFFFFF" align="center" height="27" >
		  <td colspan="2"><%=sfxmmc%></td>
		  <td>元</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td><%=sfje%></td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


	%>
	<tr bgcolor="#FFFFFF" align="center" height="30" >
	  <td colspan="2">主材合计</td>
	  <td>元</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td><%=zjje%></td>
	  <td><%=cf.round(zjycf+zjqtfyje,2)%></td>
	  <td>&nbsp;</td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql);
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
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" height="42">甲方签字：</td>
    <td colspan="6" height="42">乙方签字：</td>
  </tr>
</table>
</body>
</html>

