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
	String xz_pcsq_sqxh=null;
	String xz_pcsq_ycsj=null;
	String xz_pcsq_fhsj=null;
	String xz_pcsq_ycsy=null;
	String xz_pcsq_mdd=null;
	String xz_pcsq_dwbh=null;
	String xz_pcsq_sqr=null;
	String xz_pcsq_sqrq=null;
	String xz_pcsq_clzt=null;
	String xz_pcsq_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_pcsq_sjxm=null;
	String xz_pcsq_pzr=null;
	String xz_pcsq_pzsj=null;
	String xz_pcsq_lrr=null;
	String xz_pcsq_lrsj=null;
	xz_pcsq_sqxh=request.getParameter("xz_pcsq_sqxh");
	if (xz_pcsq_sqxh!=null)
	{
		xz_pcsq_sqxh=xz_pcsq_sqxh.trim();
		if (!(xz_pcsq_sqxh.equals("")))	wheresql+=" and (xz_pcsq.sqxh="+xz_pcsq_sqxh+") ";
	}
	xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=xz_pcsq_ycsj.trim();
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+="  and (xz_pcsq.ycsj>=TO_DATE('"+xz_pcsq_ycsj+" 00:00:00','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_ycsj=request.getParameter("xz_pcsq_ycsj2");
	if (xz_pcsq_ycsj!=null)
	{
		xz_pcsq_ycsj=xz_pcsq_ycsj.trim();
		if (!(xz_pcsq_ycsj.equals("")))	wheresql+="  and (xz_pcsq.ycsj<=TO_DATE('"+xz_pcsq_ycsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_fhsj=request.getParameter("xz_pcsq_fhsj");
	if (xz_pcsq_fhsj!=null)
	{
		xz_pcsq_fhsj=xz_pcsq_fhsj.trim();
		if (!(xz_pcsq_fhsj.equals("")))	wheresql+="  and (xz_pcsq.fhsj>=TO_DATE('"+xz_pcsq_fhsj+" 00:00:00','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_fhsj=request.getParameter("xz_pcsq_fhsj2");
	if (xz_pcsq_fhsj!=null)
	{
		xz_pcsq_fhsj=xz_pcsq_fhsj.trim();
		if (!(xz_pcsq_fhsj.equals("")))	wheresql+="  and (xz_pcsq.fhsj<=TO_DATE('"+xz_pcsq_fhsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}
	xz_pcsq_ycsy=request.getParameter("xz_pcsq_ycsy");
	if (xz_pcsq_ycsy!=null)
	{
		xz_pcsq_ycsy=cf.GB2Uni(xz_pcsq_ycsy);
		if (!(xz_pcsq_ycsy.equals("")))	wheresql+=" and  (xz_pcsq.ycsy like '%"+xz_pcsq_ycsy+"%')";
	}
	xz_pcsq_mdd=request.getParameter("xz_pcsq_mdd");
	if (xz_pcsq_mdd!=null)
	{
		xz_pcsq_mdd=cf.GB2Uni(xz_pcsq_mdd);
		if (!(xz_pcsq_mdd.equals("")))	wheresql+=" and  (xz_pcsq.mdd like '%"+xz_pcsq_mdd+"%')";
	}
	xz_pcsq_dwbh=request.getParameter("xz_pcsq_dwbh");
	if (xz_pcsq_dwbh!=null)
	{
		xz_pcsq_dwbh=cf.GB2Uni(xz_pcsq_dwbh);
		if (!(xz_pcsq_dwbh.equals("")))	wheresql+=" and  (xz_pcsq.dwbh='"+xz_pcsq_dwbh+"')";
	}
	xz_pcsq_sqr=request.getParameter("xz_pcsq_sqr");
	if (xz_pcsq_sqr!=null)
	{
		xz_pcsq_sqr=cf.GB2Uni(xz_pcsq_sqr);
		if (!(xz_pcsq_sqr.equals("")))	wheresql+=" and  (xz_pcsq.sqr like '%"+xz_pcsq_sqr+"%')";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq>=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_sqrq=request.getParameter("xz_pcsq_sqrq2");
	if (xz_pcsq_sqrq!=null)
	{
		xz_pcsq_sqrq=xz_pcsq_sqrq.trim();
		if (!(xz_pcsq_sqrq.equals("")))	wheresql+="  and (xz_pcsq.sqrq<=TO_DATE('"+xz_pcsq_sqrq+"','YYYY/MM/DD'))";
	}
	xz_pcsq_clzt=request.getParameter("xz_pcsq_clzt");
	if (xz_pcsq_clzt!=null)
	{
		xz_pcsq_clzt=cf.GB2Uni(xz_pcsq_clzt);
		if (!(xz_pcsq_clzt.equals("")))	wheresql+=" and  (xz_pcsq.clzt='"+xz_pcsq_clzt+"')";
	}
	xz_pcsq_qcph=request.getParameter("xz_pcsq_qcph");
	if (xz_pcsq_qcph!=null)
	{
		xz_pcsq_qcph=cf.GB2Uni(xz_pcsq_qcph);
		if (!(xz_pcsq_qcph.equals("")))	wheresql+=" and  (xz_pcsq.qcph like '%"+xz_pcsq_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_pcsq_sjxm=request.getParameter("xz_pcsq_sjxm");
	if (xz_pcsq_sjxm!=null)
	{
		xz_pcsq_sjxm=cf.GB2Uni(xz_pcsq_sjxm);
		if (!(xz_pcsq_sjxm.equals("")))	wheresql+=" and  (xz_pcsq.sjxm like '%"+xz_pcsq_sjxm+"%')";
	}
	xz_pcsq_pzr=request.getParameter("xz_pcsq_pzr");
	if (xz_pcsq_pzr!=null)
	{
		xz_pcsq_pzr=cf.GB2Uni(xz_pcsq_pzr);
		if (!(xz_pcsq_pzr.equals("")))	wheresql+=" and  (xz_pcsq.pzr like '%"+xz_pcsq_pzr+"%')";
	}
	xz_pcsq_pzsj=request.getParameter("xz_pcsq_pzsj");
	if (xz_pcsq_pzsj!=null)
	{
		xz_pcsq_pzsj=xz_pcsq_pzsj.trim();
		if (!(xz_pcsq_pzsj.equals("")))	wheresql+="  and (xz_pcsq.pzsj>=TO_DATE('"+xz_pcsq_pzsj+"','YYYY/MM/DD'))";
	}
	xz_pcsq_pzsj=request.getParameter("xz_pcsq_pzsj2");
	if (xz_pcsq_pzsj!=null)
	{
		xz_pcsq_pzsj=xz_pcsq_pzsj.trim();
		if (!(xz_pcsq_pzsj.equals("")))	wheresql+="  and (xz_pcsq.pzsj<=TO_DATE('"+xz_pcsq_pzsj+"','YYYY/MM/DD'))";
	}
	xz_pcsq_lrr=request.getParameter("xz_pcsq_lrr");
	if (xz_pcsq_lrr!=null)
	{
		xz_pcsq_lrr=cf.GB2Uni(xz_pcsq_lrr);
		if (!(xz_pcsq_lrr.equals("")))	wheresql+=" and  (xz_pcsq.lrr='"+xz_pcsq_lrr+"')";
	}
	xz_pcsq_lrsj=request.getParameter("xz_pcsq_lrsj");
	if (xz_pcsq_lrsj!=null)
	{
		xz_pcsq_lrsj=xz_pcsq_lrsj.trim();
		if (!(xz_pcsq_lrsj.equals("")))	wheresql+="  and (xz_pcsq.lrsj=TO_DATE('"+xz_pcsq_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT xz_pcsq.sqxh, DECODE(xz_pcsq.clzt,'1','�����ɳ�','2','���ɳ�','3','��ͬ��'),xz_pcsq.ycsj,xz_pcsq.fhsj,xz_pcsq.ycsy,xz_pcsq.mdd,xz_pcsq.gls,sq_dwxx.dwmc,xz_pcsq.sqr,xz_pcsq.lxfs,TO_CHAR(xz_pcsq.sqrq,'YYYY-MM-DD'),xz_pcsq.qcph,xz_qcdm.qcxh,xz_pcsq.sjxm,xz_pcsq.pzr,TO_CHAR(xz_pcsq.pzsj,'YYYY-MM-DD'),xz_pcsq.lrr,TO_CHAR(xz_pcsq.lrsj,'YYYY-MM-DD'),xz_pcsq.bz  ";
	ls_sql+=" FROM sq_dwxx,xz_pcsq,xz_qcdm  ";
    ls_sql+=" where xz_pcsq.dwbh=sq_dwxx.dwbh and xz_pcsq.qcph=xz_qcdm.qcph(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xz_pcsq.sqxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Xz_pcsqList.jsp","SelectXz_pcsq.jsp","","EditXz_pcsq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_pcsqList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] sqxh = request.getParameterValues("sqxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqxh,"sqxh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from xz_pcsq where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ɳ����룭ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">�������</td>
	<td  width="3%">�ɳ�״̬</td>
	<td  width="6%">�ó�ʱ��</td>
	<td  width="6%">����ʱ��</td>
	<td  width="13%">�ó�����</td>
	<td  width="7%">Ŀ�ĵ�</td>
	<td  width="3%">Ŀ�ĵع�����</td>
	<td  width="6%">���벿��</td>
	<td  width="3%">������</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="4%">��������</td>
	<td  width="5%">���ɳ���</td>
	<td  width="6%">�����ͺ�</td>
	<td  width="3%">˾������</td>
	<td  width="3%">�ɳ���</td>
	<td  width="4%">�ɳ�ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
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