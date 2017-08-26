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
	String kp_pdkpjl_kpjlh=null;
	String kp_pdkpjl_fgsbh=null;
	String kp_pdkpjl_qssj=null;
	String kp_pdkpjl_jzsj=null;
	String kp_pdkpjl_lrr=null;
	String kp_pdkpjl_lrsj=null;
	String kp_pdkpjl_zxbz=null;
	kp_pdkpjl_kpjlh=request.getParameter("kp_pdkpjl_kpjlh");
	if (kp_pdkpjl_kpjlh!=null)
	{
		kp_pdkpjl_kpjlh=cf.GB2Uni(kp_pdkpjl_kpjlh);
		if (!(kp_pdkpjl_kpjlh.equals("")))	wheresql+=" and  (kp_pdkpjl.kpjlh='"+kp_pdkpjl_kpjlh+"')";
	}
	kp_pdkpjl_fgsbh=request.getParameter("kp_pdkpjl_fgsbh");
	if (kp_pdkpjl_fgsbh!=null)
	{
		kp_pdkpjl_fgsbh=cf.GB2Uni(kp_pdkpjl_fgsbh);
		if (!(kp_pdkpjl_fgsbh.equals("")))	wheresql+=" and  (kp_pdkpjl.fgsbh='"+kp_pdkpjl_fgsbh+"')";
	}
	kp_pdkpjl_qssj=request.getParameter("kp_pdkpjl_qssj");
	if (kp_pdkpjl_qssj!=null)
	{
		kp_pdkpjl_qssj=kp_pdkpjl_qssj.trim();
		if (!(kp_pdkpjl_qssj.equals("")))	wheresql+="  and (kp_pdkpjl.qssj=TO_DATE('"+kp_pdkpjl_qssj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_jzsj=request.getParameter("kp_pdkpjl_jzsj");
	if (kp_pdkpjl_jzsj!=null)
	{
		kp_pdkpjl_jzsj=kp_pdkpjl_jzsj.trim();
		if (!(kp_pdkpjl_jzsj.equals("")))	wheresql+="  and (kp_pdkpjl.jzsj=TO_DATE('"+kp_pdkpjl_jzsj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_lrr=request.getParameter("kp_pdkpjl_lrr");
	if (kp_pdkpjl_lrr!=null)
	{
		kp_pdkpjl_lrr=cf.GB2Uni(kp_pdkpjl_lrr);
		if (!(kp_pdkpjl_lrr.equals("")))	wheresql+=" and  (kp_pdkpjl.lrr='"+kp_pdkpjl_lrr+"')";
	}
	kp_pdkpjl_lrsj=request.getParameter("kp_pdkpjl_lrsj");
	if (kp_pdkpjl_lrsj!=null)
	{
		kp_pdkpjl_lrsj=kp_pdkpjl_lrsj.trim();
		if (!(kp_pdkpjl_lrsj.equals("")))	wheresql+="  and (kp_pdkpjl.lrsj=TO_DATE('"+kp_pdkpjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_zxbz=request.getParameter("kp_pdkpjl_zxbz");
	if (kp_pdkpjl_zxbz!=null)
	{
		kp_pdkpjl_zxbz=cf.GB2Uni(kp_pdkpjl_zxbz);
		if (!(kp_pdkpjl_zxbz.equals("")))	wheresql+=" and  (kp_pdkpjl.zxbz='"+kp_pdkpjl_zxbz+"')";
	}
	ls_sql="SELECT kp_pdkpjl.kpjlh,sq_dwxx.dwmc,kp_pdkpjl.qssj,kp_pdkpjl.jzsj,kp_pdkpjl.lrr,kp_pdkpjl.lrsj, DECODE(kp_pdkpjl.zxbz,'Y','最新','N','非最新'),kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+) and kp_pdkpjl.zxbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pdkpjl.lrsj desc,kp_pdkpjl.kpjlh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_pdkpjlRgdfList.jsp","SelectRgdfKp_pdkpjl.jsp","LoadData.jsp","InsertKp_pdkprgdf.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpjlh","sq_dwxx_dwmc","kp_pdkpjl_qssj","kp_pdkpjl_jzsj","kp_pdkpjl_sgdpdze","kp_pdkpjl_lrr","kp_pdkpjl_lrsj","kp_pdkpjl_zxbz","kp_pdkpjl_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("Excel");//设置每页显示记录数
	pageObj.setViewBolt("");//设置每页显示记录数
	pageObj.setEditStr("录入");//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
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
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">考评人工打分</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">&nbsp;</td>
	<td  width="9%">考评记录号</td>
	<td  width="12%">分公司</td>
	<td  width="9%">考评起始时间</td>
	<td  width="9%">考评截止时间</td>
	<td  width="7%">录入人</td>
	<td  width="9%">录入时间</td>
	<td  width="8%">最新标志</td>
	<td  width="28%">备注</td>
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