<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	
	if (zwbm.equals("31"))//监理主管，只能看本小组工地
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}



	String padlrbz=null;
	padlrbz=request.getParameter("padlrbz");
	if (padlrbz!=null)
	{
		padlrbz=cf.GB2Uni(padlrbz);
		if (!(padlrbz.equals("")))	wheresql+=" and  (crm_heysjl.padlrbz='"+padlrbz+"')";
	}
	
	
	String yszpmc=null;
	String ysjlh=null;
	String yyszpmc=null;
	String zplx=null;
	String zpxm=null;
	String zpsm=null;
	String kkzpbz=null;
	String khly=null;
	String khlysj=null;
	String zpxmbm=null;
	yszpmc=request.getParameter("yszpmc");
	if (yszpmc!=null)
	{
		yszpmc=cf.GB2Uni(yszpmc);
		if (!(yszpmc.equals("")))	wheresql+=" and  (crm_heyszp.yszpmc='"+yszpmc+"')";
	}
	ysjlh=request.getParameter("ysjlh");
	if (ysjlh!=null)
	{
		ysjlh=cf.GB2Uni(ysjlh);
		if (!(ysjlh.equals("")))	wheresql+=" and  (crm_heyszp.ysjlh='"+ysjlh+"')";
	}
	yyszpmc=request.getParameter("yyszpmc");
	if (yyszpmc!=null)
	{
		yyszpmc=cf.GB2Uni(yyszpmc);
		if (!(yyszpmc.equals("")))	wheresql+=" and  (crm_heyszp.yyszpmc='"+yyszpmc+"')";
	}
	zplx=request.getParameter("zplx");
	if (zplx!=null)
	{
		zplx=cf.GB2Uni(zplx);
		if (!(zplx.equals("")))	wheresql+=" and  (crm_heyszp.zplx='"+zplx+"')";
	}
	zpxm=request.getParameter("zpxm");
	if (zpxm!=null)
	{
		zpxm=cf.GB2Uni(zpxm);
		if (!(zpxm.equals("")))	wheresql+=" and  (crm_heyszp.zpxm='"+zpxm+"')";
	}
	zpsm=request.getParameter("zpsm");
	if (zpsm!=null)
	{
		zpsm=cf.GB2Uni(zpsm);
		if (!(zpsm.equals("")))	wheresql+=" and  (crm_heyszp.zpsm='"+zpsm+"')";
	}
	kkzpbz=request.getParameter("kkzpbz");
	if (kkzpbz!=null)
	{
		kkzpbz=kkzpbz.trim();
		if (!(kkzpbz.equals("")))	wheresql+=" and (crm_heyszp.kkzpbz="+kkzpbz+") ";
	}
	khly=request.getParameter("khly");
	if (khly!=null)
	{
		khly=cf.GB2Uni(khly);
		if (!(khly.equals("")))	wheresql+=" and  (crm_heyszp.khly='"+khly+"')";
	}
	khlysj=request.getParameter("khlysj");
	if (khlysj!=null)
	{
		khlysj=khlysj.trim();
		if (!(khlysj.equals("")))	wheresql+="  and (crm_heyszp.khlysj=TO_DATE('"+khlysj+"','YYYY/MM/DD'))";
	}
	zpxmbm=request.getParameter("zpxmbm");
	if (zpxmbm!=null)
	{
		zpxmbm=cf.GB2Uni(zpxmbm);
		if (!(zpxmbm.equals("")))	wheresql+=" and  (crm_heyszp.zpxmbm='"+zpxmbm+"')";
	}
	ls_sql="SELECT yszpmc,'<A HREF=\"ViewImage1.jsp?zhaopian=/yblimg/gcys/'||crm_heyszp.zpml||'/'||yszpmc||'\" target=\"_blank\"><img src=\"/yblimg/gcys/'||crm_heyszp.zpml||'/'||yszpmc||'\" width=\"100\"></A>', DECODE(kkzpbz,'0','不可看','1','可看'),crm_heyszp.ysjlh,crm_heysjl.lrsj, DECODE(crm_heyszp.zplx,'1','验收照片','3','整改项目照片','4','整改处理照片','5','验收照片'),zpxm,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.zjxm,sgdmc,zpsm,khly,khlysj,crm_heyszp.khbh,zpxmbm,crm_heyszp.shr,crm_heyszp.shsj ,DECODE(crm_heysjl.padlrbz,'0','电脑','1','手机')  ";
	ls_sql+=" FROM crm_heyszp,crm_heysjl,crm_khxx,sq_sgd  ";
	ls_sql+=" where crm_heyszp.ysjlh=crm_heysjl.ysjlh(+)  ";
	ls_sql+=" and crm_heyszp.khbh=crm_khxx.khbh(+)  ";
	ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and (crm_heyszp.zpshbz='N' or crm_heyszp.zpshbz='C' or crm_heyszp.zpshbz is null) ";//Y：合格；B：不合格；C：不合格重拍；N：未审核
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_heysjl.lrsj desc,crm_heyszp.ysjlh,crm_heyszp.yszpmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_heyszpShList.jsp","","","EditCrm_heyszp.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yszpmc","ysjlh","yyszpmc","zplx","zpxm","zpsm","kkzpbz","khly","khlysj","khbh","zpxmbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yszpmc"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");

//设置按钮参数
	String[] buttonName={"合格客户可看","合格客户不可看"};//按钮的显示名称
	String[] buttonLink={"SaveSetYszp.jsp?kkzpbz=1","SaveSetYszp.jsp?kkzpbz=0"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ysjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/hrgcys/ysjl/ViewCrm_heysjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ysjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">照片审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="9%">验收照片名称</td>
	<td  width="9%">验收照片名称</td>
	<td  width="3%">客户可看照片标志</td>
	<td  width="4%">验收记录号</td>
	<td  width="4%">录入时间</td>
	<td  width="4%">照片类型</td>
	<td  width="8%">照片对应项目</td>
	<td  width="4%">姓名</td>
	<td  width="10%">地址</td>
	<td  width="3%">监理</td>
	<td  width="3%">施工队</td>
	<td  width="10%">照片说明</td>
	<td  width="5%">客户留言</td>
	<td  width="4%">客户留言时间</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">照片对应项目编码</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="3%">客户端录入标志</td>
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