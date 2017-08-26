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

String fgs=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";
String wheresql1="";


if (!(fgs.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
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

wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String yhdlm=(String)session.getAttribute("yhdlm");

String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
int qys=0;
double qye=0;
double suijin=0;
double guanlif=0;
double wdzgce=0;
double zjxje=0;
double zjhze=0;
double sjf=0;
double ssk=0;
double fjje=0;
double gsfje=0;
long fwmj=0;
double sjskhyj=0;
int allqys=0;
double allqye=0;
double allsuijin=0;
double allguanlif=0;
double allwdzgce=0;
double allzjxje=0;
double allzjhze=0;
double allsjf=0;
double allssk=0;
double allfjje=0;
double allgsfje=0;
long allfwmj=0;
double allsjskhyj=0;
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


	ls_sql=" insert into cw_tjlsb42 (xh,yhdlm,fgsbh,qddm,jzsjs,cxhdmc,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4   ,sz5,sz6,sz7,sz8,sz9,sz10,sz11   ) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11";
	ls_sql+=" FROM (";

	ls_sql+=" select fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sum(sz1) sz1,sum(sz2) sz2,sum(sz3) sz3,sum(sz4) sz4,sum(sz5) sz5,sum(sz6) sz6,sum(sz7) sz7,sum(sz8) sz8,sum(sz9) sz9,sum(sz10) sz10,sum(sz11) sz11";
	ls_sql+=" FROM (";

	ls_sql+=" select cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.sjs,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,'0' lx,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(zjxje) sz4 ";
	ls_sql+=" ,sum(cw_qmjzmx.sjf) sz5,sum(sfke) sz6,sum(fjje) sz7,sum(gsfje) sz8,sum(cw_qmjzmx.fwmj) sz9,sum(guanlif) sz10,sum(suijin) sz11";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt!='3' "+wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.sjs,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh";

	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx";

	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//退单
	ls_sql=" insert into cw_tjlsb42 (xh,yhdlm,fgsbh,qddm,jzsjs,cxhdmc,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4   ,sz5,sz6,sz7,sz8,sz9,sz10,sz11   ) ";
	ls_sql+=" select '"+yhdlm+"'||(rownum+100000),'"+yhdlm+"',fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11";
	ls_sql+=" FROM (";

	ls_sql+=" select fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sum(sz1) sz1,sum(sz2) sz2,sum(sz3) sz3,sum(sz4) sz4,sum(sz5) sz5,sum(sz6) sz6,sum(sz7) sz7,sum(sz8) sz8,sum(sz9) sz9,sum(sz10) sz10,sum(sz11) sz11";
	ls_sql+=" FROM (";

	ls_sql+=" select cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.sjs,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh,'0' lx,-1*count(*) sz1,sum(-1*wdzgce) sz2,sum(-1*qye) sz3,sum(-1*zjxje) sz4 ";
	ls_sql+=" ,sum(-1*cw_qmjzmx.sjf) sz5,sum(-1*sfke) sz6,sum(-1*fjje) sz7,sum(-1*gsfje) sz8,sum(cw_qmjzmx.fwmj) sz9,sum(-1*guanlif) sz10,sum(-1*suijin) sz11";
	ls_sql+=" FROM cw_qmjzmx";
	ls_sql+=" where cw_qmjzmx.zt='3' "+wheresql;
	ls_sql+=" group by cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,cw_qmjzmx.sjs,cw_qmjzmx.cxhdbm,cw_qmjzmx.cxhdbmxq,cw_qmjzmx.cxhdbmzh";

	ls_sql+=" )";
	ls_sql+=" group by fgsbh,dwbh,sjs,cxhdbm,cxhdbmxq,cxhdbmzh,lx";

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

		double yjxs12=10;//04：家装设计师业绩系数

		if (!cxhdmc.equals(""))//公司活动
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs22=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs32=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs2=10;//04：家装设计师业绩系数

		yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);

		//yjxs12 04：家装设计师业绩系数
		ls_sql=" update cw_tjlsb42 set  yjxs12=? ";
		ls_sql+=" where xh='"+xh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,yjxs2);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//业绩＝签约额折后*业绩系数+合同管理费
	//sz3:签约额－折后
	//sz10:合同管理费

	ls_sql=" update cw_tjlsb42 set sz13=sz3+sz10";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb42 set sz13=sz3*yjxs12/10+sz10";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();
/*
*/

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师产值统计<BR>
  (结转时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="170%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">排名</td>
  <td  width="5%">设计师</td>
  <td  width="8%">店面</td>
  <td  width="4%">签约数</td>
  <td  width="5%">未打折金额</td>
  <td  width="5%">签约额</td>
	<td  width="5%">税金</td>
	<td  width="5%">管理费</td>
  <td  width="5%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="5%">平均单额</td>
  <td  width="4%">平米均价</td>
  <td  width="5%">设计费</td>
  <td  width="5%">实收款</td>
  <td  width="5%">返卷总额</td>
  <td  width="5%">公司承担返卷</td>
  <td  width="4%">折扣率</td>
  <td  width="6%">设计师业绩</td>
</tr>
<%
	//获取最大数

	ls_sql=" SELECT sjs,dwbh,dwmc,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(guanlif) guanlif,sum(suijin) suijin,sum(sjskhyj) sjskhyj ";
	ls_sql+=" from ( ";
	ls_sql+=" select jzsjs sjs,cw_tjlsb42.qddm dwbh,dwmc";
	ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) zjxje ";
	ls_sql+=" ,sum(sz5) sjf,sum(sz6) sfke,sum(sz7) fjje,sum(sz8) gsfje,sum(sz9) fwmj";
	ls_sql+=" ,sum(sz10) guanlif,sum(sz11) suijin";
	ls_sql+=" ,sum(sz13) sjskhyj";
	
	ls_sql+=" FROM cw_tjlsb42,sq_dwxx";
	ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.qddm=sq_dwxx.dwbh(+)";
	ls_sql+=" group by jzsjs,cw_tjlsb42.qddm,dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT yhmc sjs,sq_yhxx.dwbh,dwmc,0 qys,0 wdzgce,0 qye,0 zjxje,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 guanlif,0 suijin,0 sjskhyj ";
	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sflz in('N')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by sjs,dwmc,dwbh";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getsjs=rs.getString("sjs");
		dm=rs.getString("dwmc");
		dmbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		guanlif=rs.getDouble("guanlif");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");
		sjf=rs.getDouble("sjf");
		ssk=rs.getDouble("sfke");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");
		sjskhyj=rs.getDouble("sjskhyj");

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
		allguanlif+=guanlif;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		allssk+=ssk;
		allfjje+=fjje;
		allgsfje+=gsfje;
		allsjskhyj+=sjskhyj;
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
			<td ><%=row%>
			</td>
			<td ><A HREF="ViewSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><%=getsjs%></A></td>
			<td ><%=dm%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble((int)qye)%></td>
			<td  align="right"><%=cf.formatDouble(suijin)%></td>
			<td  align="right"><%=cf.formatDouble(guanlif)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
			<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
			<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjskhyj)%></td>
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
	<td colspan="3">小计</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allssk)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjskhyj)%></td>
</tr>
</table>
</form> 


</body>
</html>

<%
	ls_sql=" delete from cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
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
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
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

		formName.action="ViewAllSjscz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
function cf_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
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

		formName.action="ViewExecAllSjscz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

