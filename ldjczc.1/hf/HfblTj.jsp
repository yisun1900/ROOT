<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



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
String dwbh=cf.fillNull(request.getParameter("dwbh"));


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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>回访比例统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="4%" rowspan="2" >序号</td>
  <td  width="12%" rowspan="2" >分公司</td>

  <td colspan="4" >飞单回访</td>
  <td colspan="4" >在施工回访</td>
  <td colspan="4" >完工回访</td>
  </tr>
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="7%" >总数</td>
  <td  width="7%" >规定回访数量</td>
  <td  width="7%" >实际回访数量</td>
  <td  width="7%" >实回访比例</td>
  <td  width="7%" >总数</td>
  <td  width="7%" >规定回访数量</td>
  <td  width="7%" >实际回访数量</td>
  <td  width="7%" >实回访比例</td>
  <td  width="7%" >总数</td>
  <td  width="7%" >规定回访数量</td>
  <td  width="7%" >实际回访数量</td>
  <td  width="7%" >实回访比例</td>
  </tr>
<%

	int xjfdsl=0;
	int xjfdhfsl=0;
	int xjfdgdhfsl=0;

	int xjzsgsl=0;
	int xjzsghfsl=0;
	int xjzsggdhfsl=0;

	int xjwgsl=0;
	int xjwghfsl=0;
	int xjwggdhfsl=0;


	int row=0;


	
	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";


	ls_sql =" SELECT dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where sq_dwxx.dwlx='F0'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	if (!(fgs.equals("")))
	{
		ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
	}

	ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>TO_DATE('"+sjfw+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	ls_sql+=" order by sq_dwxx.dwbh";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		getfgsbh=rs2.getString("dwbh");
		fgsmc=rs2.getString("dwmc");
	

		//飞单-总数
		int fdsl=0;
		ls_sql =" SELECT count(crm_qysbdj.khbh)";
		ls_sql+=" FROM crm_qysbdj,crm_zxkhxx";
		ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
		ls_sql+=" and crm_qysbdj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_qysbdj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fdsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjfdsl+=fdsl;

		//飞单-规定回访比例
		double fdhfbl=0;
		ls_sql="select hfbl ";
		ls_sql+=" from  hf_hfblsz";
		ls_sql+=" where ssfgs='"+getfgsbh+"' and hflx='1'";//1：飞单回访、2：在施工回访、3：完工回访
		ls_sql+=" and khsksd<"+fdsl;
		ls_sql+=" and khsjzd>="+fdsl;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fdhfbl=rs.getDouble("hfbl");
		}
		rs.close();
		ps.close();

		//飞单-规定回访数量
		int fdgdhfsl=0;
		fdgdhfsl=(int)(fdsl*fdhfbl/100);
		xjfdgdhfsl+=fdgdhfsl;

		////飞单-实际回访数量
		int fdhfsl=0;
		ls_sql =" SELECT count(crm_qysbdj.khbh)";
		ls_sql+=" FROM crm_qysbdj,crm_zxkhxx";
		ls_sql+=" where crm_qysbdj.khbh=crm_zxkhxx.khbh(+)";
		ls_sql+=" and crm_qysbdj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_qysbdj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+getfgsbh+"'";
		ls_sql+=" and crm_qysbdj.clzt='5'";//5：回访
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fdhfsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjfdhfsl+=fdhfsl;

		//飞单-实回访比例
		double fdsjhfbl=0;

		if (fdgdhfsl!=0)
		{
			fdsjhfbl=cf.round(fdhfsl*100.0/fdgdhfsl,2);
		}


		//在施工-总数
		int zsgsl=0;
		ls_sql =" SELECT count(distinct hf_hfszjl.khbh)";
		ls_sql+=" FROM hf_hfszjl,crm_khxx";
		ls_sql+=" where hf_hfszjl.khbh=crm_khxx.khbh(+)";
		ls_sql+=" and hf_hfszjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and hf_hfszjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsgsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjzsgsl+=zsgsl;

		//在施工-规定回访比例
		double zsghfbl=0;
		ls_sql="select hfbl ";
		ls_sql+=" from  hf_hfblsz";
		ls_sql+=" where ssfgs='"+getfgsbh+"' and hflx='2'";//1：飞单回访、2：在施工回访、3：完工回访
		ls_sql+=" and khsksd<"+zsgsl;
		ls_sql+=" and khsjzd>="+zsgsl;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zsghfbl=rs.getDouble("hfbl");
		}
		rs.close();
		ps.close();

		//在施工-规定回访数量
		int zsggdhfsl=0;
		zsggdhfsl=(int)(zsgsl*zsghfbl/100);
		xjzsggdhfsl+=zsggdhfsl;

		//在施工-实际回访数量
		int zsghfsl=0;
		ls_sql =" SELECT count(distinct hf_zsghfjl.khbh)";
		ls_sql+=" FROM hf_zsghfjl,hf_hfszjl,crm_khxx";
		ls_sql+=" where hf_zsghfjl.khbh=crm_khxx.khbh(+)";
		ls_sql+=" and hf_zsghfjl.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and hf_zsghfjl.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";

		ls_sql+=" and crm_khxx.khbh=hf_hfszjl.khbh(+)";
		ls_sql+=" and hf_hfszjl.hfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and hf_hfszjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zsghfsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjzsghfsl+=zsghfsl;

		//在施工-实回访比例
		double zsgsjhfbl=0;

		if (zsggdhfsl!=0)
		{
			zsgsjhfbl=cf.round(zsghfsl*100.0/zsggdhfsl,2);
		}


		//完工-总数
		int wgsl=0;
		ls_sql =" SELECT count(khbh)";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";
		ls_sql+=" and crm_khxx.gcjdbm in('4','5')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wgsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjwgsl+=wgsl;

		//完工-规定回访比例
		double wghfbl=0;
		ls_sql="select hfbl ";
		ls_sql+=" from  hf_hfblsz";
		ls_sql+=" where ssfgs='"+getfgsbh+"' and hflx='3'";//1：飞单回访、2：在施工回访、3：完工回访
		ls_sql+=" and khsksd<"+wgsl;
		ls_sql+=" and khsjzd>="+wgsl;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			wghfbl=rs.getDouble("hfbl");
		}
		rs.close();
		ps.close();

		//完工-规定回访数量
		int wggdhfsl=0;
		wggdhfsl=(int)(wgsl*wghfbl/100);
		xjwggdhfsl+=wggdhfsl;

		//完工-实际回访数量
		int wghfsl=0;
		ls_sql =" SELECT count(distinct crm_wghfjl.khbh)";
		ls_sql+=" FROM crm_wghfjl,crm_khxx";
		ls_sql+=" where crm_wghfjl.khbh=crm_khxx.khbh(+)";
		ls_sql+=" and crm_wghfjl.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_wghfjl.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.fgsbh='"+getfgsbh+"'";

		ls_sql+=" and crm_khxx.sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.sjjgrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.gcjdbm in('4','5')";
		
		
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wghfsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		xjwghfsl+=wghfsl;

		//完工-实回访比例
		double wgsjhfbl=0;

		if (wggdhfsl!=0)
		{
			wgsjhfbl=cf.round(wghfsl*100.0/wggdhfsl,2);
		}



		row++;



		%>
		<tr align="center"  bgcolor="#FFFFFF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td><%=row%></td>
			<td><%=fgsmc%></td>
			<td><%=fdsl%></td>
			<td><%=fdgdhfsl%></td>
			<td><%=fdhfsl%></td>
			<td><%=fdsjhfbl%>%</td>
			<td><%=zsgsl%></td>
			<td><%=zsggdhfsl%></td>
			<td><%=zsghfsl%></td>
			<td><%=zsgsjhfbl%>%</td>
			<td><%=wgsl%></td>
			<td><%=wggdhfsl%></td>
			<td><%=wghfsl%></td>
			<td><%=wgsjhfbl%>%</td>
		  </tr>
		<%
	}
	rs2.close();
	ps2.close();

	//飞单-实回访比例
	double fdsjhfbl=0;

	if (xjzsggdhfsl!=0)
	{
		fdsjhfbl=cf.round(xjfdhfsl*100.0/xjzsggdhfsl,2);
	}
	//在施工-实回访比例
	double zsgsjhfbl=0;

	if (xjzsggdhfsl!=0)
	{
		zsgsjhfbl=cf.round(xjzsghfsl*100.0/xjzsggdhfsl,2);
	}
	//完工-实回访比例
	double wgsjhfbl=0;

	if (xjwggdhfsl!=0)
	{
		wgsjhfbl=cf.round(xjwghfsl*100.0/xjwggdhfsl,2);
	}
%>

<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="2"><font color="#ff0000">总计</td>
	<td><%=xjfdsl%></td>
	<td><%=xjfdgdhfsl%></td>
	<td><%=xjfdhfsl%></td>
	<td><%=fdsjhfbl%>%</td>

	<td><%=xjzsgsl%></td>
	<td><%=xjzsggdhfsl%></td>
	<td><%=xjzsghfsl%></td>
	<td><%=zsgsjhfbl%>%</td>

	<td><%=xjwgsl%></td>
	<td><%=xjwggdhfsl%></td>
	<td><%=xjwghfsl%></td>
	<td><%=wgsjhfbl%>%</td>
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