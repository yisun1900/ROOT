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

	String jshm=null;
	String fcsj=null;
	String fsr=null;
	String fsfs=null;
	String fsjg=null;

	String sfcg=null;
	sfcg=request.getParameter("sfcg");
	if (sfcg!=null)
	{
		sfcg=cf.GB2Uni(sfcg);
		if (sfcg.equals("Y"))
		{
			wheresql+=" and fsjg=1";
		}
		else{
			wheresql+=" and fsjg!=1";
		}

	}

	jshm=request.getParameter("jshm");
	if (jshm!=null)
	{
		jshm=cf.GB2Uni(jshm);
		if (!(jshm.equals("")))	wheresql+=" and  (jshm='"+jshm+"')";
	}
	fcsj=request.getParameter("fcsj");
	if (fcsj!=null)
	{
		fcsj=fcsj.trim();
		if (!(fcsj.equals("")))	wheresql+="  and (fcsj>=TO_DATE('"+fcsj+"','YYYY/MM/DD'))";
	}
	fcsj=request.getParameter("fcsj2");
	if (fcsj!=null)
	{
		fcsj=fcsj.trim();
		if (!(fcsj.equals("")))	wheresql+="  and (fcsj<=TO_DATE('"+fcsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	fsr=request.getParameter("fsr");
	if (fsr!=null)
	{
		fsr=cf.GB2Uni(fsr);
		if (!(fsr.equals("")))	wheresql+=" and  (fsr='"+fsr+"')";
	}
	fsfs=request.getParameter("fsfs");
	if (fsfs!=null)
	{
		fsfs=cf.GB2Uni(fsfs);
		if (!(fsfs.equals("")))	wheresql+=" and  (fsfs='"+fsfs+"')";
	}
	fsjg=request.getParameter("fsjg");
	if (fsjg!=null)
	{
		fsjg=cf.GB2Uni(fsjg);
		if (!(fsjg.equals("")))	wheresql+=" and  (fsjg='"+fsjg+"')";
	}

	ls_sql="SELECT xh,jshm,to_char(fcsj,'yyyy-MM-dd hh24:mi:ss') fcsj,fsr,DECODE(fsfs,'1','人工发送','0','定时发送') fsfs,DECODE(fsjg,1,'发送成功',-100,'发送失败',-2,'参数不完整',-3,'用户名或密码不正确',-4,'用户账号余额不足',8,'未知原因失败',9,'无返回值'),dxnr  ";
	ls_sql+=" FROM dx_yfdx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by xh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dx_yfdxCxList.jsp","SelectCxDx_yfdx.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

	pageObj.alignStr[6]="align='left'";

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
  <B><font size="3">短信发送记录查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">序号</td>
	<td  width="11%">手机号码</td>
	<td  width="18%">发出时间</td>
	<td  width="7%">发送人</td>
	<td  width="8%">发送方式</td>
	<td  width="10%">发送结果</td>
	<td  width="40%">短信内容</td>
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