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

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

String getywy=null;
String olddm="";
String dm=null;
String fgsbh=null;
int qys=0;
double zqye=0;
double wdzgce=0;
double zjxje=0;
double zjhze=0;
double sjf=0;
double ssk=0;
double fjje=0;
double gsfje=0;
long fwmj=0;
double ywyqye=0;
int allqys=0;
double allzqye=0;
double allwdzgce=0;
double allzjxje=0;
double allzjhze=0;
double allsjf=0;
double allssk=0;
double allfjje=0;
double allgsfje=0;
long allfwmj=0;
double allywyqye=0;
double zkl=0;
int pjde=0;
int pmjj=0;

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
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
  <B>业务员产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="140%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">&nbsp;</td>
  <td  width="3%">排名</td>
  <td  width="5%">业务员</td>
  <td  width="9%">分公司</td>
  <td  width="4%">签约数</td>
  <td  width="6%">未打折金额</td>
  <td  width="6%">签约额</td>
  <td  width="6%">增减项</td>
  <td  width="6%">增减后总额 </td>
  <td  width="5%">平均单额</td>
  <td  width="4%">平米均价</td>
  <td  width="5%">设计费</td>
  <td  width="6%">实收款</td>
  <td  width="5%">返卷总额</td>
  <td  width="5%">公司承担返卷</td>
  <td  width="4%">折扣率</td>
  <td  width="6%">业务员业绩</td>
  <td  width="9%">总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;

	ls_sql="SELECT TRUNC(max(sum(qye)))";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt in('2','5') and ywy is not null";
	ls_sql+=wheresql;
	ls_sql+=" group by ywy";
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



	ls_sql=" SELECT dwmc,fgsbh,ywy,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(ywyqye) ywyqye";
	ls_sql+=" from ";
	ls_sql+=" ( ";
	ls_sql+=" SELECT dwmc,crm_khxx.fgsbh,ywy,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.ywyzkl/10) ywyqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_khxx.zt in('2','5') and ywy is not null";
	ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and crm_khxx.fgsbh=jc_cxhd.fgsbh(+) and jc_cxhd.hdlx='2'";
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc,crm_khxx.fgsbh,ywy";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,crm_khxx.fgsbh,ywy,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) ywyqye";
	ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh ";
	ls_sql+=" and crm_khxx.zt in('2','5') and ywy is not null";
	ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and crm_khxx.fgsbh=jc_cxhd.fgsbh(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
	ls_sql+=wheresql;
	ls_sql+=" group by dwmc,crm_khxx.fgsbh,ywy";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc,sq_yhxx.ssfgs fgsbh,yhmc ywy,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 ywyqye";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and zwbm='19' and sfzszg in('Y','N')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}

	ls_sql+=" ) ";

	ls_sql+=" group by dwmc,fgsbh,ywy";
	ls_sql+=" order by zqye desc";
	//out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getywy=rs.getString("ywy");
		dm=rs.getString("dwmc");
		fgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		zqye=rs.getDouble("zqye");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
		zjhze=rs.getDouble("zjhze");
		sjf=rs.getDouble("sjf");
		ssk=rs.getDouble("sfke");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");
		ywyqye=rs.getDouble("ywyqye");

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

		allqys+=qys;
		allzqye+=zqye;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		allssk+=ssk;
		allfjje+=fjje;
		allgsfje+=gsfje;
		allywyqye+=ywyqye;
		allzjxje+=zjxje;
		allzjhze+=zjhze;
		row++;

		if (dm.equals(olddm))
		{
		}
		else{
			olddm=dm;
			if (bgcolor.equals("#FFFFFF"))
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}
		}

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><input name="ywy" type="checkbox" value='<%=getywy+"+"+fgsbh%>' checked></td>
			<td ><%=row%>
			</td>
			<td ><%=getywy%></td>
			<td ><%=dm%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
			<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
			<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)ywyqye)%></td>
			<td  align="left"><A HREF="ViewYwycz.jsp?jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ywy=<%=getywy%>&fgsbh=<%=fgsbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*70/maxqye%>" height="14"></A></td>
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
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td colspan="4">
	<input type=button value='查看被选业务员签单明细' onclick="cf_submit(listform)">
	<input type=button value='导出EXCEL' onclick="cf_do(listform)">
	</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allssk)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((long)allywyqye)%></td>
	<td  align="left">&nbsp;</td>
</tr>
</table>
</form> 


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.ywy.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.ywy[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewAllYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
function cf_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.ywy.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.ywy[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewExecAllYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

