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
	String hy_khxxb_hykh=null;
	String hy_khxxb_kdlb=null;
	String hy_khxxb_sfyfk=null;
	String hy_khxxb_dwbh=null;
	String hy_khxxb_fkr=null;
	String hy_khxxb_fkrq=null;
	String hy_khxxb_sfysy=null;
	String hy_khxxb_hybh=null;
	String hy_khxxb_syrq=null;
	hy_khxxb_hykh=request.getParameter("hy_khxxb_hykh");
	if (hy_khxxb_hykh!=null)
	{
		hy_khxxb_hykh=cf.GB2Uni(hy_khxxb_hykh);
		if (!(hy_khxxb_hykh.equals("")))	wheresql+=" and  (hy_khxxb.hykh='"+hy_khxxb_hykh+"')";
	}
	hy_khxxb_kdlb=request.getParameter("hy_khxxb_kdlb");
	if (hy_khxxb_kdlb!=null)
	{
		hy_khxxb_kdlb=cf.GB2Uni(hy_khxxb_kdlb);
		if (!(hy_khxxb_kdlb.equals("")))	wheresql+=" and  (hy_khxxb.kdlb='"+hy_khxxb_kdlb+"')";
	}
	hy_khxxb_sfyfk=request.getParameter("hy_khxxb_sfyfk");
	if (hy_khxxb_sfyfk!=null)
	{
		hy_khxxb_sfyfk=cf.GB2Uni(hy_khxxb_sfyfk);
		if (!(hy_khxxb_sfyfk.equals("")))	wheresql+=" and  (hy_khxxb.sfyfk='"+hy_khxxb_sfyfk+"')";
	}
	hy_khxxb_dwbh=request.getParameter("hy_khxxb_dwbh");
	if (hy_khxxb_dwbh!=null)
	{
		hy_khxxb_dwbh=cf.GB2Uni(hy_khxxb_dwbh);
		if (!(hy_khxxb_dwbh.equals("")))	wheresql+=" and  (hy_khxxb.dwbh='"+hy_khxxb_dwbh+"')";
	}
	hy_khxxb_fkr=request.getParameter("hy_khxxb_fkr");
	if (hy_khxxb_fkr!=null)
	{
		hy_khxxb_fkr=cf.GB2Uni(hy_khxxb_fkr);
		if (!(hy_khxxb_fkr.equals("")))	wheresql+=" and  (hy_khxxb.fkr='"+hy_khxxb_fkr+"')";
	}
	hy_khxxb_fkrq=request.getParameter("hy_khxxb_fkrq");
	if (hy_khxxb_fkrq!=null)
	{
		hy_khxxb_fkrq=hy_khxxb_fkrq.trim();
		if (!(hy_khxxb_fkrq.equals("")))	wheresql+="  and (hy_khxxb.fkrq>=TO_DATE('"+hy_khxxb_fkrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_fkrq=request.getParameter("hy_khxxb_fkrq2");
	if (hy_khxxb_fkrq!=null)
	{
		hy_khxxb_fkrq=hy_khxxb_fkrq.trim();
		if (!(hy_khxxb_fkrq.equals("")))	wheresql+="  and (hy_khxxb.fkrq<=TO_DATE('"+hy_khxxb_fkrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_sfysy=request.getParameter("hy_khxxb_sfysy");
	if (hy_khxxb_sfysy!=null)
	{
		hy_khxxb_sfysy=cf.GB2Uni(hy_khxxb_sfysy);
		if (!(hy_khxxb_sfysy.equals("")))	wheresql+=" and  (hy_khxxb.sfysy='"+hy_khxxb_sfysy+"')";
	}
	hy_khxxb_hybh=request.getParameter("hy_khxxb_hybh");
	if (hy_khxxb_hybh!=null)
	{
		hy_khxxb_hybh=cf.GB2Uni(hy_khxxb_hybh);
		if (!(hy_khxxb_hybh.equals("")))	wheresql+=" and  (hy_khxxb.hybh='"+hy_khxxb_hybh+"')";
	}
	hy_khxxb_syrq=request.getParameter("hy_khxxb_syrq");
	if (hy_khxxb_syrq!=null)
	{
		hy_khxxb_syrq=hy_khxxb_syrq.trim();
		if (!(hy_khxxb_syrq.equals("")))	wheresql+="  and (hy_khxxb.syrq>=TO_DATE('"+hy_khxxb_syrq+"','YYYY/MM/DD'))";
	}
	hy_khxxb_syrq=request.getParameter("hy_khxxb_syrq2");
	if (hy_khxxb_syrq!=null)
	{
		hy_khxxb_syrq=hy_khxxb_syrq.trim();
		if (!(hy_khxxb_syrq.equals("")))	wheresql+="  and (hy_khxxb.syrq<=TO_DATE('"+hy_khxxb_syrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT hy_khxxb.hykh as hykh,hy_hyjbb.hyjb as hy_hyjbb_hyjb, DECODE(hy_khxxb.sfyfk,'N','未发卡','Y','已发卡') as hy_khxxb_sfyfk,sq_dwxx.dwmc as sq_dwxx_dwmc,hy_khxxb.fkr as hy_khxxb_fkr,hy_khxxb.fkrq as hy_khxxb_fkrq, DECODE(hy_khxxb.sfysy,'N','未使用','Y','已使用') as hy_khxxb_sfysy,hy_khxxb.hybh as hybh,hy_khxxb.syrq as hy_khxxb_syrq  ";
	ls_sql+=" FROM hy_hyjbb,hy_khxxb,sq_dwxx  ";
    ls_sql+=" where hy_khxxb.dwbh=sq_dwxx.dwbh(+) and hy_khxxb.kdlb=hy_hyjbb.hyjbbh(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by hykh  ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hy_khxxbList.jsp","SelectHy_khxxb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hykh","hy_hyjbb_hyjb","hy_khxxb_sfyfk","sq_dwxx_dwmc","hy_khxxb_fkr","hy_khxxb_fkrq","hy_khxxb_sfysy","hy_khxxb_hybh","hy_khxxb_syrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hykh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除","取消发卡"};//按钮的显示名称
	String[] buttonLink={"DeleteKhxx.jsp","Hy_khxxbList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hybh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/hygl/hyxxgl/ViewHy_hyxxb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hybh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String[] hykh = request.getParameterValues("hykh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(hykh,"hykh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update hy_khxxb set sfyfk='N',dwbh=null,fkr=null,fkrq=null where sfysy='N' and ("+chooseitem+")";
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
	<td  width="6%">&nbsp;</td>
	<td  width="9%">水质分析卡号</td>
	<td  width="11%">卡的类别</td>
	<td  width="9%">是否已发卡</td>
	<td  width="12%">收卡单位</td>
	<td  width="9%">发卡人</td>
	<td  width="13%">发卡日期</td>
	<td  width="9%">是否已使用</td>
	<td  width="9%">会员编号</td>
	<td  width="13%">卡的使用日期</td>
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