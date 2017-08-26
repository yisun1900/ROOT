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
	String sq_gysbm_gysbm=null;
	String sq_gysbm_gys=null;
	String dqbm=null;
	String sq_gysbm_gysdz=null;
	String sq_gysbm_gysfzr=null;
	String sq_gysbm_gysdh=null;
	String sq_gysbm_gyscz=null;
	String sq_gysbm_email=null;

	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;

	sq_gysxx_gyslb=request.getParameter("sq_gysxx_gyslb");
	if (sq_gysxx_gyslb!=null)
	{
		sq_gysxx_gyslb=cf.GB2Uni(sq_gysxx_gyslb);
		if (!(sq_gysxx_gyslb.equals("")))	wheresql+=" and  (sq_gysxx.gyslb='"+sq_gysxx_gyslb+"')";
	}
	sq_gysxx_zclb=request.getParameter("sq_gysxx_zclb");
	if (sq_gysxx_zclb!=null)
	{
		sq_gysxx_zclb=cf.GB2Uni(sq_gysxx_zclb);
		if (!(sq_gysxx_zclb.equals("")))	wheresql+=" and  (sq_gysxx.zclb='"+sq_gysxx_zclb+"')";
	}

	String sfsq=null;
	sfsq=request.getParameter("sfsq");
	if (sfsq!=null)
	{
		if (sfsq.equals("Y"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm in(select yhdlm from sq_yhssz))";
		}
		else if (sfsq.equals("N"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm not in(select yhdlm from sq_yhssz) or sq_gysbm.yhdlm is null)";
		}
	}

	String yhdlm=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_gysbm.yhdlm='"+yhdlm+"')";
	}

	String yhkl=null;
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (sq_gysbm.yhkl='"+yhkl+"')";
	}

	String yhmc=null;
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_gysbm.yhmc like '%"+yhmc+"%')";
	}


	sq_gysbm_gysbm=request.getParameter("sq_gysbm_gysbm");
	if (sq_gysbm_gysbm!=null)
	{
		sq_gysbm_gysbm=cf.GB2Uni(sq_gysbm_gysbm);
		if (!(sq_gysbm_gysbm.equals("")))	wheresql+=" and  (sq_gysbm.gysbm='"+sq_gysbm_gysbm+"')";
	}
	sq_gysbm_gys=request.getParameter("sq_gysbm_gys");
	if (sq_gysbm_gys!=null)
	{
		sq_gysbm_gys=cf.GB2Uni(sq_gysbm_gys);
		if (!(sq_gysbm_gys.equals("")))	wheresql+=" and  (sq_gysbm.gys like '%"+sq_gysbm_gys+"%')";
	}

	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (sq_gysbm.dqbm='"+dqbm+"')";
	}
	sq_gysbm_gysdz=request.getParameter("sq_gysbm_gysdz");
	if (sq_gysbm_gysdz!=null)
	{
		sq_gysbm_gysdz=cf.GB2Uni(sq_gysbm_gysdz);
		if (!(sq_gysbm_gysdz.equals("")))	wheresql+=" and  (sq_gysbm.gysdz='"+sq_gysbm_gysdz+"')";
	}
	sq_gysbm_gysfzr=request.getParameter("sq_gysbm_gysfzr");
	if (sq_gysbm_gysfzr!=null)
	{
		sq_gysbm_gysfzr=cf.GB2Uni(sq_gysbm_gysfzr);
		if (!(sq_gysbm_gysfzr.equals("")))	wheresql+=" and  (sq_gysbm.gysfzr='"+sq_gysbm_gysfzr+"')";
	}
	sq_gysbm_gysdh=request.getParameter("sq_gysbm_gysdh");
	if (sq_gysbm_gysdh!=null)
	{
		sq_gysbm_gysdh=cf.GB2Uni(sq_gysbm_gysdh);
		if (!(sq_gysbm_gysdh.equals("")))	wheresql+=" and  (sq_gysbm.gysdh='"+sq_gysbm_gysdh+"')";
	}
	sq_gysbm_gyscz=request.getParameter("sq_gysbm_gyscz");
	if (sq_gysbm_gyscz!=null)
	{
		sq_gysbm_gyscz=cf.GB2Uni(sq_gysbm_gyscz);
		if (!(sq_gysbm_gyscz.equals("")))	wheresql+=" and  (sq_gysbm.gyscz='"+sq_gysbm_gyscz+"')";
	}
	sq_gysbm_email=request.getParameter("sq_gysbm_email");
	if (sq_gysbm_email!=null)
	{
		sq_gysbm_email=cf.GB2Uni(sq_gysbm_email);
		if (!(sq_gysbm_email.equals("")))	wheresql+=" and  (sq_gysbm.email='"+sq_gysbm_email+"')";
	}

	String px=request.getParameter("px");
	
	ls_sql="SELECT distinct sq_gysbm.dqbm,sq_gysbm.yxdlsbcs||'次' yxdlsbcs,sq_gysbm.mmsyzq||'天' mmsyzq,sq_gysbm.lxdlsbcs,sq_gysbm.mmxgsj,sq_gysbm.gysbm,'修改' xg,sq_gysbm.gys,sq_gysbm.yhdlm,sq_gysbm.yhkl,DECODE(sq_gysbm.kdlxtbz,'Y','可以','N','不可登陆') kdlxtbz,sq_gysbm.yhmc,sq_gysbm.cwdm,yhzmc,sq_gysbm.gysdh,sq_gysbm.gyscz, sq_gysbm.gysdz,sq_gysbm.gysfzr,sq_gysbm.email, sq_gysbm.bz,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,sq_gysbm,sq_yhssz,sq_yhz,sq_gysxx  ";
    ls_sql+=" where sq_gysbm.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and sq_gysbm.yhdlm=sq_yhssz.yhdlm(+) and sq_yhssz.yhzbh =sq_yhz.yhzbh(+)";
    ls_sql+=" and sq_gysbm.gysbm=sq_gysxx.gysbm(+) ";
    ls_sql+=wheresql;
	if (px.equals(""))
	{
		ls_sql+=" order by sq_gysbm.dqbm,sq_gysbm.gys";
	}
	else{
		ls_sql+=" order by "+px;
	}
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_gysbmList.jsp","SelectSq_gysbm.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"gysbm","gys","dqmc","xg","yhdlm","yhkl","kdlxtbz","yxdlsbcs","lxdlsbcs","mmsyzq","mmxgsj","yhmc","cwdm","yhzmc","gysdh","gyscz","gysdz","gysfzr","email","bz"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSq_gysbm.jsp?dqbm="+dqbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("gysbm","1");//列参数对象加入Hash表
	spanColHash.put("gys","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("xg","1");//列参数对象加入Hash表
	spanColHash.put("yhdlm","1");//列参数对象加入Hash表
	spanColHash.put("yhkl","1");//列参数对象加入Hash表
	spanColHash.put("kdlxtbz","1");//列参数对象加入Hash表
	spanColHash.put("yxdlsbcs","1");//列参数对象加入Hash表
	spanColHash.put("lxdlsbcs","1");//列参数对象加入Hash表
	spanColHash.put("mmsyzq","1");//列参数对象加入Hash表
	spanColHash.put("mmxgsj","1");//列参数对象加入Hash表
	spanColHash.put("yhmc","1");//列参数对象加入Hash表
	spanColHash.put("cwdm","1");//列参数对象加入Hash表
	spanColHash.put("gysdh","1");//列参数对象加入Hash表
	spanColHash.put("gyscz","1");//列参数对象加入Hash表
	spanColHash.put("gysdz","1");//列参数对象加入Hash表
	spanColHash.put("gysfzr","1");//列参数对象加入Hash表
	spanColHash.put("email","1");//列参数对象加入Hash表
	spanColHash.put("bz","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gysbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewSq_gysbm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gysbm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"gysbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="EditSq_gysbm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xg",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">维护供应商</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">供应商编号</td>
	<td  width="9%">供应商名称</td>
	<td  width="3%">所属地区</td>
	<td  width="2%">&nbsp;</td>
	<td  width="4%">用户登录名</td>
	<td  width="4%">用户口令</td>
	<td  width="2%">可登陆系统</td>
	<td  width="2%">允许登陆失败</td>
	<td  width="2%">失败次数</td>
	<td  width="2%">密码使用周期</td>
	<td  width="3%">密码修改时间</td>
	<td  width="6%">用户名称</td>
	<td  width="4%">财务代码</td>
	<td  width="6%">用户所属组</td>
	<td  width="8%">供应商电话</td>
	<td  width="7%">供应商传真</td>
	<td  width="8%">供应商地址</td>
	<td  width="4%">供应商负责人</td>
	<td  width="6%">EMail</td>
	<td  width="15%">备注</td>
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