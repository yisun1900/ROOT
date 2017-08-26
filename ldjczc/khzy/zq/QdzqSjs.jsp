<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170113'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[签单周期－设计师]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[签单周期－设计师]："+xtrzyhmc+"') ";
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
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));


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
  <B>签单周期－设计师</B><BR>
  <b>(时间范围：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="3%"  >序号</td>
  <td  width="6%">设计师</td>
  <td  width="4%" >新客户量</td>
  <td  width="4%" >累计客户量</td>

  <td  width="4%" >设计合同签单数</td>
  <td  width="5%" >设计合同签单周期</td>
  <td  width="4%" >设计合同签单率</td>

  <td  width="4%" >施工合同签单数</td>
  <td  width="5%" >施工合同签单周期</td>
  <td  width="4%" >施工合同签单率</td>

  <td  width="4%" >累计设计合同数</td>
  <td  width="4%" >设计转施工数</td>
  <td  width="5%" >设计转施工周期</td>
  <td  width="4%" >设计转施工率</td>

  <td  width="4%" >飞单数</td>
  <td  width="5%" >飞单周期</td>
  <td  width="4%" >飞单率</td>

  </tr>
<%

int row=0;

//新客户量
int newkhs_zj=0;
//积单量
int ljkhs_zj=0;

//签设计合同
int sjhtsl_zj=0;
double sjhtts_zj=0;
//施工合同
int sghtsl_zj=0;
double sghtts_zj=0;
//累计设计合同
int ljsjhtsl_zj=0;
//设计转施工
int sjzsgsl_zj=0;
double sjzsgts_zj=0;
//飞单量
int fds_zj=0;
double fdts_zj=0;


String fgsbh=null;
String fgsmc=null;
String getdwbh=null;
String dmmc=null;

ls_sql =" SELECT b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.ssfgs";
ls_sql+=" FROM sq_dwxx,sq_dwxx b";
ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2' and sq_dwxx.cxbz='N'";
if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	ls_sql+=" and sq_dwxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	ls_sql+=" and sq_dwxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}
if (!(fgs.equals("")))
{
	ls_sql+=" and  (sq_dwxx.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	ls_sql+=" and  sq_dwxx.dwbh='"+dwbh+"'";
}
ls_sql+=" and (sq_dwxx.cxbz='N' or sq_dwxx.gdsj+62>SYSDATE)";
ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery();
while (rs.next())
{
	fgsmc=rs.getString("fgsmc");
	getdwbh=rs.getString("dwbh");
	dmmc=rs.getString("dwmc");
	fgsbh=rs.getString("ssfgs");

	//新客户量
	int newkhs_xj=0;
	//累计客户量
	int ljkhs_xj=0;

	//签设计合同
	int sjhtsl_xj=0;
	double sjhtts_xj=0;
	//施工合同
	int sghtsl_xj=0;
	double sghtts_xj=0;
	//累计设计合同
	int ljsjhtsl_xj=0;
	//设计转施工
	int sjzsgsl_xj=0;
	double sjzsgts_xj=0;
	//飞单量
	int fds_xj=0;
	double fdts_xj=0;

	String yhmc=null;
	ls_sql =" select yhmc";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where dwbh='"+getdwbh+"'";
	ls_sql+=" and zwbm in('04','23')";
	ls_sql+=" and sfzszg in('Y','N')";
	if (!(sjs.equals("")))	
	{
		ls_sql+=" and yhmc='"+yhmc+"'";
	}
	ls_sql+=" order by yhmc";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		yhmc=rs2.getString("yhmc");


		//新客户量
		int newkhs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6：散客
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			newkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		newkhs_xj+=newkhs;
		newkhs_zj+=newkhs;

		//累计客户量
		int ljkhs=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4','6')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljkhs=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ljkhs_xj+=ljkhs;
		ljkhs_zj+=ljkhs;

		//签设计合同
		int sjhtsl=0;
		double sjhtts=0;
		ls_sql="select count(*),ROUND(sum(qsjhtsj-lrsj),2) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";//N：未签；Y：签合同
		ls_sql+=" and crm_zxkhxx.qsjhtsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.qsjhtsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjhtsl=rs1.getInt(1);
			sjhtts=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		sjhtsl_xj+=sjhtsl;
		sjhtts_xj+=sjhtts;

		sjhtsl_zj+=sjhtsl;
		sjhtts_zj+=sjhtts;

		if (sjhtsl!=0)
		{
			sjhtts=cf.round(sjhtts/sjhtsl,2);
		}
		else{
			sjhtts=0;
		}


		//设计合同签单率
		double sjhtqdl=0;
		if (ljkhs!=0)
		{
			sjhtqdl=cf.round(sjhtsl*100.0/ljkhs,2);
		}
		else{
			sjhtqdl=0;
		}



		//施工合同
		int sghtsl=0;
		double sghtts=0;
		ls_sql="select count(crm_khxx.khbh),ROUND(sum(crm_khxx.qyrq-crm_zxkhxx.lrsj),2) ";
		ls_sql+=" from  crm_zxkhxx,crm_khxx";
		ls_sql+=" where  crm_zxkhxx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.sjs='"+yhmc+"'";

		ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.sfke>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sghtsl=rs1.getInt(1);
			sghtts=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		sghtsl_xj+=sghtsl;
		sghtts_xj+=sghtts;

		sghtsl_zj+=sghtsl;
		sghtts_zj+=sghtts;

		if (sghtsl!=0)
		{
			sghtts=cf.round(sghtts/sghtsl,2);
		}
		else{
			sghtts=0;
		}


		//施工合同签单率
		double sghtqdl=0;
		if (ljkhs!=0)
		{
			sghtqdl=cf.round(sghtsl*100.0/ljkhs,2);
		}
		else{
			sghtqdl=0;
		}

		//累计设计合同
		int ljsjhtsl=0;
		ls_sql="select count(*) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";//N：未签；Y：签合同
		ls_sql+=" and crm_zxkhxx.qsjhtsj is not null";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljsjhtsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		ljsjhtsl_xj+=ljsjhtsl;
		ljsjhtsl_zj+=ljsjhtsl;


		//设计转施工
		int sjzsgsl=0;
		double sjzsgts=0;
		ls_sql="select count(crm_khxx.khbh),ROUND(sum(crm_khxx.qyrq-crm_zxkhxx.qsjhtsj),2) ";
		ls_sql+=" from  crm_zxkhxx,crm_khxx";
		ls_sql+=" where  crm_zxkhxx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.sjs='"+yhmc+"'";

		ls_sql+=" and crm_zxkhxx.qsjhtbz='Y'";//N：未签；Y：签合同
		ls_sql+=" and crm_zxkhxx.qsjhtsj is not null";

		ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.sfke>0";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjzsgsl=rs1.getInt(1);
			sjzsgts=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		sjzsgsl_xj+=sjzsgsl;
		sjzsgts_xj+=sjzsgts;

		sjzsgsl_zj+=sjzsgsl;
		sjzsgts_zj+=sjzsgts;

		if (sjzsgsl!=0)
		{
			sjzsgts=cf.round(sjzsgts/sjzsgsl,2);
		}
		else{
			sjzsgts=0;
		}


		//设计转施工率
		double sjzsgl=0;
		if (ljsjhtsl!=0)
		{
			sjzsgl=cf.round(sjzsgsl*100.0/ljsjhtsl,2);
		}
		else{
			sjzsgl=0;
		}


		//飞单量
		int fds=0;
		double fdts=0;
		ls_sql="select count(*),ROUND(sum(sbsj-lrsj),2) ";
		ls_sql+=" from  crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"'";
		ls_sql+=" and crm_zxkhxx.sjs='"+yhmc+"'";
		ls_sql+=" and crm_zxkhxx.sbsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.sbsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
		ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6：散客

		ls_sql+=" and crm_zxkhxx.zxzt in('2','4')";//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过；6：散客
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fds=rs1.getInt(1);
			fdts=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		fds_xj+=fds;
		fdts_xj+=fdts;

		fds_zj+=fds;
		fdts_zj+=fdts;

		if (fds!=0)
		{
			fdts=cf.round(fdts/fds,2);
		}
		else{
			fdts=0;
		}

		//飞单率
		double fdl=0;
		if (ljkhs!=0)
		{
			fdl=cf.round(fds*100.0/ljkhs,2);
		}
		else{
			fdl=0;
		}
////////////////////////小计


		row++;

		%>
		<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
			<td align="center"><%=row%></td>
			<td align="center"><%=yhmc%></td>

			<td><%=newkhs%></td>
			<td><%=ljkhs%></td>

			<td><%=sjhtsl%></td>
			<td><%=sjhtts%></td>
			<td><%=sjhtqdl%>%</td>


			<td><%=sghtsl%></td>
			<td><%=sghtts%></td>
			<td><%=sghtqdl%>%</td>

			<td><%=ljsjhtsl%></td>
			<td><%=sjzsgsl%></td>
			<td><%=sjzsgts%></td>
			<td><%=sjzsgl%>%</td>

			<td><%=fds%></td>
			<td><%=fdts%></td>
			<td><%=fdl%>%</td>
		</tr>
		<%	
	}
	rs2.close();
	ps2.close();


	//设计合同签单率
	if (sjhtsl_xj!=0)
	{
		sjhtts_xj=cf.round(sjhtts_xj/sjhtsl_xj,2);
	}
	else{
		sjhtts_xj=0;
	}

	
	double sjhtqdl=0;
	if (ljkhs_xj!=0)
	{
		sjhtqdl=cf.round(sjhtsl_xj*100.0/ljkhs_xj,2);
	}
	else{
		sjhtqdl=0;
	}

	//施工合同签单率
	if (sghtsl_xj!=0)
	{
		sghtts_xj=cf.round(sghtts_xj/sghtsl_xj,2);
	}
	else{
		sghtts_xj=0;
	}

	double sghtqdl=0;
	if (ljkhs_xj!=0)
	{
		sghtqdl=cf.round(sghtsl_xj*100.0/ljkhs_xj,2);
	}
	else{
		sghtqdl=0;
	}

	//设计转施工率
	if (sjzsgsl_xj!=0)
	{
		sjzsgts_xj=cf.round(sjzsgts_xj/sjzsgsl_xj,2);
	}
	else{
		sjzsgts_xj=0;
	}

	double sjzsgl=0;
	if (ljsjhtsl_xj!=0)
	{
		sjzsgl=cf.round(sjzsgsl_xj*100.0/ljsjhtsl_xj,2);
	}
	else{
		sjzsgl=0;
	}

	//飞单率
	if (fds_xj!=0)
	{
		fdts_xj=cf.round(fdts_xj/fds_xj,2);
	}
	else{
		fdts_xj=0;
	}

	double fdl=0;
	if (ljkhs_xj!=0)
	{
		fdl=cf.round(fds_xj*100.0/ljkhs_xj,2);
	}
	else{
		fdl=0;
	}

	%>
	<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		<td align="center" colspan="2"><B>[<%=dmmc%>]小计</B></td>

		<td><%=newkhs_xj%></td>
		<td><%=ljkhs_xj%></td>

		<td><%=sjhtsl_xj%></td>
		<td><%=sjhtts_xj%></td>
		<td><%=sjhtqdl%>%</td>


		<td><%=sghtsl_xj%></td>
		<td><%=sghtts_xj%></td>
		<td><%=sghtqdl%>%</td>

		<td><%=ljsjhtsl_xj%></td>
		<td><%=sjzsgsl_xj%></td>
		<td><%=sjzsgts_xj%></td>
		<td><%=sjzsgl%>%</td>

		<td><%=fds_xj%></td>
		<td><%=fdts_xj%></td>
		<td><%=fdl%>%</td>

	</tr>
	<%	
}
rs.close();
ps.close();

//合计＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

//设计合同签单率
if (sjhtsl_zj!=0)
{
	sjhtts_zj=cf.round(sjhtts_zj/sjhtsl_zj,2);
}
else{
	sjhtts_zj=0;
}

double sjhtqdl=0;
if (ljkhs_zj!=0)
{
	sjhtqdl=cf.round(sjhtsl_zj*100.0/ljkhs_zj,2);
}
else{
	sjhtqdl=0;
}

//施工合同签单率
if (sghtsl_zj!=0)
{
	sghtts_zj=cf.round(sghtts_zj/sghtsl_zj,2);
}
else{
	sghtts_zj=0;
}

double sghtqdl=0;
if (ljkhs_zj!=0)
{
	sghtqdl=cf.round(sghtsl_zj*100.0/ljkhs_zj,2);
}
else{
	sghtqdl=0;
}

//设计转施工率
if (sjzsgsl_zj!=0)
{
	sjzsgts_zj=cf.round(sjzsgts_zj/sjzsgsl_zj,2);
}
else{
	sjzsgts_zj=0;
}

double sjzsgl=0;
if (ljsjhtsl_zj!=0)
{
	sjzsgl=cf.round(sjzsgsl_zj*100.0/ljsjhtsl_zj,2);
}
else{
	sjzsgl=0;
}

//飞单率
if (fds_zj!=0)
{
	fdts_zj=cf.round(fdts_zj/fds_zj,2);
}
else{
	fdts_zj=0;
}

double fdl=0;
if (ljkhs_zj!=0)
{
	fdl=cf.round(fds_zj*100.0/ljkhs_zj,2);
}
else{
	fdl=0;
}

%>

<tr align="right"  bgcolor="#FFFFFF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td align="center" colspan="2"><B>总 计</B></td>

	<td><%=newkhs_zj%></td>
	<td><%=ljkhs_zj%></td>

	<td><%=sjhtsl_zj%></td>
	<td><%=sjhtts_zj%></td>
	<td><%=sjhtqdl%>%</td>


	<td><%=sghtsl_zj%></td>
	<td><%=sghtts_zj%></td>
	<td><%=sghtqdl%>%</td>

	<td><%=ljsjhtsl_zj%></td>
	<td><%=sjzsgsl_zj%></td>
	<td><%=sjzsgts_zj%></td>
	<td><%=sjzsgl%>%</td>

	<td><%=fds_zj%></td>
	<td><%=fdts_zj%></td>
	<td><%=fdl%>%</td>

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