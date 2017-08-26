<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String jzrq=request.getParameter("jzrq");
String dwbh=request.getParameter("dwbh");

String sjfw=jzrq.substring(0,8)+"01";
String sjfw2=jzrq;

String wheresql="";
String wheresql1=" and ssfgs='"+dwbh+"'";


wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
wheresql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty
String ls_sql=null;


try {
	conn=cf.getConnection();

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>店面结转业绩统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 
<table border="1" width="120%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="9%" class="STYLE1">分公司</td>
  <td  width="13%" class="STYLE1">店面</td>
  <td  width="6%" class="STYLE2">签约数</td>
  <td  width="10%" class="STYLE2">折前合同额</td>
  <td  width="10%" class="STYLE2">折后合同额</td>
  <td  width="8%" class="STYLE2">退单额</td>
  <td  width="10%" class="STYLE2">签单-退单</td>
  <td  width="5%" class="STYLE2">签约数比例</td>
  <td  width="5%" class="STYLE2">签约额比例</td>
  <td  width="5%" class="STYLE2">平均单额</td>
  <td  width="5%" class="STYLE2">平米均价</td>
  <td  width="7%" class="STYLE2">设计费</td>
  <td  width="4%" class="STYLE2">折扣率</td>
</tr>
<%
	int allqys=0;
	double allwdzgce=0;
	double allqye=0;
	double allzhzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	long allfwmj=0;

	String getfgsbh=null;
	String getfgsmc=null;
	String getdwbh=null;
	String getdwmc=null;
	String oldfgsmc="";

	int qys=0;
	double qye=0;
	double wdzgce=0;
	double zhzjxje=0;
	long fwmj=0;
	double sjf=0;

	int pjde=0;
	int pmjj=0;
	double zkl=0;
	double qysbfb=0;
	double qyebfb=0;

	double tdje=0;//退单额
	double alltdje=0;

	double yjje=0;//业绩
	double allyjje=0;

	int row=0;


	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(crm_khxx.wdzgce),sum(crm_khxx.qye),sum(NVL(crm_khxx.zhzjxje,0)),sum(NVL(crm_khxx.zhzjxje,0)+crm_khxx.qye),sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)),sum(crm_khxx.fwmj)";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allwdzgce=rs.getDouble(2);
		allqye=rs.getDouble(3);
		allzhzjxje=rs.getDouble(4);
		allzjhze=rs.getDouble(5);
		allsjf=rs.getDouble(6);
		allfwmj=rs.getLong(7);
	}
	rs.close();
	ps.close();


	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allqye==0)
	{
		return;
	}


	ls_sql=" SELECT fgsbh,dwbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,crm_khxx.dwbh,count(*) qys,sum(crm_khxx.qye) qye,sum(crm_khxx.wdzgce) wdzgce,sum(crm_khxx.zhzjxje) zhzjxje,sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)) sjf,sum(crm_khxx.fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT ssfgs,dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F2' and cxbz='N'";
    ls_sql+=" and ssfgs='"+dwbh+"'";
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh";
	ls_sql+=" order by qye desc,fgsbh,dwbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		getdwbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		String cxbz="";
		String kdsj="";
		String gdsj="";
		ls_sql="SELECT dwmc,kdsj,gdsj,cxbz";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));
		}
		rs1.close();
		ps1.close();

		if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
		{
			getdwmc="<font color=\"#FF0033\">"+getdwmc+"("+kdsj+"至"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				getdwmc=getdwmc+"(开店:"+kdsj+")";
			}
		}

		//退单
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx";
		ls_sql+=" where cw_qmjzmx.zt in ('3')";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
		ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;



		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}

		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}


		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		
		row++;

		if (getfgsmc.equals(oldfgsmc))
		{
			getfgsmc="同上";;
		}
		else{
			oldfgsmc=getfgsmc;
		}



		%>
		<tr align="center">
			<td  class="STYLE3"><A HREF="ViewDmcz.jsp?jzrq=<%=jzrq%>&dwbh=<%=getdwbh%>" target="_blank"><%=row%></A></td>
			<td  class="STYLE3"><%=getfgsmc%></td>
			<td  class="STYLE3"><%=getdwmc%></td>
			<td  align="right" class="STYLE4"><%=qys%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(qye)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(tdje)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(yjje)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pjde)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
			<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
		</tr>
		<%	

	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td  class="STYLE3">&nbsp;</td>
	<td  class="STYLE3">总计</td>
	<td  class="STYLE3">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble(allyjje)%></td>
	<td  class="STYLE4">&nbsp;</td>
	<td  class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
</tr>
</table>
</DIV>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>


<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 14px'  >
<tr bgcolor="#CCCCCC"  align="center"  >
  <td  width="3%" >排名</td>
  <td  width="9%" >分公司</td>
  <td  width="6%" >签约数</td>
  <td  width="10%" >折前金额</td>
  <td  width="10%" >折后金额</td>
  <td  width="8%" >退单额</td>
  <td  width="10%" >签单-退单</td>
  <td  width="5%" >签约数比例</td>
  <td  width="5%" >签约额比例</td>
  <td  width="5%" >平均单额</td>
  <td  width="5%" >平米均价</td>
  <td  width="7%" >设计费</td>
  <td  width="4%" >折扣率</td>
</tr>
<%

	row=0;
	alltdje=0;
	allyjje=0;

	ls_sql=" SELECT fgsbh,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT crm_khxx.fgsbh,count(*) qys,sum(crm_khxx.qye) qye,sum(crm_khxx.wdzgce) wdzgce,sum(crm_khxx.zhzjxje) zhzjxje,sum(crm_khxx.sjf+NVL(crm_khxx.sjhtsjf,0)) sjf,sum(crm_khxx.fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,crm_khxx";
	ls_sql+=" where cw_qmjzmx.zt in ('2')";
	ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=" group by crm_khxx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwbh,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");


		ls_sql="SELECT dwmc";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getfgsmc=rs1.getString("dwmc");
		}
		rs1.close();
		ps1.close();

		//退单
		ls_sql="SELECT sum(crm_khxx.qye) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx";
		ls_sql+=" where cw_qmjzmx.zt in ('3')";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and cw_qmjzmx.jzrq=TO_DATE('"+jzrq+"','YYYY-MM-DD')  ";
		ls_sql+=" and cw_qmjzmx.fgsbh='"+getfgsbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye-tdje;
		allyjje+=yjje;

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		row++;

		%>
		<tr align="center">
			<td  ><%=row%></td>
			<td  ><%=getfgsmc%></td>
			<td  align="right"  ><%=qys%></td>
			<td  align="right" ><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right" ><%=cf.formatDouble(qye)%></td>
			<td  align="right" ><%=cf.formatDouble(tdje)%></td>
			<td  align="right" ><%=cf.formatDouble(yjje)%></td>
			<td  align="right" ><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right" ><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right" ><%=cf.formatDouble(pjde)%></td>
			<td  align="right" ><%=cf.formatDouble(pmjj)%></td>
			<td  align="right" ><%=cf.formatDouble(sjf)%></td>
			<td  align="right" ><%=cf.round(zkl,1)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td  align="right" ><%=allqys%></td>
	<td  align="right" ><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right" ><%=cf.formatDouble(allqye)%></td>
	<td  align="right" ><%=cf.formatDouble(alltdje)%></td>
	<td  align="right" ><%=cf.formatDouble(allyjje)%></td>
	<td  >&nbsp;</td>
	<td  >&nbsp;</td>
	<td  align="right" ><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" ><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" ><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" ><%=cf.round(zkl,1)%></td>
</tr>
</table>




</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e+ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close();
		if (conn != null) cf.close(conn); 
 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 

	}
}
%>


