<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jxc_fclybl_dwbh=null;
	String jxc_fclybl_clxlbm=null;
	String jxc_fclybl_clxlmc=null;
	String jxc_fclybl_bzlybl=null;
	String jxc_fclybl_lyblxx=null;
	String jxc_fclybl_lyblsx=null;
	jxc_fclybl_dwbh=request.getParameter("jxc_fclybl_dwbh");
	if (jxc_fclybl_dwbh!=null)
	{
		jxc_fclybl_dwbh=cf.GB2Uni(jxc_fclybl_dwbh);
		if (!(jxc_fclybl_dwbh.equals("")))	wheresql+=" and  (jxc_fclybl.dwbh='"+jxc_fclybl_dwbh+"')";
	}
	jxc_fclybl_clxlbm=request.getParameter("jxc_fclybl_clxlbm");
	if (jxc_fclybl_clxlbm!=null)
	{
		jxc_fclybl_clxlbm=jxc_fclybl_clxlbm.trim();
		if (!(jxc_fclybl_clxlbm.equals("")))	wheresql+=" and (jxc_fclybl.clxlbm="+jxc_fclybl_clxlbm+") ";
	}
	jxc_fclybl_clxlmc=request.getParameter("jxc_fclybl_clxlmc");
	if (jxc_fclybl_clxlmc!=null)
	{
		jxc_fclybl_clxlmc=cf.GB2Uni(jxc_fclybl_clxlmc);
		if (!(jxc_fclybl_clxlmc.equals("")))	wheresql+=" and  (jxc_fclybl.clxlmc like '%"+jxc_fclybl_clxlmc+"%')";
	}
	jxc_fclybl_bzlybl=request.getParameter("jxc_fclybl_bzlybl");
	if (jxc_fclybl_bzlybl!=null)
	{
		jxc_fclybl_bzlybl=jxc_fclybl_bzlybl.trim();
		if (!(jxc_fclybl_bzlybl.equals("")))	wheresql+=" and  (jxc_fclybl.bzlybl>="+jxc_fclybl_bzlybl+") ";
	}
	jxc_fclybl_bzlybl=request.getParameter("jxc_fclybl_bzlybl2");
	if (jxc_fclybl_bzlybl!=null)
	{
		jxc_fclybl_bzlybl=jxc_fclybl_bzlybl.trim();
		if (!(jxc_fclybl_bzlybl.equals("")))	wheresql+=" and  (jxc_fclybl.bzlybl<="+jxc_fclybl_bzlybl+") ";
	}
	jxc_fclybl_lyblxx=request.getParameter("jxc_fclybl_lyblxx");
	if (jxc_fclybl_lyblxx!=null)
	{
		jxc_fclybl_lyblxx=jxc_fclybl_lyblxx.trim();
		if (!(jxc_fclybl_lyblxx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblxx>="+jxc_fclybl_lyblxx+") ";
	}
	jxc_fclybl_lyblxx=request.getParameter("jxc_fclybl_lyblxx2");
	if (jxc_fclybl_lyblxx!=null)
	{
		jxc_fclybl_lyblxx=jxc_fclybl_lyblxx.trim();
		if (!(jxc_fclybl_lyblxx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblxx<="+jxc_fclybl_lyblxx+") ";
	}
	jxc_fclybl_lyblsx=request.getParameter("jxc_fclybl_lyblsx");
	if (jxc_fclybl_lyblsx!=null)
	{
		jxc_fclybl_lyblsx=jxc_fclybl_lyblsx.trim();
		if (!(jxc_fclybl_lyblsx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblsx>="+jxc_fclybl_lyblsx+") ";
	}
	jxc_fclybl_lyblsx=request.getParameter("jxc_fclybl_lyblsx2");
	if (jxc_fclybl_lyblsx!=null)
	{
		jxc_fclybl_lyblsx=jxc_fclybl_lyblsx.trim();
		if (!(jxc_fclybl_lyblsx.equals("")))	wheresql+=" and  (jxc_fclybl.lyblsx<="+jxc_fclybl_lyblsx+") ";
	}
	ls_sql="SELECT jxc_fclybl.dwbh,sq_dwxx.dwmc,jxc_fclybl.clxlbm,jxc_fclybl.clxlmc,jxc_fclybl.bzlybl||'%',jxc_fclybl.lyblxx||'%',jxc_fclybl.lyblsx||'%'  ";
	ls_sql+=" FROM sq_dwxx,jxc_fclybl  ";
    ls_sql+=" where jxc_fclybl.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_fclybl.clxlmc,jxc_fclybl.dwbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_fclyblCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������ñ�����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">�ֹ�˾</td>
	<td  width="20%">�ֹ�˾</td>
	<td  width="12%">����С�����</td>
	<td  width="25%">����С������</td>
	<td  width="11%">��׼���ñ���</td>
	<td  width="11%">���ñ�������</td>
	<td  width="11%">���ñ�������</td>
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