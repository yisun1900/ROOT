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
	String tc_csrjtcjgb_dqbm=null;
	String tc_csrjtcjgb_bjjbbm=null;
	String tc_csrjtcjgb_tcmc=null;
	String tc_csrjtcjgb_mjpmdj=null;
	tc_csrjtcjgb_dqbm=request.getParameter("tc_csrjtcjgb_dqbm");
	if (tc_csrjtcjgb_dqbm!=null)
	{
		tc_csrjtcjgb_dqbm=cf.GB2Uni(tc_csrjtcjgb_dqbm);
		if (!(tc_csrjtcjgb_dqbm.equals("")))	wheresql+=" and  (tc_csrjtcjgb.dqbm='"+tc_csrjtcjgb_dqbm+"')";
	}
	tc_csrjtcjgb_bjjbbm=request.getParameter("tc_csrjtcjgb_bjjbbm");
	if (tc_csrjtcjgb_bjjbbm!=null)
	{
		tc_csrjtcjgb_bjjbbm=cf.GB2Uni(tc_csrjtcjgb_bjjbbm);
		if (!(tc_csrjtcjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjtcjgb.bjjbbm='"+tc_csrjtcjgb_bjjbbm+"')";
	}
	tc_csrjtcjgb_tcmc=request.getParameter("tc_csrjtcjgb_tcmc");
	if (tc_csrjtcjgb_tcmc!=null)
	{
		tc_csrjtcjgb_tcmc=cf.GB2Uni(tc_csrjtcjgb_tcmc);
		if (!(tc_csrjtcjgb_tcmc.equals("")))	wheresql+=" and  (tc_csrjtcjgb.tcmc='"+tc_csrjtcjgb_tcmc+"')";
	}
	tc_csrjtcjgb_mjpmdj=request.getParameter("tc_csrjtcjgb_mjpmdj");
	if (tc_csrjtcjgb_mjpmdj!=null)
	{
		tc_csrjtcjgb_mjpmdj=tc_csrjtcjgb_mjpmdj.trim();
		if (!(tc_csrjtcjgb_mjpmdj.equals("")))	wheresql+=" and  (tc_csrjtcjgb.mjpmdj="+tc_csrjtcjgb_mjpmdj+") ";
	}

	ls_sql="SELECT dm_dqbm.dqmc,bjjbmc,tc_csrjtcjgb.tcmc,tc_csrjtcjgb.mjpmdj,tc_csrjtcjgb.tnzxjjmj,tc_csrjtcjgb.cfdj,tc_csrjtcjgb.cfbzmj,tc_csrjtcjgb.cfccmjdj,tc_csrjtcjgb.wsjdj,tc_csrjtcjgb.wsjbzmj,tc_csrjtcjgb.wsjccmjdj,tc_csrjtcjgb.tlgbzjmj  ";
	ls_sql+=" FROM dm_dqbm,tc_csrjtcjgb,bdm_bjjbbm  ";
    ls_sql+=" where tc_csrjtcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjtcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjtcjgb.dqbm,tc_csrjtcjgb.bjjbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_csrjtcjgbCxList.jsp","","","");
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">����</td>
	<td  width="7%">���ۼ���</td>
	<td  width="9%">�ײ�����</td>
	<td  width="6%">���ƽ�׵���</td>
	<td  width="6%">������С�Ƽ����</td>
	<td  width="7%">��������</td>
	<td  width="6%">������׼���</td>
	<td  width="6%">���������������</td>
	<td  width="7%">�����䵥��</td>
	<td  width="6%">�������׼���</td>
	<td  width="6%">�����䳬���������</td>
	<td  width="6%">Ϳ�ϸ�Ϊ��ֽ�����</td>
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