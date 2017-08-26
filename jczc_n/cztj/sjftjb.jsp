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
String yhjs=(String)session.getAttribute("yhjs");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=request.getParameter("ssdqbm");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";
String wheresql3="";

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
	wheresql2+=" and  (crm_zxkhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql3+=" and  (cw_khfkjl.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	wheresql2+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";
	wheresql3+=" and  (cw_khfkjl.fgsbh='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
	wheresql2+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	wheresql3+=" and  cw_khfkjl.dwbh='"+dwbh+"'";
}

String yhdlm=(String)session.getAttribute("yhdlm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty

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
  <B>设计费统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 

  <table border="1" width="1870px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="3" width="40px">排名</td>
      <td rowspan="3" width="110px">分公司</td>
      <td rowspan="3" width="220px">店面</td>
      <td colspan="5" bgcolor="#CCCCFF">签单录入</td>
      <td colspan="15" bgcolor="#CCFFFF">财务实收</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">签约数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">签约额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">录入设计费客户数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">录入设计费额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">平米设计费</td>
      <td rowspan="2" width="90px" bgcolor="#CCFFFF">本期实收合计</td>
      <td colspan="6" bgcolor="#CCCCFF">本期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">纯设计客户</td>
      <td colspan="2" bgcolor="#CCCCFF">前期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">咨询客户</td>
      <td colspan="2" bgcolor="#CCCCFF">退单客户</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="70px"  bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">累计收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费/签单额</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费数/签单数量</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="70px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
    </tr>
    <%
	//获取最大数
	String fgsmc=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	int qys=0;
	double qye=0;

	double sjf=0;
	int sjfkhs=0;//收设计费数量
	long sjffwmj=0;//收取设计费客户房屋面积

	int bqsssjfkhs=0;
	double bqsssjf=0;
	int ljsssjfkhs=0;
	double ljsssjf=0;
	int qdhtdkhs=0;
	double qdhtdsjf=0;
	int qqsssjfkhs=0;
	double qqsssjf=0;

	int csjkhs=0;//纯设计客户
	double csjkhsjf=0;//纯设计客户

	int qtkhs=0;//退单客户
	double qtkhsjf=0;//退单客户

	int sssjfkhszx=0;
	double sssjfzx=0;

	double sjfpmjj=0;//
	double sjsbfb=0;//设计数百分比
	double sjebfb=0;//设计额百分比

	int row=0;

	int allqys=0;
	double allqye=0;

	double allsjf=0;
	int allsjfkhs=0;//收设计费数量
	long allsjffwmj=0;//收取设计费客户房屋面积

	int allbqsssjfkhs=0;
	double allbqsssjf=0;
	int allljsssjfkhs=0;
	double allljsssjf=0;
	int allqdhtdkhs=0;
	double allqdhtdsjf=0;
	int allqqsssjfkhs=0;
	double allqqsssjf=0;

	int allcsjkhs=0;//纯设计客户
	double allcsjkhsjf=0;//纯设计客户

	int allqtkhs=0;//退单客户
	double allqtkhsjf=0;//退单客户

	int allsssjfkhszx=0;
	double allsssjfzx=0;

	double sshj=0;
	double allsshj=0;

	ls_sql=" SELECT fgsbh,fgs,dwbh,dm";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT cw_khfkjl.fgsbh,a.dwmc fgs,cw_khfkjl.dwbh dwbh,b.dwmc dm";

	ls_sql+=" FROM cw_khfkjl,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
	ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
	ls_sql+=" and cw_khfkjl.fkje!='0'  ";
	ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
	ls_sql+=" and cw_khfkjl.fgsbh=a.dwbh(+) and cw_khfkjl.dwbh=b.dwbh(+)";
	ls_sql+=wheresql3;

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT a.ssfgs fgsbh,b.dwmc fgs,a.dwbh dwbh,a.dwmc dm";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+=" group by a.ssfgs,b.dwmc,a.dwbh,a.dwmc ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,fgs,dwbh,dm";
	ls_sql+=" order by fgsbh,dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsmc=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");

		ls_sql=" SELECT count(*) qys,sum(qye) qye";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qys=rs1.getInt("qys");
			qye=rs1.getDouble("qye");
		}
		rs1.close();
		ps1.close();


		//签单录入:设计费
		ls_sql="SELECT count(*),sum(fwmj),sum(sjf) ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sjf is not null and sjf!='0'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfkhs=rs1.getInt(1);
			sjffwmj=rs1.getLong(2);
			sjf=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		//财务实收：本期实收设计费（本期家装客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			bqsssjfkhs=rs1.getInt(1);
			bqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收：累计收设计费（本期家装客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";

		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljsssjfkhs=rs1.getInt(1);
			ljsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收：前期签单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and (crm_khxx.qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') OR crm_khxx.qyrq>TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" and crm_khxx.zt='2'";

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qqsssjfkhs=rs1.getInt(1);
			qqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

	
		//财务实收：纯设计客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.zt='5'";

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			csjkhs=rs1.getInt(1);
			csjkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	
	
		//财务实收：家装退单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qtkhs=rs1.getInt(1);
			qtkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	
		
		

		//财务实收：咨询客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_zxkhxx,cw_khfkjl";
		ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh and crm_zxkhxx.zxdm='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.zxzt!='3'";

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N' ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sssjfkhszx=rs1.getInt(1);
			sssjfzx=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

	

		sshj=bqsssjf+csjkhsjf+qqsssjf+qtkhsjf+sssjfzx;//本期实收合计=本期家装客户＋纯设计客户＋前期签单客户＋家装退单客户＋咨询客户

		allsshj+=sshj;

		
		allqys+=qys;
		allqye+=qye;

		allsjf+=sjf;
		allsjfkhs+=sjfkhs;//收设计费数量
		allsjffwmj+=sjffwmj;//收取设计费客户房屋面积

		allbqsssjfkhs+=bqsssjfkhs;
		allbqsssjf+=bqsssjf;
		allljsssjfkhs+=ljsssjfkhs;
		allljsssjf+=ljsssjf;

		allqqsssjfkhs+=qqsssjfkhs;
		allqqsssjf+=qqsssjf;

		allcsjkhs+=csjkhs;
		allcsjkhsjf+=csjkhsjf;

		allqtkhs+=qtkhs;
		allqtkhsjf+=qtkhsjf;

		allsssjfkhszx+=sssjfkhszx;
		allsssjfzx+=sssjfzx;
		
		
		
		if (sjffwmj==0)
		{
			sjfpmjj=0;
		}
		else{
			sjfpmjj=(int)(sjf/sjffwmj);
		}

		if (qys==0)
		{
			sjsbfb=0;
		}
		else{
			sjsbfb=ljsssjfkhs*100.0/qys;
		}
		if (qye==0)
		{
			sjebfb=0;
		}
		else{
			sjebfb=ljsssjf*100.0/qye;
		}


		row++;

		if (fgsmc.equals(oldfgs))
		{
			fgsmc="同上";;
		}
		else{
			oldfgs=fgsmc;
		}


		%> 
    <tr align="center"> 
      <td class="STYLE3"><%=row%></td>
      <td class="STYLE3"><%=fgsmc%></td>
      <td class="STYLE3"><%=dm%></td>
      <td  align="right" class="STYLE4"><%=qys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)qye)%></td>
      <td  align="right" class="STYLE4"><%=sjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>

      <td  align="right" class="STYLE4">
	  <A HREF="ViewSjfdmMx.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=cf.formatDouble(sshj)%></A></td>

      <td  align="right" class="STYLE4"><%=bqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(bqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=ljsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(ljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=csjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(csjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=qqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=sssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=qtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qtkhsjf)%></td>
    </tr>
    <%	

	}
	rs.close();
	ps.close();



	if (allsjffwmj==0)
	{
		sjfpmjj=0;
	}
	else{
		sjfpmjj=(int)(allsjf/allsjffwmj);
	}

	if (allqys==0)
	{
		sjsbfb=0;
	}
	else{
		sjsbfb=allljsssjfkhs*100.0/allqys;
	}
	if (allqye==0)
	{
		sjebfb=0;
	}
	else{
		sjebfb=allljsssjf*100.0/allqye;
	}
%> 
    <tr align="center"> 
      <td class="STYLE3" colspan="2">总计</td>
      <td class="STYLE3">&nbsp;</td>
      <td  align="right" class="STYLE4"><%=allqys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)allqye)%></td>
      <td  align="right" class="STYLE4"><%=allsjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>

      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsshj)%></td>

      <td  align="right" class="STYLE4"><%=allbqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allbqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=allljsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=allcsjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allcsjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=allqqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=allsssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=allqtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqtkhsjf)%></td>
    </tr>
  </table>
  </DIV>




<DIV onselectstart="return false" class="STYLE_DIV"> 

  <table border="1" width="1750px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="3" width="40px">排名</td>
      <td rowspan="3" width="110px">分公司</td>
      <td colspan="5" bgcolor="#CCCCFF">签单录入</td>
      <td colspan="15" bgcolor="#CCFFFF">财务实收</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">签约数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">签约额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">录入计费客户数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">录入设计费额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">平米设计费</td>

      <td rowspan="2" width="90px" bgcolor="#CCFFFF">本期实收合计</td>
      <td colspan="6" bgcolor="#CCCCFF">本期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">纯设计客户</td>
      <td colspan="2" bgcolor="#CCCCFF">前期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">咨询客户</td>
      <td colspan="2" bgcolor="#CCCCFF">退单客户</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="70px"  bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">累计收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费/签单额</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费数/签单数量</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="70px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
    </tr>
    <%
	//获取最大数
	allsshj=0;

	
	allqys=0;
	allqye=0;

	allsjf=0;
	allsjfkhs=0;//收设计费数量
	allsjffwmj=0;//收取设计费客户房屋面积

	allbqsssjfkhs=0;
	allbqsssjf=0;
	allljsssjfkhs=0;
	allljsssjf=0;

	allqqsssjfkhs=0;
	allqqsssjf=0;

	allcsjkhs=0;
	allcsjkhsjf=0;

	allqtkhs=0;
	allqtkhsjf=0;

	allsssjfkhszx=0;
	allsssjfzx=0;

	row=0;

	ls_sql=" SELECT fgs,dwbh,sum(qys) qys,sum(qye) qye";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT a.dwmc fgs,crm_khxx.fgsbh dwbh,count(*) qys,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a";
	ls_sql+=" where crm_khxx.fgsbh=a.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by a.dwmc,crm_khxx.fgsbh";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc fgs,dwbh dwbh,0 qys,0 qye";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,dwbh";
	ls_sql+=" order by qye desc,dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsmc=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");

		//签单录入－设计费
		ls_sql="SELECT count(*),sum(fwmj),sum(sjf) ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sjf is not null and sjf!='0'  ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfkhs=rs1.getInt(1);
			sjffwmj=rs1.getLong(2);
			sjf=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		//财务实收－本期实收设计费（本期签单客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			bqsssjfkhs=rs1.getInt(1);
			bqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－累计收设计费（本期签单客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljsssjfkhs=rs1.getInt(1);
			ljsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－前期签单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and (crm_khxx.qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') OR crm_khxx.qyrq>TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qqsssjfkhs=rs1.getInt(1);
			qqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	


	
		//财务实收－纯设计客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.zt='5'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			csjkhs=rs1.getInt(1);
			csjkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	
	
		//财务实收－退单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh='"+getdwbh+"'";
		ls_sql+=" and crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qtkhs=rs1.getInt(1);
			qtkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－咨询客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_zxkhxx,cw_khfkjl";
		ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh and crm_zxkhxx.ssfgs='"+getdwbh+"'";
		ls_sql+=" and crm_zxkhxx.zxzt!='3'";
		ls_sql+=wheresql2;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sssjfkhszx=rs1.getInt(1);
			sssjfzx=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	


		sshj=bqsssjf+csjkhsjf+qqsssjf+qtkhsjf+sssjfzx;

		allsshj+=sshj;

		
		allqys+=qys;
		allqye+=qye;

		allsjf+=sjf;
		allsjfkhs+=sjfkhs;//收设计费数量
		allsjffwmj+=sjffwmj;//收取设计费客户房屋面积

		allbqsssjfkhs+=bqsssjfkhs;
		allbqsssjf+=bqsssjf;
		allljsssjf+=ljsssjf;
		allljsssjfkhs+=ljsssjfkhs;

		allqqsssjfkhs+=qqsssjfkhs;
		allqqsssjf+=qqsssjf;

		allcsjkhs+=csjkhs;
		allcsjkhsjf+=csjkhsjf;

		allqtkhs+=qtkhs;
		allqtkhsjf+=qtkhsjf;

		allsssjfkhszx+=sssjfkhszx;
		allsssjfzx+=sssjfzx;
		
		
		
		if (sjffwmj==0)
		{
			sjfpmjj=0;
		}
		else{
			sjfpmjj=(int)(sjf/sjffwmj);
		}

		if (qys==0)
		{
			sjsbfb=0;
		}
		else{
			sjsbfb=ljsssjfkhs*100.0/qys;
		}
		if (qye==0)
		{
			sjebfb=0;
		}
		else{
			sjebfb=ljsssjf*100.0/qye;
		}


		row++;


		%> 
    <tr align="center"> 
      <td class="STYLE3"><%=row%></td>
      <td class="STYLE3"><%=fgsmc%></td>
      <td  align="right" class="STYLE4"><%=qys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)qye)%></td>
      <td  align="right" class="STYLE4"><%=sjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>

      <td  align="right" class="STYLE4">
		<%
		  if ((yhjs.equals("F2")) || (yhjs.equals("F2")))
		{
		  out.print(cf.formatDouble(sshj));
		}
	  else
		{
		  %>
		  <A HREF="ViewSjfMx.jsp?dwbh=<%=getdwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target="_blank"><%=cf.formatDouble(sshj)%></A></td>
		  <%
		}
		%>
	  

      <td  align="right" class="STYLE4"><%=bqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(bqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(ljsssjfkhs)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(ljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=csjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(csjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=qqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=sssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=qtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qtkhsjf)%></td>
    </tr>
    <%	

	}
	rs.close();
	ps.close();

	if (allsjffwmj==0)
	{
		sjfpmjj=0;
	}
	else{
		sjfpmjj=(int)(allsjf/allsjffwmj);
	}

	if (allqys==0)
	{
		sjsbfb=0;
	}
	else{
		sjsbfb=allljsssjfkhs*100.0/allqys;
	}
	if (allqye==0)
	{
		sjebfb=0;
	}
	else{
		sjebfb=allljsssjf*100.0/allqye;
	}
%> 
    <tr align="center"> 
      <td class="STYLE3" colspan="2">总计</td>
      <td  align="right" class="STYLE4"><%=allqys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)allqye)%></td>
      <td  align="right" class="STYLE4"><%=allsjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsshj)%></td>

      <td  align="right" class="STYLE4"><%=allbqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allbqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allljsssjfkhs)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=allcsjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allcsjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=allqqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=allsssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=allqtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqtkhsjf)%></td>
    </tr>
  </table>
  </DIV>




<DIV onselectstart="return false" class="STYLE_DIV"> 

  <table border="1" width="1750px" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' >
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="3" width="40px">排名</td>
      <td rowspan="3" width="110px">大区</td>
      <td colspan="5" bgcolor="#CCCCFF">签单录入</td>
      <td colspan="15" bgcolor="#CCFFFF">财务实收</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">签约数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">签约额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">录入计费客户数</td>
      <td rowspan="2" width="90px" bgcolor="#CCCCFF">录入设计费额</td>
      <td rowspan="2" width="70px" bgcolor="#CCCCFF">平米设计费</td>

      <td rowspan="2" width="90px" bgcolor="#CCFFFF">本期实收合计</td>
      <td colspan="6" bgcolor="#CCCCFF">本期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">纯设计客户</td>
      <td colspan="2" bgcolor="#CCCCFF">前期家装客户</td>
      <td colspan="2" bgcolor="#CCFFFF">咨询客户</td>
      <td colspan="2" bgcolor="#CCCCFF">退单客户</td>
    </tr>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td  width="70px"  bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">累计收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费/签单额</td>
      <td  width="70px" bgcolor="#CCCCFF">累计收设计费数/签单数量</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="70px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCFFFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCFFFF">本期实收设计费</td>
      <td  width="70px" bgcolor="#CCCCFF">本期交设计费客户数</td>
      <td  width="90px" bgcolor="#CCCCFF">本期实收设计费</td>
    </tr>
    <%
	//获取最大数
	allsshj=0;

	
	allqys=0;
	allqye=0;

	allsjf=0;
	allsjfkhs=0;//收设计费数量
	allsjffwmj=0;//收取设计费客户房屋面积

	allbqsssjfkhs=0;
	allbqsssjf=0;
	allljsssjfkhs=0;
	allljsssjf=0;

	allqqsssjfkhs=0;
	allqqsssjf=0;

	allcsjkhs=0;
	allcsjkhsjf=0;

	allqtkhs=0;
	allqtkhsjf=0;

	allsssjfkhszx=0;
	allsssjfzx=0;

	row=0;

	ls_sql=" SELECT a.ssdqbm,count(*) qys,sum(qye) qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a";
	ls_sql+=" where crm_khxx.fgsbh=a.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by a.ssdqbm";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getdwbh=rs.getString("ssdqbm");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");

		String fgsssdq=null;

		ls_sql="SELECT  ssdqmc";
		ls_sql+=" FROM sq_ssdqbm";
		ls_sql+=" where ssdqbm='"+getdwbh+"'";
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			fgsssdq=rs1.getString("ssdqmc");
		}
		rs1.close();
		ps1.close();

		//签单录入－设计费
		ls_sql="SELECT count(*),sum(fwmj),sum(sjf) ";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"')";
		ls_sql+=wheresql;
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and sjf is not null and sjf!='0'  ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfkhs=rs1.getInt(1);
			sjffwmj=rs1.getLong(2);
			sjf=rs1.getDouble(3);
		}
		rs1.close();
		ps1.close();

		//财务实收－本期实收设计费（本期签单客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			bqsssjfkhs=rs1.getInt(1);
			bqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－累计收设计费（本期签单客户）
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			ljsssjfkhs=rs1.getInt(1);
			ljsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－前期签单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and (crm_khxx.qyrq<TO_DATE('"+sjfw+"','YYYY-MM-DD') OR crm_khxx.qyrq>TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qqsssjfkhs=rs1.getInt(1);
			qqsssjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

	
		//财务实收－纯设计客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and crm_khxx.zt='5'";
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			csjkhs=rs1.getInt(1);
			csjkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	
	
		//财务实收－退单客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
		ls_sql+=wheresql;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'  ";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			qtkhs=rs1.getInt(1);
			qtkhsjf=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	

		//财务实收－咨询客户
		ls_sql="SELECT count(distinct cw_khfkjl.khbh),sum(cw_khfkjl.fkje) ";
		ls_sql+=" FROM crm_zxkhxx,cw_khfkjl";
		ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh and crm_zxkhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+getdwbh+"') ";
		ls_sql+=" and crm_zxkhxx.zxzt!='3' ";
		ls_sql+=wheresql2;

		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and cw_khfkjl.scbz='N'";//N：未删除；Y：已删除
		ls_sql+=" and cw_khfkjl.fklxbm='53'  ";//53：设计费
		ls_sql+=" and cw_khfkjl.fkje!='0'  ";
		ls_sql+=" and ( cw_khfkjl.skdd='1'  OR (cw_khfkjl.skdd='2' and cw_khfkjl.dsksjbz='Y') )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			sssjfkhszx=rs1.getInt(1);
			sssjfzx=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();	


		sshj=bqsssjf+csjkhsjf+qqsssjf+qtkhsjf+sssjfzx;

		allsshj+=sshj;

		
		allqys+=qys;
		allqye+=qye;

		allsjf+=sjf;
		allsjfkhs+=sjfkhs;//收设计费数量
		allsjffwmj+=sjffwmj;//收取设计费客户房屋面积

		allbqsssjfkhs+=bqsssjfkhs;
		allbqsssjf+=bqsssjf;
		allljsssjfkhs+=ljsssjfkhs;
		allljsssjf+=ljsssjf;

		allqqsssjfkhs+=qqsssjfkhs;
		allqqsssjf+=qqsssjf;

		allcsjkhs+=csjkhs;
		allcsjkhsjf+=csjkhsjf;

		allqtkhs+=qtkhs;
		allqtkhsjf+=qtkhsjf;

		allsssjfkhszx+=sssjfkhszx;
		allsssjfzx+=sssjfzx;
		
		
		
		if (sjffwmj==0)
		{
			sjfpmjj=0;
		}
		else{
			sjfpmjj=(int)(sjf/sjffwmj);
		}

		if (qys==0)
		{
			sjsbfb=0;
		}
		else{
			sjsbfb=ljsssjfkhs*100.0/qys;
		}
		if (qye==0)
		{
			sjebfb=0;
		}
		else{
			sjebfb=ljsssjf*100.0/qye;
		}


		row++;

		%> 
    <tr align="center"> 
      <td class="STYLE3"><%=row%></td>
      <td class="STYLE3"><%=fgsssdq%></td>
      <td  align="right" class="STYLE4"><%=qys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)qye)%></td>
      <td  align="right" class="STYLE4"><%=sjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sshj)%></td>

      <td  align="right" class="STYLE4"><%=bqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(bqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=ljsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(ljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=csjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(csjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=qqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=sssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=qtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(qtkhsjf)%></td>
    </tr>
    <%	

	}
	rs.close();
	ps.close();

	if (allsjffwmj==0)
	{
		sjfpmjj=0;
	}
	else{
		sjfpmjj=(int)(allsjf/allsjffwmj);
	}

	if (allqys==0)
	{
		sjsbfb=0;
	}
	else{
		sjsbfb=allljsssjfkhs*100.0/allqys;
	}
	if (allqye==0)
	{
		sjebfb=0;
	}
	else{
		sjebfb=allljsssjf*100.0/allqye;
	}
%> 
    <tr align="center"> 
      <td class="STYLE3" colspan="2">总计</td>
      <td  align="right" class="STYLE4"><%=allqys%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble((int)allqye)%></td>
      <td  align="right" class="STYLE4"><%=allsjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(sjfpmjj)%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsshj)%></td>

      <td  align="right" class="STYLE4"><%=allbqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allbqsssjf)%></td>
      <td  align="right" class="STYLE4"><%=allljsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allljsssjf)%></td>
      <td  align="right" class="STYLE4"><%=cf.round(sjebfb,1)%>%</td>
      <td  align="right" class="STYLE4"><%=cf.round(sjsbfb,1)%>%</td>

      <td  align="right" class="STYLE4"><%=allcsjkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allcsjkhsjf)%></td>

      <td  align="right" class="STYLE4"><%=allqqsssjfkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqqsssjf)%></td>

      <td  align="right" class="STYLE4"><%=allsssjfkhszx%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allsssjfzx)%></td>

      <td  align="right" class="STYLE4"><%=allqtkhs%></td>
      <td  align="right" class="STYLE4"><%=cf.formatDouble(allqtkhsjf)%></td>
    </tr>
  </table>
  </DIV>




</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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


