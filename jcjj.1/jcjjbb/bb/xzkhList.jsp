<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
String wheresql="";
String ls_sql=null;
String fgsbh=request.getParameter("fgsbh");
String cxrq=request.getParameter("cxrq");
String cxrq2=request.getParameter("cxrq2");
String ddrq=null;
String mmwheresql=null;
String cgwheresql=null;
String jjwheresql=null;
String zcwheresql=null;
String mmwheresql2=null;
String cgwheresql2=null;
String jjwheresql2=null;
String zcwheresql2=null;

if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	

	ddrq=cf.GB2Uni(request.getParameter("cxrq"));
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql="  and (jc_mmydd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql="  and (jc_cgdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql="  and (jc_jjdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql="  and (jc_zcdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			mmwheresql2=" and  (jc_mmydd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql2=" and (jc_cgdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql2=" and  (jc_jjdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql2=" and (jc_zcdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
           
		}
	}
	ddrq=cf.GB2Uni(request.getParameter("cxrq2"));
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql+="  and (jc_zcdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
		}
	}


	ls_sql="SELECT  khbh,khxm,fwdz,lxfs,dwmc,lx,clgw,ztjjgw,xmzy,qs  FROM ";
	ls_sql+="( select crm_khxx.khbh,'木门' as lx ,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.htje as qs "; 
	ls_sql+=" from jc_mmydd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"'";//+mmwheresql;
	ls_sql+=mmwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'橱柜' as lx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.htze as qs  "; 
	ls_sql+=" from jc_cgdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' " ;//+cgwheresql;
	ls_sql+=cgwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'家具' as lx, crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.htze as qs  "; 
	ls_sql+=" from jc_jjdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
	ls_sql+=jjwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'主材' as lx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.hkze as qs  "; 
	ls_sql+=" from jc_zcdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
	ls_sql+=zcwheresql;
	ls_sql+=" ) ";    

	ls_sql+="  where khbh in (";

		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+mmwheresql;
		ls_sql+=mmwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'" ;//+cgwheresql;
		ls_sql+=cgwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
		ls_sql+=jjwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
		ls_sql+=zcwheresql;
		ls_sql+=" ) ";  
		
		ls_sql+="  minus ";
	
		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+mmwheresql;
		ls_sql+=mmwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'" ;//+cgwheresql;
		ls_sql+=cgwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
		ls_sql+=jjwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
		ls_sql+=zcwheresql2;
		ls_sql+=" ))";    
		ls_sql+=" order by khbh,lx";    
//		out.print(ls_sql);	
		pageObj.sql=ls_sql;
//进行对象初始化
	//pageObj.initPage("xzkhList.jsp","SelectCxJc_cgdd.jsp","","/jcjj/dygl/cght.jsp");
	pageObj.initPage("xzkhList.jsp","","","");
	//pageObj.setEditStr("打印");

	pageObj.setPageRow(300);//设置每页显示记录数
//设置显示列
//	String[] //disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_fwdz","jc_cgdd_hth","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_kfcbz","jc_cgdd_khlx//","sq_dwxx_dwmc"};
//	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
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
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("lxfs","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("clgw","1");//列参数对象加入Hash表
	spanColHash.put("ztjjgw","1");//列参数对象加入Hash表
	spanColHash.put("xmzy","1");//列参数对象加入Hash表

	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	/*coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表*/
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
  <B><font size="3">新增客户</font></B>
</CENTER>
<%
   
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="5%">客户编号</td>
	<td  width="6%">客户姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="10%">店面</td>
	<td  width="6%">定购产品</td>
	<td  width="6%">驻店家居顾问</td>
	<td  width="6%">展厅家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="6%">定购额</td>

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
