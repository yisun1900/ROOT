<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030204'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[设计师业绩净值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[设计师业绩净值统计]："+xtrzyhmc+"') ";
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
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String wheresql1="";

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}
if (!(dwbh.equals("")))	
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}
if (!(sjs.equals("")))	
{
	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
}


	String ls_sql=null;


	ls_sql="SELECT '',crm_khxx.sjs,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,bjjbmc,DECODE(crm_khxx.zt,'2','签单','3','退单客户','5','设计'),crm_khxx.yjjzsj,crm_khxx.tdyjjzsj,(select sum(fqje) from cw_khfqdj  where cw_khfqdj.scbz='N' and cw_khfqdj.khbh=crm_khxx.khbh),crm_khxx.wdzgce,TO_CHAR(crm_khxx.zkl),crm_khxx.qye,crm_khxx.zhljzjx,crm_khxx.zqgczjf,crm_khxx.zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(crm_khxx.zqsjf,0)+NVL(crm_zxkhxx.sjhtje,0),NVL(crm_khxx.sjf,0)+NVL(crm_zxkhxx.sjhtje,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,crm_khxx.zjxm,crm_khxx.khjl,crm_khxx.ywy,crm_khxx.clgw,crm_khxx.dianz,crm_khxx.weny,TO_CHAR(crm_khxx.fwmj),crm_khxx.cxhdbm,a.dwmc qydm,TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD'),crm_khxx.tdsj,(select lpmc from yx_lqlpdj where yx_lqlpdj.khbh=crm_khxx.khbh and rownum<2) ";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','3','5')";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '',sjs,hth,khxm,fwdz,bjjbmc,'<B><font color=\"#FF0000\">退单业绩</font></B>',yjjzsj,tdyjjzsj,-1*(select sum(fqje) from cw_khfqdj  where cw_khfqdj.scbz='N' and cw_khfqdj.khbh=crm_khxx.khbh),-1*wdzgce,TO_CHAR(zkl),-1*qye,0,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,0,0,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,zjxm,khjl,ywy,clgw,dianz,weny,TO_CHAR(fwmj),cxhdbm,a.dwmc qydm,TO_CHAR(qyrq,'YYYY-MM-DD'),tdsj,(select lpmc from yx_lqlpdj where yx_lqlpdj.khbh=crm_khxx.khbh and rownum<2) ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a ,sq_sgd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.zt='3'";//3：退单客户
	ls_sql+=" and yjjzsj is not null ";//首次付家装款时间
	ls_sql+=" and crm_khxx.tdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.tdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;

	ls_sql+=" order by qydm,sjs,yjjzsj";
	
	
	

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师业绩统计（<%=sjs%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="410%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">退单标志</td>
	<td  width="2%">签单记入业绩时间</td>
	<td  width="2%">退单记入业绩时间</td>
	  <td  width="2%" >返券金额</td>
	<td  width="3%">折前合同总额</td>
	<td  width="1%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="2%">增减项</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="2%">折前税金</td>
	<td  width="2%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="2%">折前管理费</td>
	<td  width="2%">折后管理费</td>
	<td  width="2%">折前记入业绩其它费</td>
	<td  width="2%">折后记入业绩其它费</td>
	<td  width="2%">折前不记业绩其它费</td>
	<td  width="2%">折后不记业绩其它费</td>
	<td  width="2%">折前设计费</td>
	<td  width="2%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="2%">首次收装款时间</td>
	<td  width="2%">财务首次审核时间</td>


	<td  width="2%">返券总金额</td>
	<td  width="2%">公司承担返券额</td>
	<td  width="1%">施工队</td>
	<td  width="1%">质检员</td>
	<td  width="1%">客户经理</td>
	<td  width="1%">业务员</td>
	<td  width="1%">材料员</td>
	<td  width="1%">店长</td>
	<td  width="1%">文员</td>
	<td  width="1%">面积</td>
	<td  width="8%">促销活动</td>
	<td  width="3%">签约店面</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">退单时间</td>
	<td  width="43%">领取礼品</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
	pageObj.printFoot();
%> 
</table>
</body>
</html>