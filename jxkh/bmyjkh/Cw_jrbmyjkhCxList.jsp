<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_jrbmyjkh_khzq=null;
	String cw_jrbmyjkh_khqssj=null;
	String cw_jrbmyjkh_khjzsj=null;
	String cw_jrbmyjkh_sfkh=null;
	String cw_jrbmyjkh_khr=null;
	String cw_jrbmyjkh_khsj=null;
	String cw_jrbmyjkh_lrr=null;
	String cw_jrbmyjkh_lrsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (cw_jrbmyjkh.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jrbmyjkh.dwbh='"+dwbh+"')";
	}

	cw_jrbmyjkh_khzq=request.getParameter("cw_jrbmyjkh_khzq");
	if (cw_jrbmyjkh_khzq!=null)
	{
		cw_jrbmyjkh_khzq=cf.GB2Uni(cw_jrbmyjkh_khzq);
		if (!(cw_jrbmyjkh_khzq.equals("")))	wheresql+=" and  (cw_jrbmyjkh.khzq='"+cw_jrbmyjkh_khzq+"')";
	}
	cw_jrbmyjkh_khqssj=request.getParameter("cw_jrbmyjkh_khqssj");
	if (cw_jrbmyjkh_khqssj!=null)
	{
		cw_jrbmyjkh_khqssj=cw_jrbmyjkh_khqssj.trim();
		if (!(cw_jrbmyjkh_khqssj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khqssj>=TO_DATE('"+cw_jrbmyjkh_khqssj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khqssj=request.getParameter("cw_jrbmyjkh_khqssj2");
	if (cw_jrbmyjkh_khqssj!=null)
	{
		cw_jrbmyjkh_khqssj=cw_jrbmyjkh_khqssj.trim();
		if (!(cw_jrbmyjkh_khqssj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khqssj<=TO_DATE('"+cw_jrbmyjkh_khqssj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khjzsj=request.getParameter("cw_jrbmyjkh_khjzsj");
	if (cw_jrbmyjkh_khjzsj!=null)
	{
		cw_jrbmyjkh_khjzsj=cw_jrbmyjkh_khjzsj.trim();
		if (!(cw_jrbmyjkh_khjzsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khjzsj>=TO_DATE('"+cw_jrbmyjkh_khjzsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khjzsj=request.getParameter("cw_jrbmyjkh_khjzsj2");
	if (cw_jrbmyjkh_khjzsj!=null)
	{
		cw_jrbmyjkh_khjzsj=cw_jrbmyjkh_khjzsj.trim();
		if (!(cw_jrbmyjkh_khjzsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khjzsj<=TO_DATE('"+cw_jrbmyjkh_khjzsj+"','YYYY/MM/DD'))";
	}

	cw_jrbmyjkh_sfkh=request.getParameter("cw_jrbmyjkh_sfkh");
	if (cw_jrbmyjkh_sfkh!=null)
	{
		cw_jrbmyjkh_sfkh=cf.GB2Uni(cw_jrbmyjkh_sfkh);
		if (!(cw_jrbmyjkh_sfkh.equals("")))	wheresql+=" and  (cw_jrbmyjkh.sfkh='"+cw_jrbmyjkh_sfkh+"')";
	}
	cw_jrbmyjkh_khr=request.getParameter("cw_jrbmyjkh_khr");
	if (cw_jrbmyjkh_khr!=null)
	{
		cw_jrbmyjkh_khr=cf.GB2Uni(cw_jrbmyjkh_khr);
		if (!(cw_jrbmyjkh_khr.equals("")))	wheresql+=" and  (cw_jrbmyjkh.khr='"+cw_jrbmyjkh_khr+"')";
	}
	cw_jrbmyjkh_khsj=request.getParameter("cw_jrbmyjkh_khsj");
	if (cw_jrbmyjkh_khsj!=null)
	{
		cw_jrbmyjkh_khsj=cw_jrbmyjkh_khsj.trim();
		if (!(cw_jrbmyjkh_khsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khsj>=TO_DATE('"+cw_jrbmyjkh_khsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_khsj=request.getParameter("cw_jrbmyjkh_khsj2");
	if (cw_jrbmyjkh_khsj!=null)
	{
		cw_jrbmyjkh_khsj=cw_jrbmyjkh_khsj.trim();
		if (!(cw_jrbmyjkh_khsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.khsj<=TO_DATE('"+cw_jrbmyjkh_khsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_lrr=request.getParameter("cw_jrbmyjkh_lrr");
	if (cw_jrbmyjkh_lrr!=null)
	{
		cw_jrbmyjkh_lrr=cf.GB2Uni(cw_jrbmyjkh_lrr);
		if (!(cw_jrbmyjkh_lrr.equals("")))	wheresql+=" and  (cw_jrbmyjkh.lrr='"+cw_jrbmyjkh_lrr+"')";
	}
	cw_jrbmyjkh_lrsj=request.getParameter("cw_jrbmyjkh_lrsj");
	if (cw_jrbmyjkh_lrsj!=null)
	{
		cw_jrbmyjkh_lrsj=cw_jrbmyjkh_lrsj.trim();
		if (!(cw_jrbmyjkh_lrsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.lrsj>=TO_DATE('"+cw_jrbmyjkh_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrbmyjkh_lrsj=request.getParameter("cw_jrbmyjkh_lrsj2");
	if (cw_jrbmyjkh_lrsj!=null)
	{
		cw_jrbmyjkh_lrsj=cw_jrbmyjkh_lrsj.trim();
		if (!(cw_jrbmyjkh_lrsj.equals("")))	wheresql+="  and (cw_jrbmyjkh.lrsj<=TO_DATE('"+cw_jrbmyjkh_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jrbmyjkh.khzq,cw_jrbmyjkh.khqssj,cw_jrbmyjkh.khjzsj,b.dwmc fgsbh,a.dwmc,cw_jrbmyjkh.djsjh,cw_jrbmyjkh.sjfjh,cw_jrbmyjkh.gxhjh,cw_jrbmyjkh.tcjh,cw_jrbmyjkh.zcjh,cw_jrbmyjkh.zjh   ,cw_jrbmyjkh.jtdjsjh,cw_jrbmyjkh.jtsjfjh,cw_jrbmyjkh.jtgxhjh,cw_jrbmyjkh.jttcjh,cw_jrbmyjkh.jtzcjh,cw_jrbmyjkh.jtzjh   ,cw_jrbmyjkh.djswc,cw_jrbmyjkh.sjfwc,cw_jrbmyjkh.gxhwc,cw_jrbmyjkh.tcwc,cw_jrbmyjkh.zcwc,cw_jrbmyjkh.zwc, DECODE(cw_jrbmyjkh.sfkh,'N','δ����','Y','����'),cw_jrbmyjkh.khdf,cw_jrbmyjkh.khr,cw_jrbmyjkh.khsj,cw_jrbmyjkh.lrr,cw_jrbmyjkh.lrsj,cw_jrbmyjkh.bz  ";
	ls_sql+=" FROM cw_jrbmyjkh,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where cw_jrbmyjkh.dwbh=a.dwbh(+)";
    ls_sql+=" and cw_jrbmyjkh.fgsbh=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and cw_jrbmyjkh.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and cw_jrbmyjkh.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrbmyjkh.khzq,cw_jrbmyjkh.fgsbh,cw_jrbmyjkh.dwbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrbmyjkhCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","cw_jrbmyjkh_khqssj","cw_jrbmyjkh_khjzsj","cw_jrbmyjkh_fgsbh","dwbh","sq_dwxx_dwmc","cw_jrbmyjkh_djsjh","cw_jrbmyjkh_djswc","cw_jrbmyjkh_sjfjh","cw_jrbmyjkh_sjfwc","cw_jrbmyjkh_gxhjh","cw_jrbmyjkh_gxhwc","cw_jrbmyjkh_tcjh","cw_jrbmyjkh_tcwc","cw_jrbmyjkh_zcjh","cw_jrbmyjkh_zcwc","cw_jrbmyjkh_zjh","cw_jrbmyjkh_zwc","cw_jrbmyjkh_sfkh","cw_jrbmyjkh_khdf","cw_jrbmyjkh_khr","cw_jrbmyjkh_khsj","cw_jrbmyjkh_lrr","cw_jrbmyjkh_lrsj","cw_jrbmyjkh_bz"};
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
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">��������</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">���˽���ʱ��</td>
	<td  width="4%">�ֹ�˾</td>
	<td  width="4%">��������</td>

	<td  width="2%">��˾�������ƻ�</td>
	<td  width="4%">��˾��ƷѼƻ�</td>
	<td  width="4%">��˾���Ի��ƻ�</td>
	<td  width="4%">��˾�ײͼƻ�</td>
	<td  width="4%">��˾���ļƻ�</td>
	<td  width="4%">��˾�ܼƻ�</td>

	<td  width="2%">���Ŷ������ƻ�</td>
	<td  width="3%">������ƷѼƻ�</td>
	<td  width="4%">���Ÿ��Ի��ƻ�</td>
	<td  width="4%">�����ײͼƻ�</td>
	<td  width="4%">�������ļƻ�</td>
	<td  width="4%">�����ܼƻ�</td>

	<td  width="2%">���������</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="4%">���Ի����</td>
	<td  width="4%">�ײ����</td>
	<td  width="4%">�������</td>
	<td  width="4%">�����</td>

	<td  width="2%">�Ƿ񿼺�</td>
	<td  width="2%">���˵÷�</td>
	<td  width="2%">������</td>
	<td  width="3%">����ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.printDateSum();
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