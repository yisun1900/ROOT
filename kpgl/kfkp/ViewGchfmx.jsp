<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String day=request.getParameter("day");
	String qssj=request.getParameter("qssj");
	String jzsj=request.getParameter("jzsj");
	String hflxbm=request.getParameter("hflxbm");
	String hflxmc=cf.executeQuery("select hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'");


	ls_sql="SELECT distinct '',crm_hfjl.hfjlh as hfjlh,crm_hfjl.khbh as khbh,khxm,fwdz,sjs,sgdmc,zjxm,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[设]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[质]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[队]：'||sgdhfnr) as hfnr,yhfrq,crm_hfjl.hfsj,yhmc";
	ls_sql+=" FROM crm_hfjl,crm_khxx,crm_gchffkbm,sq_sgd,sq_yhxx,dm_jglxbm   ";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+)";
	ls_sql+=" and crm_hfjl.hflxbm='"+hflxbm+"' and crm_hfjl.hfr=trim(sq_yhxx.yhdlm(+))";

	ls_sql+=" and hfsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and hfsj<=TO_DATE('"+jzsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and hfsj-yhfrq="+day;
	ls_sql+=" order by hfsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="2">实回访时间滞后应回访时间<%=day%>天（<%=hflxmc%>）
  <BR>(回访时间：<%=qssj%>--<%=jzsj%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="6%">回访记录号</td>
	<td  width="6%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检员</td>
	<td  width="6%">回访结果</td>
	<td  width="22%">回访内容</td>
	<td  width="7%">应回访时间</td>
	<td  width="7%">实回访时间</td>
	<td  width="5%">回访人</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
%> 
</table>
</body>
</html>