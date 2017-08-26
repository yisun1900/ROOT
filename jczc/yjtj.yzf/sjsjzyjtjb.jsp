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

String ssdqbm=request.getParameter("ssdqbm");
String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (sq_yhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgsbh.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgsbh+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgsbh+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
}

wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师结转业绩统计(按设计师业绩徘名)</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="210%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
<tr bgcolor="#CCCCCC"  align="center" >
  <td  width="3%" >排名</td>
  <td  width="4%" >设计师</td>
  <td  width="9%" >分公司</td>
  <td  width="7%" >入职时间</td>
  <td  width="7%" >财务收款签约额</td>
  <td  width="6%" >退单额</td>
  <td  width="7%" >业绩</td>
  <td  width="4%" >签单退单数</td>
  <td  width="4%" >签约数比例</td>
  <td  width="7%" >合同金额</td>
  <td  width="4%" >签约额比例</td>
  <td  width="6%" >增减项</td>
  <td  width="7%" >增减后总额 </td>
  <td  width="4%" >平均单额</td>
  <td  width="4%" >平米均价</td>
  <td  width="5%" >设计费</td>
  <td  width="4%" >折扣率</td>
  <td  width="8%" >业绩</td>
</tr>
<%
	int allqys=0;
	double allwdzgce=0;
	double allqye=0;
	double allzhzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	long allfwmj=0;

	double maxqye=0;

	String sjs=null;
	String getsjs=null;
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


	ls_sql="SELECT TRUNC(max(sum(qye+NVL(guanlif,0)+NVL(suijin,0))))";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by sjs";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}

	ls_sql=" SELECT fgsbh,sjs,sum(qys) qys,sum(qye) qye,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(sjf) sjf,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT cw_qmjzmx.fgsbh,cw_qmjzmx.sjs,count(*) qys,sum(DECODE(zt,'3',0,qye+NVL(guanlif,0)+NVL(suijin,0))) qye,sum(DECODE(zt,'3',0,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0))) wdzgce,sum(DECODE(zt,'3',0,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0))) zhzjxje,sum(DECODE(zt,'3',0,sjf)) sjf,sum(fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt in ('2','3')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.sjs";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT ssfgs,yhmc,0 qys,0 qye,0 wdzgce,0 zhzjxje,0 sjf,0 fwmj ";
	ls_sql+=" FROM sq_yhxx";
	ls_sql+=" where zwbm='04' and sfzszg in('Y','N')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,sjs";
	ls_sql+=" order by qye desc,fgsbh,sjs";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgsbh=rs.getString("fgsbh");
		sjs=rs.getString("sjs");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		sjf=rs.getDouble("sjf");
		fwmj=rs.getLong("fwmj");

		getsjs=sjs;

		//退单
		ls_sql="SELECT sum(cw_qmjzmx.qye+NVL(cw_qmjzmx.guanlif,0)+NVL(cw_qmjzmx.suijin,0) + (crm_tddj.stje-crm_tddj.ytje) ) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx,crm_khxx,crm_tddj";
		ls_sql+=" where cw_qmjzmx.fgsbh='"+getfgsbh+"' and cw_qmjzmx.sjs='"+sjs+"'";
		ls_sql+=" and cw_qmjzmx.zt='3' ";
		ls_sql+=" and cw_qmjzmx.khbh=crm_khxx.khbh";
		ls_sql+=" and crm_khxx.tdxh=crm_tddj.tdxh";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		yjje=qye-tdje;

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

		String sfzszg="";
		String rzsj="";
		String lzrq="";
		ls_sql="SELECT rzsj,lzrq,sfzszg";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where zwbm='04' and ssfgs='"+getfgsbh+"' and yhmc='"+sjs+"' order by lrsj desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sfzszg=rs1.getString("sfzszg");
			rzsj=cf.fillHtml(rs1.getDate("rzsj"));
			lzrq=cf.fillNull(rs1.getDate("lzrq"));
		}
		rs1.close();
		ps1.close();

		if (sfzszg.equals("S") || sfzszg.equals("T"))//M: 实习生；Y：转正；N：试用期；D：待岗；S：辞职；T：辞退
		{
			sjs="<font color=\"#FF0033\">"+sjs+"</font>";
			rzsj="<font color=\"#FF0033\">("+rzsj+"至"+lzrq+")</font>";
		}


		alltdje+=tdje;
		allqys+=qys;
		allwdzgce+=wdzgce;
		allqye+=qye;
		allzhzjxje+=zhzjxje;
		allzjhze+=qye+zhzjxje;
		allsjf+=sjf;
		allfwmj+=fwmj;

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
			<td><A HREF="ViewSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=getfgsbh%>&sjs=<%=getsjs%>&jzbz=<%=jzbz%>" target="_blank"><%=row%></A></td>
			<td><%=sjs%></td>
			<td><%=getfgsmc%></td>
			<td><%=rzsj%></td>
			<td><A HREF="ViewSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&fgsbh=<%=getfgsbh%>&sjs=<%=getsjs%>&jzbz=<%=jzbz%>" target="_blank"><%=cf.formatDouble(qye)%></A></td>
			<td><%=cf.formatDouble(tdje)%></td>
			<td><%=cf.formatDouble(yjje)%></td>
			<td><%=qys%></td>
			<td><%=cf.round(qysbfb,1)%>%</td>
			<td><%=cf.formatDouble(wdzgce)%></td>
			<td><%=cf.round(qyebfb,1)%>%</td>
			<td><%=cf.formatDouble((int)zhzjxje)%></td>
			<td><%=cf.formatDouble((int)(qye+zhzjxje))%></td>
			<td><%=cf.formatDouble(pjde)%></td>
			<td><%=cf.formatDouble(pmjj)%></td>
			<td><%=cf.formatDouble(sjf)%></td>
			<td><%=cf.round(zkl,1)%></td>
			<td  align="left"><img src="/images/ColuGif.gif" width="<%=yjje*70/maxqye%>" height="14"></td>
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
	<td>&nbsp;</td>
	<td>总计</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allqye)%></td>
	<td><%=cf.formatDouble(alltdje)%></td>
	<td><%=cf.formatDouble(allyjje)%></td>
	<td><%=allqys%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble(allwdzgce)%></td>
	<td>&nbsp;</td>
	<td><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td><%=cf.formatDouble((long)allzjhze)%></td>
	<td><%=cf.formatDouble((long)pjde)%></td>
	<td><%=cf.formatDouble((long)pmjj)%></td>
	<td><%=cf.formatDouble((long)allsjf)%></td>
	<td><%=cf.round(zkl,1)%></td>
	<td  align="left">&nbsp;</td>
</tr>
</table>
</DIV>


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



