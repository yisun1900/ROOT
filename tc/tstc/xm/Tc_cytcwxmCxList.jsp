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
	String tc_cytcwxm_dqbm=null;
	String tc_cytcwxm_bjjbbm=null;
	String tc_cytcwxm_tccplbbm=null;
	String tc_cytcwxm_tccpdlbm=null;
	tc_cytcwxm_dqbm=request.getParameter("tc_cytcwxm_dqbm");
	if (tc_cytcwxm_dqbm!=null)
	{
		tc_cytcwxm_dqbm=cf.GB2Uni(tc_cytcwxm_dqbm);
		if (!(tc_cytcwxm_dqbm.equals("")))	wheresql+=" and  (tc_cytcwxm.dqbm='"+tc_cytcwxm_dqbm+"')";
	}
	tc_cytcwxm_bjjbbm=request.getParameter("tc_cytcwxm_bjjbbm");
	if (tc_cytcwxm_bjjbbm!=null)
	{
		tc_cytcwxm_bjjbbm=cf.GB2Uni(tc_cytcwxm_bjjbbm);
		if (!(tc_cytcwxm_bjjbbm.equals("")))	wheresql+=" and  (tc_cytcwxm.bjjbbm='"+tc_cytcwxm_bjjbbm+"')";
	}
	tc_cytcwxm_tccplbbm=request.getParameter("tc_cytcwxm_tccplbbm");
	if (tc_cytcwxm_tccplbbm!=null)
	{
		tc_cytcwxm_tccplbbm=tc_cytcwxm_tccplbbm.trim();
		if (!(tc_cytcwxm_tccplbbm.equals("")))	wheresql+=" and (tc_cytcwxm.tccplbbm="+tc_cytcwxm_tccplbbm+") ";
	}
	tc_cytcwxm_tccpdlbm=request.getParameter("tc_cytcwxm_tccpdlbm");
	if (tc_cytcwxm_tccpdlbm!=null)
	{
		tc_cytcwxm_tccpdlbm=tc_cytcwxm_tccpdlbm.trim();
		if (!(tc_cytcwxm_tccpdlbm.equals("")))	wheresql+=" and (tc_cytcwxm.tccpdlbm="+tc_cytcwxm_tccpdlbm+") ";
	}
	ls_sql="SELECT dqmc,bdm_bjjbbm.bjjbmc,clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" FROM bdm_bjjbbm,tc_cytcwxm,dm_dqbm,jxc_clxlbm,jxc_cldlbm  ";
    ls_sql+=" where tc_cytcwxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_cytcwxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_cytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_cytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_cytcwxm.dqbm,tc_cytcwxm.bjjbbm,tc_cytcwxm.tccpdlbm,tc_cytcwxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_cytcwxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dqbm","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_cytcwxm_tccpdlbm"};
	pageObj.setDisColName(disColName);
*/
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">����</td>
	<td  width="20%">���ۼ���</td>
	<td  width="20%">��ƷС��</td>
	<td  width="20%">��Ʒ����</td>
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