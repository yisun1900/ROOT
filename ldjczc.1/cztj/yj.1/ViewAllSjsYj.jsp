<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030208'");
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

	ls_sql="SELECT '',a.dwmc qydm,sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),sgdmc,zjxm,cxhdbm,wdzgce,TO_CHAR(zkl),qye,zhljzjx,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,yjjzsj,tdsj,TO_CHAR(qyrq,'YYYY-MM-DD') ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.zt in('2','3','5')";
	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT '',a.dwmc qydm,sjs,hth,khxm,fwdz,'<B>已退单</B>',sgdmc,zjxm,cxhdbm,-1*wdzgce,TO_CHAR(zkl),-1*qye,0,zqgczjf,zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(zqsjf,0)+NVL(sjhtsjf,0),NVL(sjf,0)+NVL(sjhtsjf,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,yjjzsj,tdsj,TO_CHAR(qyrq,'YYYY-MM-DD') ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
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
  <B><font size="3">设计师业绩净值统计（<%=sjs%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="330%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">签约店面</td>
	<td  width="2%">设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
	<td  width="5%">促销活动</td>
	<td  width="3%">折前合同总额</td>
	<td  width="2%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="3%">增减项</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="3%">折前税金</td>
	<td  width="3%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="3%">折前管理费</td>
	<td  width="3%">折后管理费</td>
	<td  width="2%">折前记入业绩其它费</td>
	<td  width="2%">折后记入业绩其它费</td>
	<td  width="2%">折前不记业绩其它费</td>
	<td  width="2%">折后不记业绩其它费</td>
	<td  width="2%">折前设计费</td>
	<td  width="2%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="3%">首次收装款时间</td>
	<td  width="3%">财务首次审核时间</td>


	<td  width="2%">返券总金额</td>
	<td  width="2%">公司承担返券额</td>

	<td  width="3%">记入业绩时间</td>
	<td  width="3%">退单时间</td>
	<td  width="3%">签约日期</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>