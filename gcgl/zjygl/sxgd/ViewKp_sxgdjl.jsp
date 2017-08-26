<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sxjlh=null;
	sxjlh=request.getParameter("sxjlh");
	String yhdlm=(String)session.getAttribute("yhdlm");

	ls_sql="SELECT kp_sxgdjl.sxsj,crm_khxx.khxm,crm_khxx.khbh,ysgcjdmc,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,sgdmc,crm_khxx.zjxm  ";
	ls_sql+=" FROM crm_khxx,kp_sxgdjl,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d  ";
    ls_sql+=" where kp_sxgdjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+)";
    ls_sql+=" and kp_sxgdjl.sxjlh="+sxjlh+" and kp_sxgdjl.yhdlm='"+yhdlm+"'";
    ls_sql+=" order  by kp_sxgdjl.sxjlh,crm_khxx.fwdz";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//设置显示列
	String[] disColName={"sxsj","khxm","ysgcjdmc","ybysxmbm","zqysxmbm","fwdz","hth","sjs","kgrq","sjkgrq","jgrq","sgdmc","zjxm"};
	pageObj.setDisColName(disColName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果（筛选记录号：<%=sxjlh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">筛选时间</td>
	<td  width="5%">客户姓名</td>
	<td  width="6%">工程进度</td>
	<td  width="8%">隐蔽工程验收</td>
	<td  width="8%">中期验收</td>
	<td  width="23%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="7%">合同开工日期</td>
	<td  width="7%">实际开工日期</td>
	<td  width="7%">合同竣工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">工程担当</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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