<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from  v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='011501'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[系统日志]："+xtrzyhmc+"') ";
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
	String xh=null;
	String ip=null;
	String yhdlm=null;
	String yhmc=null;
	String dlsj=null;
	String tcsj=null;

	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}
	
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
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (sq_xtrz.xh="+xh+") ";
	}
	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (sq_xtrz.ip='"+ip+"')";
	}
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_xtrz.yhdlm='"+yhdlm+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+yhmc+"')";
	}
	dlsj=request.getParameter("dlsj");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_xtrz.dlsj>=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	dlsj=request.getParameter("dlsj2");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (sq_xtrz.dlsj<=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	tcsj=request.getParameter("tcsj");
	if (tcsj!=null)
	{
		tcsj=tcsj.trim();
		if (!(tcsj.equals("")))	wheresql+="  and (sq_xtrz.tcsj=TO_DATE('"+tcsj+"','YYYY/MM/DD'))";
	}
	String bz=null;
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and (sq_xtrz.bz like '%"+bz+"%') ";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	ls_sql="SELECT sq_xtrz.xh,sq_xtrz.ip,sq_xtrz.yhdlm,sq_yhxx.yhmc,sq_yhxx.xzzwbm,sq_xtrz.dlsj,sq_xtrz.tcsj,b.dwmc xxx,a.dwmc ssfgs ";
	ls_sql+=" FROM sq_yhxx,sq_xtrz,sq_dwxx b,sq_dwxx a  ";
    ls_sql+=" where sq_xtrz.yhdlm=sq_yhxx.yhdlm(+) and sq_yhxx.dwbh=b.dwbh(+) and sq_yhxx.ssfgs=a.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_xtrz.dlsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_xtrzList.jsp","SelectSq_xtrz.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ip","yhdlm","yhmc","dlsj","tcsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"sq_xtrzList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from sq_xtrz where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">序号</td>
	<td  width="13%">IP地址</td>
	<td  width="12%">用户登陆名</td>
	<td  width="8%">用户名称</td>
	<td  width="9%">职务</td>
	<td  width="16%">登陆时间</td>
	<td  width="10%">退出时间</td>
	<td  width="14%">所属单位</td>
	<td  width="14%">所属分公司</td>
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