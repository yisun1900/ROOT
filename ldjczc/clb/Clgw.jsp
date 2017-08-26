<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='170801'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[材料顾问签单统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[材料顾问签单统计]："+xtrzyhmc+"') ";
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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String clgw=cf.GB2Uni(request.getParameter("clgw"));

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权




String bgcolor="#FFFFFF";

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
<style type="text/css">
<!--
.STYLE3 {color: #CC3366; font-weight: bold; }
-->
</style>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>材料顾问签单统计<BR>
  (时间范围：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="17%" >店面</td>
  <td  width="5%" >序号</td>
  <td  width="8%" >材料员</td>
  <td  width="8%" >材料员签约数</td>
  <td  width="14%" >材料员家装签约额</td>
  <td  width="9%" >材料员平均单值</td>

  <td  width="8%" >电子报价级别</td>
  <td  width="8%" >签约数</td>
  <td  width="14%" >家装签约额</td>
  <td  width="9%" >平均单值</td>
  </tr>
<%

	//放行数据
	String[][] trData=new String[500][10];

	int zjlfdjkhs=0;
	int zjhddjkhs=0;
	int zjsjfkhs=0;
	int zjzsgds=0;
	int zjwkggds=0;
	int zjzctssl=0;
	int zjqys=0;
		double zjqye=0;

	int row=0;

	String getfgsbh=null;
	String fgsmc=null;
	String getdwbh=null;
	String dmmc=null;
	String cxbz="";
	String kdsj="";
	String gdsj="";

	int num=0;

	ls_sql =" SELECT sq_dwxx.ssfgs,b.dwmc fgsmc,sq_dwxx.dwbh,sq_dwxx.dwmc,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.cxbz ";
	ls_sql+=" FROM sq_dwxx,sq_dwxx b";
	ls_sql+=" where  sq_dwxx.ssfgs=b.dwbh(+) and sq_dwxx.dwlx='F2'";
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
	if (!(clgw.equals("")))
	{
		ls_sql+=" and  sq_dwxx.dwbh in(select dwbh from sq_yhxx where ssfgs='"+fgs+"' and yhmc='"+clgw+"' and zwbm in('08'))";
	}

	ls_sql+=" and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.ssfgs,sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("ssfgs");
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dwmc");
		cxbz=rs.getString("cxbz");
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));

		int xjlfdjkhs=0;
		int xjhddjkhs=0;
		int xjsjfkhs=0;
		int xjzsgds=0;
		int xjwkggds=0;
		int xjzctssl=0;
		int xjqys=0;
		double xjqye=0;

		String getclgw="";
		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql =" SELECT yhmc,sfzszg,rzsj,lzrq";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm in('08')";//08:家居顾问
		ls_sql+=" and dwbh='"+getdwbh+"'";
		if (!(clgw.equals("")))
		{
			ls_sql+=" and yhmc='"+clgw+"'";
		}
		ls_sql+=" and sfzszg in('Y','N')";
		ls_sql+=" order by yhmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			getclgw=rs1.getString("yhmc");
			sfzszg=rs1.getString("sfzszg");
			rzsj=cf.fillNull(rs1.getDate("rzsj"));
			lzrq=cf.fillNull(rs1.getDate("lzrq"));

			num++;

			int clyqys=0;
			double clyqye=0;
			ls_sql =" SELECT count(*) qys,sum(qye) qye";
			ls_sql+=" FROM crm_khxx ";
			ls_sql+=" where dwbh='"+getdwbh+"' and clgw='"+getclgw+"'";
			ls_sql+=" and zt='2'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				clyqys=rs2.getInt("qys");
				clyqye=rs2.getDouble("qye");
			}
			rs2.close();
			ps2.close();

			int clypjde=0;
			if (clyqys!=0)
			{
				clypjde=(int)clyqye/clyqys;
			}
			//签约数
			String bjjb="";
			String bjjbmc="";
			int qys=0;
			double qye=0;
			ls_sql =" SELECT crm_khxx.bjjb,bjjbmc,count(*) qys,sum(qye) qye";
			ls_sql+=" FROM crm_khxx,bdm_bjjbbm ";
			ls_sql+=" where crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) ";
			ls_sql+=" and dwbh='"+getdwbh+"' and clgw='"+getclgw+"'";
			ls_sql+=" and zt='2'";
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" group by crm_khxx.bjjb,bjjbmc";
			ls_sql+=" order by crm_khxx.bjjb,bjjbmc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				bjjb=rs2.getString("bjjb");
				bjjbmc=rs2.getString("bjjbmc");
				qys=rs2.getInt("qys");
				qye=rs2.getDouble("qye");

				int pjde=0;
				if (qys!=0)
				{
					pjde=(int)qye/qys;
				}

				xjqys+=qys;
				xjqye+=qye;

				zjqys+=qys;
				zjqye+=qye;

				//设置显示数据
				trData[row][0]=dmmc;
				trData[row][1]=num+"";
				trData[row][2]="<A HREF=\"ViewClyQyMx.jsp?sjfw="+sjfw+"&sjfw2="+sjfw2+"&dwbh="+getdwbh+"&clgw="+getclgw+"\" target=\"_blank\">"+getclgw;
				trData[row][3]=clyqys+"";
				trData[row][4]=cf.formatDouble(clyqye);
				trData[row][5]=cf.formatDouble(clypjde)+"";
				trData[row][6]=bjjbmc;
				trData[row][7]=qys+"";
				trData[row][8]=cf.formatDouble(qye);
				trData[row][9]=cf.formatDouble(pjde)+"";

				row++;
			}
			rs2.close();
			ps2.close();


		}
		rs1.close();
		ps1.close();


		int pjde=0;
		if (xjqys!=0)
		{
			pjde=(int)xjqye/xjqys;
		}

		//设置显示数据
		trData[row][0]="<B>["+dmmc+"]小计</B>";
		trData[row][1]="";
		trData[row][2]="";
		trData[row][3]="<B>"+xjqys+"</B>";
		trData[row][4]="<B>"+cf.formatDouble(xjqye)+"</B>";
		trData[row][5]="<B>"+cf.formatDouble(pjde)+"</B>";
		trData[row][6]="&nbsp;";
		trData[row][7]="&nbsp;";
		trData[row][8]="&nbsp;";
		trData[row][9]="&nbsp;";

		row++;

	}
	rs.close();
	ps.close();


	//设置是否合并
	int[] isHb=new int[trData[0].length];
	isHb[0]=1;
	isHb[1]=1;
	isHb[2]=1;
	isHb[3]=1;
	isHb[4]=1;
	isHb[5]=1;

	//输入字符数组，输出行，相同行合并
	cf.outTr(out,trData,isHb);


	int pjde=0;
	if (zjqys!=0)
	{
		pjde=(int)zjqye/zjqys;
	}
%>
<tr align="center"  bgcolor="#E8E8FF" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3" align="center"><span class="STYLE3">总  计</span></td>

	<td><B><%=zjqys%></B></td>
	<td><B><%=cf.formatDouble(zjqye)%></B></td>
	<td><B><%=cf.formatDouble(pjde)%></B></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>

</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

<script  LANGUAGE="javascript">
<!--

function f_dqmx(formName)
{
	formName.action="ViewAllClgwYjMx.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 

function f_exp(formName)
{
	formName.action="ViewAllClgwYjMxExec.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 
//-->
</script>

