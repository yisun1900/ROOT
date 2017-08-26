<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170106'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzxqmc=(String)session.getAttribute("xqmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzxqmc+"',SYSDATE,'警告！非法侵入[小区积单统计]："+xtrzxqmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzxqmc=(String)session.getAttribute("xqmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzxqmc+"',SYSDATE,'进入[小区积单统计]："+xtrzxqmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=cf.fillNull(request.getParameter("fgs"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>小区统计</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="150%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%"  >序号</td>
  <td  width="8%"  >小区</td>

  <td  width="4%" >户数</td>
  <td  width="4%" >名单量</td>
  <td  width="5%" >交房时间</td>
  <td  width="4%" >户型量</td>
  <td  width="4%" >已咨询量</td>
  <td  width="4%" >定金量</td>
  <td  width="4%" >签单量</td>
  <td  width="4%" >已飞单</td>
  <td  width="4%" >在操作单</td>
  <td  width="4%" >对手工地量</td>
  <td  width="4%" >公司占有率</td>
  <td  width="4%" >在施工地量</td>
  <td  width="4%" >已完工</td>
  <td  width="4%" >未开工</td>

  </tr>
<%

int row=0;

//新客户量
int newkhs_zj=0;
//量房量
int newlfkhs_zj=0;
//定金量
int newdjkhs_zj=0;
//飞单量
int newfdkhs_zj=0;
//签单量
int newqdkhs_zj=0;
//在操作单
int ljkhs_zj=0;
//在施工地量
int zsgds_zj=0;
//未开工
int wkgds_zj=0;
//已完工
int wggds_zj=0;



String fgsmc=null;
String getdwbh=null;
String dwmc="";
String xqmc=null;
String cqbm=null;

ls_sql =" SELECT distinct cqbm,xqbm";
ls_sql+=" from  crm_zxkhxx";
ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
//ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
ls_sql+=" order by cqbm,xqbm";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	xqmc=rs.getString("xqbm");
	cqbm=rs.getString("cqbm");

	String fyssj="";
	String jfhs="";
	String zlhx="";

	ls_sql="select fyssj,jfhs,zlhx";
	ls_sql+=" from  yx_lsdcb";
	ls_sql+=" where cqbm='"+cqbm+"'";
	ls_sql+=" and xqmc='"+xqmc+"'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		fyssj=cf.fillNull(rs1.getDate("fyssj"));
		jfhs=cf.fillNull(rs1.getDate("jfhs"));
		zlhx=cf.fillNull(rs1.getDate("zlhx"));
	}
	rs1.close();
	ps1.close();

	//新客户量
	int newkhs=0;
	ls_sql="select count(*) ";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//量房量
	int newlfkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客

	ls_sql+=" and crm_zxkhxx.lfbz='Y'";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newlfkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//定金量
	int newdjkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客

	ls_sql+=" and ( crm_zxkhxx.lfdj>0 OR crm_zxkhxx.hddj>0)";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newdjkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//飞单量
	int newfdkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息

	ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
	ls_sql+=" and crm_zxkhxx.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newfdkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//签单量
	int newqdkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
	
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.sfke>0";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		newqdkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	//在操作单
	int ljkhs=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where crm_zxkhxx.ssfgs='"+fgs+"'";
	ls_sql+=" and crm_zxkhxx.xqbm='"+xqmc+"'";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		ljkhs=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//在施工地量
	int zsgds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
	ls_sql+=" and crm_khxx.gcjdbm in('2','6','3')";//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	

	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		zsgds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//未开工
	int wkgds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
	ls_sql+=" and crm_khxx.gcjdbm in('1')";//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		wkgds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	//已完工
	int wggds=0;
	ls_sql =" SELECT count(*)";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.fgsbh='"+fgs+"'";
	ls_sql+=" and crm_khxx.xqbm='"+xqmc+"'";

	ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
	ls_sql+=" and crm_khxx.gcjdbm in('1')";//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		wggds=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();


	
	
////////////////////////小计
	//新客户量
	newkhs_zj+=newkhs;
	//量房量
	newlfkhs_zj+=newlfkhs;
	//定金量
	newdjkhs_zj+=newdjkhs;
	//飞单量
	newfdkhs_zj+=newfdkhs;
	//签单量
	newqdkhs_zj+=newqdkhs;
	//在操作单
	ljkhs_zj+=ljkhs;
	//在施工地量
	zsgds_zj+=zsgds;
	//未开工
	wkgds_zj+=wkgds;
	//已完工
	wggds_zj+=wggds;


	row++;


	%>
	<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td><%=row%></td>
		<td><%=xqmc%></td>

		<td><%=jfhs%></td>
		<td>&nbsp;</td>
		<td><%=fyssj%></td>
		<td><%=zlhx%></td>
		<td><%=newkhs%></td>
		<td><%=newdjkhs%></td>
		<td><%=newqdkhs%></td>
		<td><%=newfdkhs%></td>

		<td><%=ljkhs%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=zsgds%></td>
		<td><%=wggds%></td>
		<td><%=wkgds%></td>

	</tr>
	<%	

}
rs.close();
ps.close();

	//合计＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

%>

<tr align="center"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><B>总 计</B></td>

	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B><%=newkhs_zj%></B></td>
	<td><B><%=newdjkhs_zj%></B></td>
	<td><B><%=newqdkhs_zj%></B></td>
	<td><B><%=newfdkhs_zj%></B></td>

	<td><B><%=ljkhs_zj%></B></td>
	<td><B>&nbsp;</B></td>
	<td><B>&nbsp;</B></td>
	<td><B><%=zsgds_zj%></B></td>
	<td><B><%=wggds_zj%></B></td>
	<td><B><%=wkgds_zj%></B></td>


</tr>

</table>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 