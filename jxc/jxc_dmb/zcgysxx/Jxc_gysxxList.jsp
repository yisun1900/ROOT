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
	String gysbm=null;
	String dqbm=null;
	String gysmc=null;
	String gysdz=null;
	String gysfzr=null;
	String gysdh=null;
	String gyscz=null;
	String email=null;
	String gyslx=null;
	String sfhz=null;

	String cllx=null;
	cllx=request.getParameter("cllx");
	if (cllx!=null)
	{
		cllx=cf.GB2Uni(cllx);
		if (!(cllx.equals("")))	wheresql+=" and  (cllx='"+cllx+"')";
	}
	
	
	sfhz=request.getParameter("sfhz");
	if (sfhz!=null)
	{
		sfhz=sfhz.trim();
		if (!(sfhz.equals("")))	wheresql+=" and (sfhz='"+sfhz+"') ";
	}
	gyslx=request.getParameter("gyslx");
	if (gyslx!=null)
	{
		gyslx=gyslx.trim();
		if (!(gyslx.equals("")))	wheresql+=" and (gyslx="+gyslx+") ";
	}
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=gysbm.trim();
		if (!(gysbm.equals("")))	wheresql+=" and (gysbm="+gysbm+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_gysxx.dqbm='"+dqbm+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc like '%"+gysmc+"%')";
	}
	gysdz=request.getParameter("gysdz");
	if (gysdz!=null)
	{
		gysdz=cf.GB2Uni(gysdz);
		if (!(gysdz.equals("")))	wheresql+=" and   (gysdz like '%"+gysdz+"%')";
	}
	gysfzr=request.getParameter("gysfzr");
	if (gysfzr!=null)
	{
		gysfzr=cf.GB2Uni(gysfzr);
		if (!(gysfzr.equals("")))	wheresql+=" and  (gysfzr='"+gysfzr+"')";
	}
	gysdh=request.getParameter("gysdh");
	if (gysdh!=null)
	{
		gysdh=cf.GB2Uni(gysdh);
		if (!(gysdh.equals("")))	wheresql+=" and  (gysdh='"+gysdh+"')";
	}
	gyscz=request.getParameter("gyscz");
	if (gyscz!=null)
	{
		gyscz=cf.GB2Uni(gyscz);
		if (!(gyscz.equals("")))	wheresql+=" and  (gyscz='"+gyscz+"')";
	}
	email=request.getParameter("email");
	if (email!=null)
	{
		email=cf.GB2Uni(email);
		if (!(email.equals("")))	wheresql+=" and  (email='"+email+"')";
	}

	String cwdm=null;
	cwdm=request.getParameter("cwdm");
	if (cwdm!=null)
	{
		cwdm=cf.GB2Uni(cwdm);
		if (!(cwdm.equals("")))	wheresql+=" and  (cwdm='"+cwdm+"')";
	}

	ls_sql="SELECT gysbm,dqmc,gysmc,DECODE(gyslx,'0','代销品供货商','1','库存供货商','2','共用供货商') gyslx,DECODE(cllx,'1','主材','2','辅材','3','主材及辅材') cllx,DECODE(sfhz,'Y','合作','N','不合作') sfhz,gysdz,gysfzr,gysdh,gyscz,email,cwdm,DECODE(bz,'','',substr(bz,0,8)||'......') bz  ";
	ls_sql+=" FROM jxc_gysxx,dm_dqbm  ";
    ls_sql+=" where jxc_gysxx.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_gysxx.dqbm,jxc_gysxx.gysmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_gysxxList.jsp","","","EditJxc_gysxx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"gysbm","dqbm","gysmc","gysdz","gysfzr","gysdh","gyscz","email","yhdlm","yhkl","yhmc","cwdm","kdlxtbz","lxdlsbcs","mmxgsj","mmsyzq","yxdlsbcs","sfsd","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jxc_gysxxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gysbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_gysxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gysbm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] gysbm = request.getParameterValues("gysbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(gysbm,"gysbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from jxc_gyslxr where "+chooseitem;
		sql[1]="delete from jxc_gysxx where "+chooseitem;
		sql[2]="delete from jxc_ppgysdzb where "+chooseitem;
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
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">供应商编码</td>
	<td  width="3%">所属地区</td>
	<td  width="11%">供应商名称</td>
	<td  width="4%">供应商类型</td>
	<td  width="3%">供应材料类型</td>
	<td  width="3%">是否合作</td>
	<td  width="10%">供应商地址</td>
	<td  width="3%">供应商负责人</td>
	<td  width="8%">供应商电话</td>
	<td  width="6%">供应商传真</td>
	<td  width="6%">EMail</td>
	<td  width="3%">财务代码</td>
	<td  width="8%">备注</td>
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