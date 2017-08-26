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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");

String wheresql="";
String wheresql1="";
String wheresql2="";//ty

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}


wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

wheresql2+=" and lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";//ty 咨询录入时间
wheresql2+=" and lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String djyj=request.getParameter("djyj");
String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

PreparedStatement ps1=null;//ty
ResultSet rs1=null;//ty

try {
	conn=cf.getConnection();

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：大小单统计："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();


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
  <B>大小单统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 

<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="8%">分公司</td>
  <td  width="6%">店面</td>
  <td  width="10%">单额分类</td>
  <td  width="7%">签约数</td>
  <td  width="9%">签约数比例</td>
  <td  width="10%">合同金额</td>
  <td  width="10%">签约额</td>
  <td  width="9%">签约额比例</td>
  <td  width="7%">折扣率</td>
  <td  width="9%">平均单额</td>
  <td  width="7%">平米均价</td>
  <td  width="8%">管理费</td>
</tr>
<%
	//获取最大数
	double maxqye=0;
	String getfgs=null;
	String getfgsbh=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	int qys=0;
	double zqye=0;
	int xjqys=0;//店面签约数
	double xjzqye=0;//店面签约额
	double wdzgce=0;
	double zjxje=0;
	long fwmj=0;
	double glf=0;//管理费


	int allqys=0;
	double allzqye=0;
	double zkl=0;
	int pjde=0;
	int pmjj=0;

	double qysbfb=0;
	double qyebfb=0;

	String dxdmc[]={"3万以下","3万-4万","4万-5万","5万-6万","6万-7万","7万-8万","8万-9万","9万-10万","10万-15万","15万-20万","20万-30万","30万以上"};//大小单范围
	int dxdfw[]={0,30000,40000,50000,60000,70000,80000,90000,100000,150000,200000,300000,999999999};//大小单金额范围
	int num=0;//数组计数器
	int num1=0;//大小单范围计数器
	int num2=0;//店面计数器
	int dms=0;//店面数

	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(qye)";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt(1);
		allzqye=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allzqye==0)
	{
		return;
	}

	ls_sql="SELECT TRUNC(max(sum(qye)))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
//分公司店面循环
	ls_sql=" SELECT b.dwmc fgs,b.dwbh fgsbh,a.dwbh dwbh,a.dwmc dm ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;
	ls_sql+="order by fgs,dwbh";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getfgsbh=rs.getString("fgsbh");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");

		xjqys=0;
		xjzqye=0;
//店面签约数 签约额
		ls_sql="SELECT  count(*) qys, sum(wdzgce) wdzgce,sum(qye) zqye,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where  crm_khxx.zt='2' and crm_khxx.dwbh='"+getdwbh+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			xjqys=rs1.getInt("qys");
			xjzqye=rs1.getDouble("zqye");
		}
		rs1.close();
		ps1.close();

//店面数
		ls_sql="SELECT  count(*) dms ";
		ls_sql+=" FROM sq_dwxx a";
		ls_sql+=" where a.ssfgs='"+getfgsbh+"' and a.dwlx='F2' and a.cxbz='N'";
		ls_sql+=wheresql1;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			dms=rs1.getInt("dms");
		}
		rs1.close();
		ps1.close();
//大小单范围循环
		for(num=0;num<=11;num++){
			ls_sql="SELECT  count(*) qys, sum(wdzgce) wdzgce,sum(qye) zqye,sum(fwmj) fwmj,sum(glf) glf ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where qye>="+dxdfw[num]+" and qye<"+dxdfw[num+1]+" and crm_khxx.zt='2' and crm_khxx.dwbh='"+getdwbh+"'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				qys=rs1.getInt("qys");
				wdzgce=rs1.getDouble("wdzgce");
				zqye=rs1.getDouble("zqye");
				fwmj=rs1.getLong("fwmj");
				glf=rs1.getDouble("glf");
			}
			rs1.close();
			ps1.close();
//			qysbfb=0;

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}


			qysbfb=qys*100.0/xjqys;//签约数百分比
			qyebfb=zqye*100.0/xjzqye;//签约额比例

		%>
		<tr align="center">
			<%if(num1==0)//如果是第一行进行合并
			{//进行合并店面数*12就是要合并的行数%>
			<td rowSpan="<%=dms*12%>"><%=getfgs%></td>
			<%}%>
			<%if(num==0)//如果是第一行进行合并
			{%>
			<td rowSpan="12"><%=dm%></td>
			<%}%>
			<td ><%=dxdmc[num]%></td>
			<%if(qys!=0)
			{%>
			<td  align="right"><font color=red><%=qys%></font></td>
			<%}
			  else{%>
			<td  align="right"><%=qys%></td>
			  <%}%>
			<td  align="right"><%=cf.round(qysbfb,1)%>%</td>
			<%if(wdzgce!=0)
			{%>
			<td  align="right"><font color=red><%=cf.formatDouble((int)wdzgce)%></font></td>
			<%}
			  else{%>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			  <%}%>
			<%if(zqye!=0)
			{%>
			<td  align="right"><font color=red><%=cf.formatDouble((int)zqye)%></font></td>
			<%}
			  else{%>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			  <%}%>
			<td  align="right"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<%if(pjde!=0)
			{%>
			<td  align="right"><font color=red><%=cf.formatDouble(pjde)%></font></td>
			<%}
			  else{%>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			  <%}%>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble((int)glf)%></td>
		</tr>
		<%	
			num1++;//如果还是同一个分公司让num自加1，
		}
			num2++;//对店面进行计数
			if(num2==dms)//如果计数值与店面数相同
			{
			num2=0;//店面计数器归0
			num1=0;//计数器归零
			}
	}
	rs.close();
	ps.close();

%>

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

