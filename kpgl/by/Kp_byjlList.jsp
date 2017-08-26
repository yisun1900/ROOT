<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String kp_byjl_byjlh=null;
	String kp_byjl_khbh=null;
	String kp_byjl_khxm=null;
	String kp_byjl_fwdz=null;
	String kp_byjl_lxfs=null;
	String kp_byjl_sjs=null;
	String kp_byjl_sgd=null;
	String kp_byjl_zjy=null;
	String kp_byjl_jgrq=null;
	String kp_byjl_hth=null;
	String kp_byjl_slsj=null;
	String kp_byjl_slr=null;
	String kp_byjl_bydxlxbm=null;
	String kp_byjl_bylxbm=null;
	String kp_byjl_bynr=null;
	kp_byjl_byjlh=request.getParameter("kp_byjl_byjlh");
	if (kp_byjl_byjlh!=null)
	{
		kp_byjl_byjlh=cf.GB2Uni(kp_byjl_byjlh);
		if (!(kp_byjl_byjlh.equals("")))	wheresql+=" and  (kp_byjl.byjlh='"+kp_byjl_byjlh+"')";
	}
	kp_byjl_khbh=request.getParameter("kp_byjl_khbh");
	if (kp_byjl_khbh!=null)
	{
		kp_byjl_khbh=cf.GB2Uni(kp_byjl_khbh);
		if (!(kp_byjl_khbh.equals("")))	wheresql+=" and  (kp_byjl.khbh='"+kp_byjl_khbh+"')";
	}
	kp_byjl_khxm=request.getParameter("kp_byjl_khxm");
	if (kp_byjl_khxm!=null)
	{
		kp_byjl_khxm=cf.GB2Uni(kp_byjl_khxm);
		if (!(kp_byjl_khxm.equals("")))	wheresql+=" and  (kp_byjl.khxm='"+kp_byjl_khxm+"')";
	}
	kp_byjl_fwdz=request.getParameter("kp_byjl_fwdz");
	if (kp_byjl_fwdz!=null)
	{
		kp_byjl_fwdz=cf.GB2Uni(kp_byjl_fwdz);
		if (!(kp_byjl_fwdz.equals("")))	wheresql+=" and  (kp_byjl.fwdz='"+kp_byjl_fwdz+"')";
	}
	kp_byjl_lxfs=request.getParameter("kp_byjl_lxfs");
	if (kp_byjl_lxfs!=null)
	{
		kp_byjl_lxfs=cf.GB2Uni(kp_byjl_lxfs);
		if (!(kp_byjl_lxfs.equals("")))	wheresql+=" and  (kp_byjl.lxfs='"+kp_byjl_lxfs+"')";
	}
	kp_byjl_sjs=request.getParameter("kp_byjl_sjs");
	if (kp_byjl_sjs!=null)
	{
		kp_byjl_sjs=cf.GB2Uni(kp_byjl_sjs);
		if (!(kp_byjl_sjs.equals("")))	wheresql+=" and  (kp_byjl.sjs='"+kp_byjl_sjs+"')";
	}
	kp_byjl_sgd=request.getParameter("kp_byjl_sgd");
	if (kp_byjl_sgd!=null)
	{
		kp_byjl_sgd=cf.GB2Uni(kp_byjl_sgd);
		if (!(kp_byjl_sgd.equals("")))	wheresql+=" and  (kp_byjl.sgd='"+kp_byjl_sgd+"')";
	}
	kp_byjl_zjy=request.getParameter("kp_byjl_zjy");
	if (kp_byjl_zjy!=null)
	{
		kp_byjl_zjy=cf.GB2Uni(kp_byjl_zjy);
		if (!(kp_byjl_zjy.equals("")))	wheresql+=" and  (kp_byjl.zjy='"+kp_byjl_zjy+"')";
	}
	kp_byjl_jgrq=request.getParameter("kp_byjl_jgrq");
	if (kp_byjl_jgrq!=null)
	{
		kp_byjl_jgrq=kp_byjl_jgrq.trim();
		if (!(kp_byjl_jgrq.equals("")))	wheresql+="  and (kp_byjl.jgrq=TO_DATE('"+kp_byjl_jgrq+"','YYYY/MM/DD'))";
	}
	kp_byjl_hth=request.getParameter("kp_byjl_hth");
	if (kp_byjl_hth!=null)
	{
		kp_byjl_hth=cf.GB2Uni(kp_byjl_hth);
		if (!(kp_byjl_hth.equals("")))	wheresql+=" and  (kp_byjl.hth='"+kp_byjl_hth+"')";
	}
	kp_byjl_slsj=request.getParameter("kp_byjl_slsj");
	if (kp_byjl_slsj!=null)
	{
		kp_byjl_slsj=kp_byjl_slsj.trim();
		if (!(kp_byjl_slsj.equals("")))	wheresql+="  and (kp_byjl.slsj=TO_DATE('"+kp_byjl_slsj+"','YYYY/MM/DD'))";
	}
	kp_byjl_slr=request.getParameter("kp_byjl_slr");
	if (kp_byjl_slr!=null)
	{
		kp_byjl_slr=cf.GB2Uni(kp_byjl_slr);
		if (!(kp_byjl_slr.equals("")))	wheresql+=" and  (kp_byjl.slr='"+kp_byjl_slr+"')";
	}
	kp_byjl_bydxlxbm=request.getParameter("kp_byjl_bydxlxbm");
	if (kp_byjl_bydxlxbm!=null)
	{
		kp_byjl_bydxlxbm=cf.GB2Uni(kp_byjl_bydxlxbm);
		if (!(kp_byjl_bydxlxbm.equals("")))	wheresql+=" and  (kp_byjl.bydxlxbm='"+kp_byjl_bydxlxbm+"')";
	}
	kp_byjl_bylxbm=request.getParameter("kp_byjl_bylxbm");
	if (kp_byjl_bylxbm!=null)
	{
		kp_byjl_bylxbm=cf.GB2Uni(kp_byjl_bylxbm);
		if (!(kp_byjl_bylxbm.equals("")))	wheresql+=" and  (kp_byjl.bylxbm='"+kp_byjl_bylxbm+"')";
	}
	kp_byjl_bynr=request.getParameter("kp_byjl_bynr");
	if (kp_byjl_bynr!=null)
	{
		kp_byjl_bynr=cf.GB2Uni(kp_byjl_bynr);
		if (!(kp_byjl_bynr.equals("")))	wheresql+=" and  (kp_byjl.bynr='"+kp_byjl_bynr+"')";
	}
	ls_sql="SELECT kp_byjl.byjlh,kp_byjl.khxm,kp_byjl.fwdz,kp_byjl.lxfs,kp_byjl.sjs,sgdmc,kp_byjl.zjy,kp_byjl.jgrq,kp_byjl.slsj,kp_byjl.slr, DECODE(kp_byjl.bydxlxbm,'1','施工队','2','设计师','3','质检员'), DECODE(kp_byjl.bylxbm,'01','媒体','02','信件','03','造假'),kp_byjl.bynr  ";
	ls_sql+=" FROM kp_byjl,sq_sgd  ";
    ls_sql+=" where kp_byjl.sgd=sq_sgd.sgd";
    ls_sql+=wheresql;
	ls_sql+=" order by slsj desc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_byjlList.jsp","SelectKp_byjl.jsp","","EditKp_byjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"byjlh","kp_byjl_khbh","kp_byjl_khxm","kp_byjl_fwdz","kp_byjl_lxfs","kp_byjl_sjs","sq_dwxx_dwmc","kp_byjl_zjy","kp_byjl_jgrq","kp_byjl_hth","kp_byjl_slsj","kp_byjl_slr","kp_byjl_bydxlxbm","kp_byjl_bylxbm","kp_byjl_bynr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"byjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_byjlList.jsp?"};//按钮单击调用的网页，可以增加参数
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
}
else//非第一次进入此页，不需要初始化
{
	String[] byjlh = request.getParameterValues("byjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(byjlh,"byjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_byjl where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="5%">表扬记录号</td>
	<td  width="5%">客户姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="7%">联系方式</td>
	<td  width="5%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检员</td>
	<td  width="5%">交工日期</td>
	<td  width="5%">受理时间</td>
	<td  width="5%">受理人</td>
	<td  width="5%">表扬对象</td>
	<td  width="5%">表扬类型</td>
	<td  width="18%">表扬内容</td>
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