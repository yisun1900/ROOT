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
	String rs_yggzb_xh=null;
	String rs_yggzb_ygbh=null;
	String rs_yggzb_bianhao=null;
	String rs_yggzb_yhmc=null;
	String rs_yggzb_dwbh=null;
	String rs_yggzjl_fxrq=null;
	String rs_yggzjl_ssfgs=null;
	rs_yggzb_xh=request.getParameter("rs_yggzb_xh");
	if (rs_yggzb_xh!=null)
	{
		rs_yggzb_xh=cf.GB2Uni(rs_yggzb_xh);
		if (!(rs_yggzb_xh.equals("")))	wheresql+=" and  (rs_yggzb.xh='"+rs_yggzb_xh+"')";
	}
	rs_yggzb_ygbh=request.getParameter("rs_yggzb_ygbh");
	if (rs_yggzb_ygbh!=null)
	{
		rs_yggzb_ygbh=rs_yggzb_ygbh.trim();
		if (!(rs_yggzb_ygbh.equals("")))	wheresql+=" and (rs_yggzb.ygbh="+rs_yggzb_ygbh+") ";
	}
	rs_yggzb_bianhao=request.getParameter("rs_yggzb_bianhao");
	if (rs_yggzb_bianhao!=null)
	{
		rs_yggzb_bianhao=cf.GB2Uni(rs_yggzb_bianhao);
		if (!(rs_yggzb_bianhao.equals("")))	wheresql+=" and  (rs_yggzb.bianhao='"+rs_yggzb_bianhao+"')";
	}
	rs_yggzb_yhmc=request.getParameter("rs_yggzb_yhmc");
	if (rs_yggzb_yhmc!=null)
	{
		rs_yggzb_yhmc=cf.GB2Uni(rs_yggzb_yhmc);
		if (!(rs_yggzb_yhmc.equals("")))	wheresql+=" and  (rs_yggzb.yhmc='"+rs_yggzb_yhmc+"')";
	}
	rs_yggzb_dwbh=request.getParameter("rs_yggzb_dwbh");
	if (rs_yggzb_dwbh!=null)
	{
		rs_yggzb_dwbh=cf.GB2Uni(rs_yggzb_dwbh);
		if (!(rs_yggzb_dwbh.equals("")))	wheresql+=" and  (rs_yggzb.dwbh='"+rs_yggzb_dwbh+"')";
	}
	rs_yggzjl_fxrq=request.getParameter("rs_yggzjl_fxrq");
	if (rs_yggzjl_fxrq!=null)
	{
		rs_yggzjl_fxrq=rs_yggzjl_fxrq.trim();
		if (!(rs_yggzjl_fxrq.equals("")))	wheresql+="  and (rs_yggzjl.fxrq>=TO_DATE('"+rs_yggzjl_fxrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_fxrq=request.getParameter("rs_yggzjl_fxrq2");
	if (rs_yggzjl_fxrq!=null)
	{
		rs_yggzjl_fxrq=rs_yggzjl_fxrq.trim();
		if (!(rs_yggzjl_fxrq.equals("")))	wheresql+="  and (rs_yggzjl.fxrq<=TO_DATE('"+rs_yggzjl_fxrq+"','YYYY/MM/DD'))";
	}
	rs_yggzjl_ssfgs=request.getParameter("rs_yggzjl_ssfgs");
	if (rs_yggzjl_ssfgs!=null)
	{
		rs_yggzjl_ssfgs=cf.GB2Uni(rs_yggzjl_ssfgs);
		if (!(rs_yggzjl_ssfgs.equals("")))	wheresql+=" and  (rs_yggzjl.ssfgs='"+rs_yggzjl_ssfgs+"')";
	}
	ls_sql="SELECT rs_yggzb.bianhao,rs_yggzb.yhmc,sq_dwxx.dwmc,rs_yggzjl.fxrq,rs_yggzjl.ksrq,rs_yggzjl.zzrq,rs_yggzb.glgz,rs_yggzb.gwgz,rs_yggzb.jbgz,rs_yggzb.jtbt,rs_yggzb.cb,rs_yggzb.dhbt,rs_yggzb.yjsxe,rs_yggzb.jj,rs_yggzb.qtbt,rs_yggzb.qtkk,rs_yggzb.tc,rs_yggzb.sqgz,rs_yggzb.ksk,rs_yggzb.shgz,rs_yggzb.bz  ";
	ls_sql+=" FROM rs_yggzb,rs_yggzjl,sq_dwxx  ";
    ls_sql+=" where (rs_yggzb.xh=rs_yggzjl.xh and rs_yggzb.dwbh=sq_dwxx.dwbh)";
	ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzjl.fxrq,rs_yggzb.dwbh,rs_yggzb.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_yggzbCxList.jsp","SelectCxRs_yggzb.jsp","","");
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
  <B><font size="3">Ա����ѯ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">����</td>
	<td  width="4%">Ա������</td>
	<td  width="8%">��������</td>
	<td  width="6%">��н����</td>
	<td  width="6%">���ʿ�ʼ����</td>
	<td  width="6%">������ֹ����</td>
	<td  width="4%">���乤��</td>
	<td  width="4%">��λ����</td>
	<td  width="4%">��н</td>
	<td  width="4%">��ͨ����</td>
	<td  width="4%">ÿ�ղͲ�</td>
	<td  width="4%">�绰��</td>
	<td  width="4%">�۱���</td>
	<td  width="4%">����</td>
	<td  width="4%">��������</td>
	<td  width="4%">�����ۿ�</td>
	<td  width="4%">���</td>
	<td  width="4%">˰ǰ����</td>
	<td  width="4%">��˰��</td>
	<td  width="4%">˰����</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printSum();
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