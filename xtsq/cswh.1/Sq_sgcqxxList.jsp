<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String sq_sgcqxx_dwbh=null;
	sq_sgcqxx_dwbh=request.getParameter("dwbh");
	if (sq_sgcqxx_dwbh!=null)
	{
		sq_sgcqxx_dwbh=cf.GB2Uni(sq_sgcqxx_dwbh);
		if (!(sq_sgcqxx_dwbh.equals("")))	wheresql+=" and  (sq_sgcqxx.dwbh='"+sq_sgcqxx_dwbh+"')";
	}
	ls_sql="SELECT sq_sgcqxx.dwbh,sq_dwxx.dwmc,sq_sgcqxx.cqbm,dm_cqbm.cqmc  ";
	ls_sql+=" FROM dm_cqbm,sq_dwxx,sq_sgcqxx  ";
    ls_sql+=" where sq_sgcqxx.cqbm=dm_cqbm.cqbm and sq_sgcqxx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditSq_sgcqxx.jsp");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"dwbh","sq_dwxx_dwmc","cqbm","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dwbh","cqbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_sgcqxx.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
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
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="12%">单位编号</td>
	<td  width="22%">单位名称</td>
	<td  width="12%">城区编码</td>
	<td  width="22%">城区名称</td>
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