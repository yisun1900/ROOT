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

String fgs=request.getParameter("fgs");
String sgd=request.getParameter("sgd");

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String wheresql="";



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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">人工费统计
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=1 width="270%"  >
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)">
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td colspan="4" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工料合计</td>
  <td colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算人工费</td>
  <td colspan="2" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算辅料款</td>
  <td colspan="7" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">扣款明细</td>
  <td style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
</tr>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td  width="70" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">序号</td>
	<td  width="120" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工队</td>
	<td  width="180" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
	<td  width="80" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户编号</td>
	<td  width="120" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">姓名</td>
	<td  width="110" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">报价级别</td>


	<td  width="80" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">施工面积</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">预算工料款</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项款</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">拆除</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结算工料款</td>

	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">已支付人工费</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">本次支付人工费</td>

	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">已充辅料款</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">本次应补、退辅料款</td>

	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">质保金</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">扣款</td>


	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">罚款</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">公司辅料</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">配送辅料</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">其他</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">小计</td>

	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">本次付款合计</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">结款次数</td>
	<td  width="130" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">备注</td>
</tr>

<%

	int row=0;

	String khbh=null;

	String hxmc=null;
	double tcbzjg=0;

	int pmjj=0;
	double wdzgce=0;
	double qye=0;
	double zhgczjf=0;
	double zhzjxje=0;

	double qytcbl=0;
	double ztcbl=0;
	String sgdmc=null;

	String getsjfw=null;
	String khjsbzmc=null;
	String gdjsjdmc=null;


	
	double xjtcbzjg=0;
	int xjfwmj=0;
	double xjwdzgce=0;
	double xjqye=0;
	double xjzhgczjf=0;
	double xjzhzjxje=0;
	
	double xjzqhj=0;//优惠前结算金额
	double xjzhhj=0;//竣工结算额
	double xjyhze=0;//结算优惠金额
	double xjqytc=0;//签约提成
	double xjjstc=0;//结算提成
	double xjyfrgf=0;//人工费
	double xjflk=0;//辅料款
	double xjbcfkhj=0;//施工队结算金额
	double xjsgcb=0;
	
	ls_sql=" SELECT distinct khbh,sgd,sgdmc";
	ls_sql+=" FROM ( ";

	ls_sql+=" SELECT cw_jrbgf.khbh,cw_jrbgf.sgd,sgdmc";
	ls_sql+=" FROM cw_jrbgf,sq_sgd ";
    ls_sql+=" where cw_jrbgf.sgd=sq_sgd.sgd"; 
    ls_sql+=" and cw_jrbgf.clzt!='3'";//1：结算；2：审批同意；3：审批不同意
	ls_sql+=" and cw_jrbgf.jsrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_jrbgf.jsrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT cw_jrsgdjs.khbh,cw_jrsgdjs.sgd,sgdmc";
	ls_sql+=" FROM cw_jrsgdjs,sq_sgd ";
    ls_sql+=" where cw_jrsgdjs.sgd=sq_sgd.sgd"; 
    ls_sql+=" and cw_jrsgdjs.clzt!='3'";//1：结算；2：审批同意；3：审批不同意
	ls_sql+=" and cw_jrsgdjs.jsrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_jrsgdjs.jsrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" ) ";
	ls_sql+=" order by sgdmc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		sgd=rs.getString("sgd");
		sgdmc=rs.getString("sgdmc");


		String khxm=null;
		String dwmc=null;
		String hth=null;
		String fwmj=null;
		String bjjb=null;
		String bjjbmc=null;
		String zjxxh="";

		double zjxje=0;
		double zqgczjf=0;

		ls_sql=" SELECT khxm,dwmc,hth,fwmj,crm_khxx.bjjb,bjjbmc,zjxje,zqgczjf,zjxxh";
		ls_sql+=" FROM crm_khxx,sq_dwxx,bdm_bjjbbm";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			khxm=rs1.getString("khxm");
			dwmc=rs1.getString("dwmc");
			hth=rs1.getString("hth");
			fwmj=rs1.getString("fwmj");
			bjjb=cf.fillNull(rs1.getString("bjjb"));
			bjjbmc=rs1.getString("bjjbmc");
			zjxje=rs1.getDouble("zjxje");
			zqgczjf=rs1.getDouble("zqgczjf");
			zjxxh=cf.fillNull(rs1.getString("zjxxh"));
		}
		rs1.close();
		ps1.close();


		double ysglk=0;
		double yscfje=0;
		double ysfwmjcz=0;
		double ysclfbfb=0;
		ls_sql="select clfbfb,cfje,fwmjcz,ysglk";
		ls_sql+=" from cw_cflkjl";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ysclfbfb=rs1.getDouble("clfbfb");
			yscfje=rs1.getDouble("cfje");
			ysfwmjcz=rs1.getDouble("fwmjcz");
			ysglk=rs1.getDouble("ysglk");
		}
		rs1.close();
		ps1.close();


		double jsglk=0;
		double cfje=0;
		//拆除金额
		if (!zjxxh.equals(""))
		{
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ls_sql+=" and bj_bjxmmxh.xmxlbm in('0101','0601')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				cfje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (cfje<=400)
			{
				cfje=0;
			}
		}
		else{
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and bj_bjxmmx.xmxlbm in('0101','0601')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				cfje=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
			if (cfje<=400)
			{
				cfje=0;
			}
		}

		
		String lx="";
		ls_sql="select lx";
		ls_sql+=" from  bdm_bjjbbm";
		ls_sql+=" where bjjbbm='"+bjjb+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			lx=rs1.getString("lx");
		}
		rs1.close();
		ps1.close();

		if (lx.equals("2"))//1：非套餐；2：套餐
		{
			zqgczjf=0;
			ls_sql="select tcsgze ";
			ls_sql+=" from  crm_tckhqye";
			ls_sql+=" where khbh='"+khbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zqgczjf=rs1.getDouble("tcsgze");
			}
			rs1.close();
			ps1.close();

			if (!zjxxh.equals(""))
			{
				//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
				ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
				ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
				ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
				ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jsglk=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();
			}
			else{
				jsglk=zqgczjf;
			}


			zjxje=cf.round(jsglk-zqgczjf,2);
		}
		else{
			jsglk=cf.round(zqgczjf+zjxje,2);
		}


		double zqhj=0;//优惠前结算金额
		double zhhj=0;//竣工结算额
		double yhze=0;//结算优惠金额
		
		double qytc=0;//签约提成
		
		double jstc=0;//结算提成

		double yfrgf=0;//人工费

		double flk=0;//辅料款
		double bcfkhj=0;//施工队结算金额
		double sgcb=cf.round(yfrgf+bcfkhj+flk,2);
		xjsgcb+=sgcb;


		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=sgdmc%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=dwmc%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=khbh%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=khxm%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=bjjbmc%></td>


			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=fwmj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ysglk%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zjxje%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cfje%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=jsglk%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qye%></td>



			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zhhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yhze%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=zqhj%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(zhgczjf+zhzjxje,2)%></td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=jstc%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=yfrgf%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=flk%></td>
			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">1</td>

			<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=sgcb%></td>
		</tr>
		<%

	}
	rs.close();
	ps.close();




%>
<tr bgcolor="#FFFFFF"  align="center">
	<td colspan="6" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">小计</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjfwmj)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=pmjj%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjwdzgce-xjqye,2)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqye)%></td>



	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzhhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyhze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">-</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjzqhj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.round(xjzhgczjf+xjzhzjxje,2)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjqytc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qytcbl%>%</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjjstc)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=ztcbl%>%</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjyfrgf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjflk)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;">&nbsp;</td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble(xjsgcb)%></td>
</tr>
</table>
</DIV>

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

