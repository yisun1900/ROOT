<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dwbh='"+dwbh+"'
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>
<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String bgypbh=null;
	String bgypmc=null;
	String pp=null;
	String ghr=null;
	bgypbh=request.getParameter("bgypbh");
	if (bgypbh!=null)
	{
		bgypbh=cf.GB2Uni(bgypbh);
		if (!(bgypbh.equals("")))	wheresql+=" and  (bgypbh='"+bgypbh+"')";
	}
	bgypmc=request.getParameter("bgypmc");
	if (bgypmc!=null)
	{
		bgypmc=cf.GB2Uni(bgypmc);
		if (!(bgypmc.equals("")))	wheresql+=" and  (bgypmc='"+bgypmc+"')";
	}
	pp=request.getParameter("pp");
	if (pp!=null)
	{
		pp=cf.GB2Uni(pp);
		if (!(pp.equals("")))	wheresql+=" and  (pp='"+pp+"')";
	}
	ghr=request.getParameter("ghr");
	if (ghr!=null)
	{
		ghr=cf.GB2Uni(ghr);
		if (!(ghr.equals("")))	wheresql+=" and  (ghr='"+ghr+"')";
	}
	ls_sql="SELECT xz_bgypbm.bgypbh,xz_bgypbm.bgypmc,xz_bgypbm.gg,xz_bgypbm.pp,xz_bgypbm.jg,xz_bgypbm.ghr,xz_bgypbm.bz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM xz_bgypbm,sq_dwxx  ";
    ls_sql+="  where xz_bgypbm.ssfgs=sq_dwxx.dwbh and xz_bgypbm.ssfgs='"+ssfgs+"'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditXz_bgypbm.jsp");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"bgypbh","bgypmc","gg","pp","jg","ghr","bz","dqbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bgypbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Xz_bgypbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	<td  width="11%">办公用品编号</td>
	<td  width="11%">办公用品名称</td>
	<td  width="11%">规格</td>
	<td  width="11%">品牌</td>
	<td  width="11%">价格</td>
	<td  width="11%">供货人</td>
	<td  width="11%">备注</td>
	<td  width="11%">所属分公司</td>
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