<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String xz_mpyzsq_sqxh=null;
	String xz_mpyzsq_xm=null;
	String xz_mpyzsq_zw=null;
	String xz_mpyzsq_dwbh=null;
	String xz_mpyzsq_sqrq=null;
	String xz_mpyzsq_sfywc=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (xz_mpyzsq.ssfgs='"+ssfgs+"')";
	}

	xz_mpyzsq_sqxh=request.getParameter("xz_mpyzsq_sqxh");
	if (xz_mpyzsq_sqxh!=null)
	{
		xz_mpyzsq_sqxh=cf.GB2Uni(xz_mpyzsq_sqxh);
		if (!(xz_mpyzsq_sqxh.equals("")))	wheresql+=" and  (xz_mpyzsq.sqxh='"+xz_mpyzsq_sqxh+"')";
	}
	xz_mpyzsq_sfywc=request.getParameter("xz_mpyzsq_sfywc");
	if (xz_mpyzsq_sfywc!=null)
	{
		xz_mpyzsq_sfywc=cf.GB2Uni(xz_mpyzsq_sfywc);
		if (!(xz_mpyzsq_sfywc.equals("")))	wheresql+=" and  (xz_mpyzsq.sfywc='"+xz_mpyzsq_sfywc+"')";
	}

	xz_mpyzsq_xm=request.getParameter("xz_mpyzsq_xm");
	if (xz_mpyzsq_xm!=null)
	{
		xz_mpyzsq_xm=cf.GB2Uni(xz_mpyzsq_xm);
		if (!(xz_mpyzsq_xm.equals("")))	wheresql+=" and  (xz_mpyzsq.xm like '%"+xz_mpyzsq_xm+"%')";
	}
	xz_mpyzsq_zw=request.getParameter("xz_mpyzsq_zw");
	if (xz_mpyzsq_zw!=null)
	{
		xz_mpyzsq_zw=cf.GB2Uni(xz_mpyzsq_zw);
		if (!(xz_mpyzsq_zw.equals("")))	wheresql+=" and  (xz_mpyzsq.zw like '%"+xz_mpyzsq_zw+"%')";
	}
	xz_mpyzsq_dwbh=request.getParameter("xz_mpyzsq_dwbh");
	if (xz_mpyzsq_dwbh!=null)
	{
		xz_mpyzsq_dwbh=cf.GB2Uni(xz_mpyzsq_dwbh);
		if (!(xz_mpyzsq_dwbh.equals("")))	wheresql+=" and  (xz_mpyzsq.dwbh='"+xz_mpyzsq_dwbh+"')";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq>=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_mpyzsq_sqrq=request.getParameter("xz_mpyzsq_sqrq2");
	if (xz_mpyzsq_sqrq!=null)
	{
		xz_mpyzsq_sqrq=xz_mpyzsq_sqrq.trim();
		if (!(xz_mpyzsq_sqrq.equals("")))	wheresql+="  and (xz_mpyzsq.sqrq<=TO_DATE('"+xz_mpyzsq_sqrq+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT xz_mpyzsq.sqxh,DECODE(xz_mpyzsq.sfywc,'Y','��','N','��') as sfywc,xz_mpyzsq.sqrq,xz_mpyzsq.yqjfrq,mpbb,xz_mpyzsq.yqsl,xz_mpyzsq.xm as xz_mpyzsq_xm,xz_mpyzsq.zw as xz_mpyzsq_zw,xz_mpyzsq.dh,xz_mpyzsq.bgdh,xz_mpyzsq.cz as xz_mpyzsq_cz,xz_mpyzsq.yx as xz_mpyzsq_yx,sq_dwxx.dwmc as xz_mpyzsq_dwbh,xz_mpyzsq.sqlrr,xz_mpyzsq.bz as xz_mpyzsq_bz    ";
	ls_sql+=" FROM xz_mpyzsq,sq_dwxx  ";
    ls_sql+=" where xz_mpyzsq.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+=" order by  xz_mpyzsq.yqjfrq ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_mpyzsqWcList.jsp","SelectWcXz_mpyzsq.jsp","","WcXz_mpyzsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","xz_mpyzsq_xm","xz_mpyzsq_zw","xz_mpyzsq_sj","xz_mpyzsq_dh","xz_mpyzsq_yx","xz_mpyzsq_bz","xz_mpyzsq_dwbh","xz_mpyzsq_sqrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");

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
  <B><font size="3">�����Ƭ����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">�������</td>
	<td  width="3%">�Ƿ����</td>
	<td  width="5%">��������</td>
	<td  width="5%">Ҫ�󽻸�����</td>
	<td  width="6%">�汾</td>
	<td  width="4%">Ҫ������</td>
	<td  width="4%">����</td>
	<td  width="7%">ְ��</td>
	<td  width="9%">�ֻ�</td>
	<td  width="9%">�칫�绰</td>
	<td  width="9%">����</td>
	<td  width="10%">����</td>
	<td  width="8%">���벿��</td>
	<td  width="4%">����¼����</td>
	<td  width="10%">��ע</td>
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
