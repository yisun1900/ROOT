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
String yhdlm=(String)session.getAttribute("yhdlm");
String scbdwbh=(String)session.getAttribute("dwbh");

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
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

int qys=0;
double qye=0;
double suijin=0;
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
double allqye=0;
double allsuijin=0;
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
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql=" delete from cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into cw_tjlsb42 (xh,yhdlm,fgsbh,jzsjs,cxhdmc,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4   ,sz5,sz6,sz7,sz8,sz9,sz10,sz11   ,sz12) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,ywy,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12";
	ls_sql+=" FROM (";

	ls_sql+=" select crm_khxx.fgsbh,ywy,cxhdbm,cxhdbmxq,cxhdbmzh,'0' lx,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(zjxje) sz4 ";
	ls_sql+=" ,sum(sjf) sz5,sum(sfke) sz6,sum(fjje) sz7,sum(gsfje) sz8,sum(fwmj) sz9,sum(guanlif) sz10,sum(suijin) sz11";
	ls_sql+=" ,sum(crm_khxx.wdzgce) sz12";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt in('2','5') and ywy is not null";
	ls_sql+=" and crm_khxx.ywy in(select yhmc from sq_yhxx where dwbh='"+scbdwbh+"')";
	ls_sql+=wheresql;
	
	ls_sql+=" group by crm_khxx.fgsbh,ywy,cxhdbm,cxhdbmxq,cxhdbmzh";

	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String xh=null;
	String fgsbh=null;
	String cxhdmc=null;
	String cxhdbmxq=null;
	String cxhdbmzh=null;
	ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
	ls_sql+=" FROM cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		String hdlx1="";
		double yjxs11=10;
		if (!cxhdmc.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx1=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();
		}

		String hdlx2="";
		double yjxs21=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmxq+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx2=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();

		}

		String hdlx3="";
		double yjxs31=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmzh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx3=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();
		}


		ls_sql=" update cw_tjlsb42 set hdlx1=?,yjxs11=?,hdlx2=?,yjxs21=?,hdlx3=?,yjxs31=?";
		ls_sql+=" where xh='"+xh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,hdlx1);
		ps1.setDouble(2,yjxs11);

		ps1.setString(3,hdlx2);
		ps1.setDouble(4,yjxs21);

		ps1.setString(5,hdlx3);
		ps1.setDouble(6,yjxs31);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//业绩＝折前签约额－计算促销成本
	ls_sql=" update cw_tjlsb42 set lx='1',sz13=sz12-sz12*(10-yjxs11)/10-sz12*(10-yjxs21)/10-sz12*(10-yjxs31)/10";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ((cxhdmc is not null and hdlx1!='1') OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	//业绩＝签约额－公司承担返卷
	ls_sql=" update cw_tjlsb42 set sz13=sz3-sz8";
	ls_sql+=" ,sz14=sz3-sz8";
	ls_sql+=" where yhdlm='"+yhdlm+"' and lx='0'";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();


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
<table border="1" width="170%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">&nbsp;</td>
  <td  width="3%">排名</td>
  <td  width="5%">业务员</td>
  <td  width="9%">分公司</td>
  <td  width="4%">签约数</td>
  <td  width="5%">未打折金额</td>
  <td  width="5%">签约额</td>
	<td  width="5%">税金</td>
  <td  width="5%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="5%">平均单额</td>
  <td  width="4%">平米均价</td>
  <td  width="5%">设计费</td>
  <td  width="5%">实收款</td>
  <td  width="5%">返卷总额</td>
  <td  width="5%">公司承担返卷</td>
  <td  width="4%">折扣率</td>
  <td  width="6%">业务员业绩</td>
  <td  width="9%">总额 </td>

</tr>
<%
	//获取最大数
	double maxqye=0;

	ls_sql="SELECT TRUNC(max(sum(sz3)))";
	ls_sql+=" FROM cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ls_sql+=" group by jzsjs";
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

	
	ls_sql=" SELECT ywy,fgsbh,dwmc,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(guanlif) guanlif,sum(suijin) suijin,sum(ywyqye) ywyqye";
	ls_sql+=" from ( ";
	ls_sql+=" select jzsjs ywy,cw_tjlsb42.fgsbh,dwmc";
	ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) zjxje ";
	ls_sql+=" ,sum(sz5) sjf,sum(sz6) sfke,sum(sz7) fjje,sum(sz8) gsfje,sum(sz9) fwmj";
	ls_sql+=" ,sum(sz10) guanlif,sum(sz11) suijin";
	ls_sql+=" ,sum(sz13) ywyqye";
	
	ls_sql+=" FROM cw_tjlsb42,sq_dwxx";
	ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" group by jzsjs,cw_tjlsb42.fgsbh,dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT yhmc ywy,sq_yhxx.ssfgs fgsbh,dwmc,0 qys,0 wdzgce,0 qye,0 zjxje,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 guanlif,0 suijin,0 ywyqye";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and zwbm='19' and sflz in('N')";
	ls_sql+=" and sq_yhxx.dwbh='"+scbdwbh+"')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by ywy,fgsbh,dwmc";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getywy=rs.getString("ywy");
		dm=rs.getString("dwmc");
		fgsbh=rs.getString("fgsbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		ssk=rs.getDouble("sfke");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");
		ywyqye=rs.getDouble("ywyqye");


		zjhze=qye+zjxje;//增减后总额

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

		allqys+=qys;
		allqye+=qye;
		allsuijin+=suijin;
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
			<td  align="right"><%=cf.formatDouble((int)qye)%></td>
			<td  align="right"><%=cf.formatDouble(suijin)%></td>
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
			<td  align="left"><A HREF="ViewYwycz.jsp?jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ywy=<%=getywy%>&fgsbh=<%=fgsbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qye*70/maxqye%>" height="14"></A></td>
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
	<td colspan="4">
	<input type=button value='查看被选业务员签单明细' onclick="cf_submit(listform)">
	<input type=button value='导出EXCEL' onclick="cf_do(listform)">
	</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
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

		formName.action="ViewBmYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
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

		formName.action="ViewExecBmYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

