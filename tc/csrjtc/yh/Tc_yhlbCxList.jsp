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
	String tc_yhlb_dqbm=null;
	String tc_yhlb_bjjbbm=null;
	String tc_yhlb_lbmc=null;
	String tc_yhlb_sfbx=null;
	String tc_yhlb_lbzqj=null;
	String tc_yhlb_lbyhj=null;
	tc_yhlb_dqbm=request.getParameter("tc_yhlb_dqbm");
	if (tc_yhlb_dqbm!=null)
	{
		tc_yhlb_dqbm=cf.GB2Uni(tc_yhlb_dqbm);
		if (!(tc_yhlb_dqbm.equals("")))	wheresql+=" and  (tc_yhlb.dqbm='"+tc_yhlb_dqbm+"')";
	}
	tc_yhlb_bjjbbm=request.getParameter("tc_yhlb_bjjbbm");
	if (tc_yhlb_bjjbbm!=null)
	{
		tc_yhlb_bjjbbm=cf.GB2Uni(tc_yhlb_bjjbbm);
		if (!(tc_yhlb_bjjbbm.equals("")))	wheresql+=" and  (tc_yhlb.bjjbbm='"+tc_yhlb_bjjbbm+"')";
	}
	tc_yhlb_lbmc=request.getParameter("tc_yhlb_lbmc");
	if (tc_yhlb_lbmc!=null)
	{
		tc_yhlb_lbmc=cf.GB2Uni(tc_yhlb_lbmc);
		if (!(tc_yhlb_lbmc.equals("")))	wheresql+=" and  (tc_yhlb.lbmc='"+tc_yhlb_lbmc+"')";
	}
	tc_yhlb_sfbx=request.getParameter("tc_yhlb_sfbx");
	if (tc_yhlb_sfbx!=null)
	{
		tc_yhlb_sfbx=cf.GB2Uni(tc_yhlb_sfbx);
		if (!(tc_yhlb_sfbx.equals("")))	wheresql+=" and  (tc_yhlb.sfbx='"+tc_yhlb_sfbx+"')";
	}
	tc_yhlb_lbzqj=request.getParameter("tc_yhlb_lbzqj");
	if (tc_yhlb_lbzqj!=null)
	{
		tc_yhlb_lbzqj=tc_yhlb_lbzqj.trim();
		if (!(tc_yhlb_lbzqj.equals("")))	wheresql+=" and  (tc_yhlb.lbzqj="+tc_yhlb_lbzqj+") ";
	}
	tc_yhlb_lbyhj=request.getParameter("tc_yhlb_lbyhj");
	if (tc_yhlb_lbyhj!=null)
	{
		tc_yhlb_lbyhj=tc_yhlb_lbyhj.trim();
		if (!(tc_yhlb_lbyhj.equals("")))	wheresql+=" and  (tc_yhlb.lbyhj="+tc_yhlb_lbyhj+") ";
	}
	ls_sql="SELECT dm_dqbm.dqmc,bjjbmc,tc_yhlb.lbmc, DECODE(tc_yhlb.sfbx,'1','��ѡ','2','�Ǳ�ѡ'),tc_yhlb.lbzqj,tc_yhlb.lbyhj  ";
	ls_sql+=" FROM dm_dqbm,tc_yhlb,bdm_bjjbbm  ";
    ls_sql+=" where tc_yhlb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_yhlb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_yhlb.dqbm,tc_yhlb.bjjbbm,tc_yhlb.lbmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tc_yhlbCxList.jsp","","","");
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
  <B><font size="3">�ײ��Ż����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">����</td>
	<td  width="15%">���ۼ���</td>
	<td  width="35%">�������</td>
	<td  width="10%">�Ƿ��ѡ</td>
	<td  width="15%">�����ǰ��</td>
	<td  width="15%">����Żݼ�</td>
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