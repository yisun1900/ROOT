<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='150133'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[标准项目维护]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>
<%
	String ls_sql="";
	
	
	String dqbm=request.getParameter("dqbm");
	
	String glfxclmc=cf.GB2Uni(request.getParameter("glfxclmc"));



	ls_sql="SELECT bj_jzbjb.xmbh,bj_jzbjb.xmmc,bj_jzglfxb.dqbm,bj_jzglfxb.bjbbh,bj_jzglfxb.bjjbbm";
	ls_sql+=" ,glflmc,bj_jzglfxb.glbxh,bj_jzglfxb.glfxclbm,bj_jzglfxb.glfxclmc,bj_jzglfxb.jldwbm,bj_jzglfxb.xhl,bj_jzglfxb.dj,ROUND(bj_jzglfxb.xhl*bj_jzglfxb.dj,2) je,DECODE(bj_jzglfxb.lx,'1','打印','2','不打印') lx,bj_jzglfxb.lrr,bj_jzglfxb.lrsj,bj_jzglfxb.bz   ";
	ls_sql+=" FROM bj_jzglfxb,bj_jzbjb,bdm_glflbm  ";
    ls_sql+=" where bj_jzglfxb.xmbh=bj_jzbjb.xmbh and bj_jzglfxb.bjjbbm=bj_jzbjb.bjjbbm ";
    ls_sql+=" and bj_jzglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and bj_jzglfxb.dqbm=bj_jzbjb.dqbm";
	ls_sql+=" and (bj_jzglfxb.dqbm='"+dqbm+"') ";
	ls_sql+=" and (bj_jzglfxb.glfxclmc='"+glfxclmc+"')  and bj_jzglfxb.glflbm='2'";
    ls_sql+=" order by bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
//设置显示列

	String[] disColName={"xmbh","xmmc","glflmc","glbxh","glfxclbm","glfxclmc","jldwbm","xhl","dj","je","lx","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","bjbbh","bjjbbm","xmbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewXmbhGlfx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xmbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">工料分析－调整人工费</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">项目编号</td>
	<td  width="12%">项目名称</td>
	<td  width="5%">工料分类</td>
	<td  width="5%">工料序号</td>
	<td  width="5%">材料编码</td>
	<td  width="10%">材料名称</td>
	<td  width="5%">计量单位</td>
	<td  width="6%">数量</td>
	<td  width="6%">单价</td>
	<td  width="7%">金额</td>
	<td  width="5%">类型</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="517%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>