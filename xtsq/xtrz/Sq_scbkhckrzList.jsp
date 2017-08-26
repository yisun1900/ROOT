<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from  v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011506'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,cksj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[系统日志]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String cksj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (sq_scbkhckrz.ip='"+ip+"')";
	}

	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_scbkhckrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	cksj=request.getParameter("cksj");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (sq_scbkhckrz.cksj>=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}
	cksj=request.getParameter("cksj2");
	if (cksj!=null)
	{
		cksj=cksj.trim();
		if (!(cksj.equals("")))	wheresql+="  and (sq_scbkhckrz.cksj<=TO_DATE('"+cksj+"','YYYY/MM/DD'))";
	}


	String scbkhbh=null;
	scbkhbh=request.getParameter("scbkhbh");
	if (scbkhbh!=null)
	{
		scbkhbh=cf.GB2Uni(scbkhbh);
		if (!(scbkhbh.equals("")))	wheresql+=" and  (sq_scbkhckrz.scbkhbh='"+scbkhbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_scbkhxx.khxm='"+khxm+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_scbkhxx.hth='"+hth+"')";
	}


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT sq_scbkhckrz.cksj,sq_scbkhckrz.ip,sq_scbkhckrz.scbkhbh,khxm,fwdz,sq_scbkhckrz.yhdlm,sq_scbkhckrz.yhmc,b.dwmc xxx,a.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_scbkhckrz,sq_dwxx b,sq_dwxx a,crm_scbkhxx  ";
    ls_sql+=" where sq_scbkhckrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=" and sq_scbkhckrz.scbkhbh=crm_scbkhxx.scbkhbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_scbkhckrz.cksj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_scbkhckrzList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ip","yhdlm","yhmc","cksj","tcsj"};
	pageObj.setDisColName(disColName);
*/

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"scbkhbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/scbkh/ViewCrm_scbkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("scbkhbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">市场部客户查看日志</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">查看时间</td>
	<td  width="11%">IP地址</td>
	<td  width="6%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="10%">用户登陆名</td>
	<td  width="8%">用户名称</td>
	<td  width="12%">所属部门</td>
	<td  width="12%">所属分公司</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>