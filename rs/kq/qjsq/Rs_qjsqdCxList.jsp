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
	String rs_qjsqd_fgsbh=null;
	String rs_qjsqd_dwbh=null;
	String rs_qjsqd_ygbh=null;
	String rs_qjsqd_yhmc=null;
	String rs_qjsqd_xb=null;
	String rs_qjsqd_xzzwbm=null;

	String rs_qjsqd_sqxh=null;
	String rs_qjsqd_lrr=null;
	String rs_qjsqd_lrsj=null;
	String rs_qjsqd_lrbm=null;
	String sqrq=null;

	String rs_qjsqd_clzt=null;
	String rs_qjsqd_ztbm=null;
	String rs_qjsqd_spxh=null;
	String rs_qjsqd_shjl=null;
	String rs_qjsqd_shsj=null;
	String rs_qjsqd_shr=null;

	rs_qjsqd_fgsbh=request.getParameter("rs_qjsqd_fgsbh");
	if (rs_qjsqd_fgsbh!=null)
	{
		rs_qjsqd_fgsbh=cf.GB2Uni(rs_qjsqd_fgsbh);
		if (!(rs_qjsqd_fgsbh.equals("")))	wheresql+=" and  (rs_qjsqd.fgsbh='"+rs_qjsqd_fgsbh+"')";
	}
	rs_qjsqd_dwbh=request.getParameter("rs_qjsqd_dwbh");
	if (rs_qjsqd_dwbh!=null)
	{
		rs_qjsqd_dwbh=cf.GB2Uni(rs_qjsqd_dwbh);
		if (!(rs_qjsqd_dwbh.equals("")))	wheresql+=" and  (rs_qjsqd.dwbh='"+rs_qjsqd_dwbh+"')";
	}
	rs_qjsqd_ygbh=request.getParameter("rs_qjsqd_ygbh");
	if (rs_qjsqd_ygbh!=null)
	{
		rs_qjsqd_ygbh=rs_qjsqd_ygbh.trim();
		if (!(rs_qjsqd_ygbh.equals("")))	wheresql+=" and (rs_qjsqd.ygbh="+rs_qjsqd_ygbh+") ";
	}
	rs_qjsqd_yhmc=request.getParameter("rs_qjsqd_yhmc");
	if (rs_qjsqd_yhmc!=null)
	{
		rs_qjsqd_yhmc=cf.GB2Uni(rs_qjsqd_yhmc);
		if (!(rs_qjsqd_yhmc.equals("")))	wheresql+=" and  (rs_qjsqd.yhmc like '%"+rs_qjsqd_yhmc+"%')";
	}
	rs_qjsqd_xb=request.getParameter("rs_qjsqd_xb");
	if (rs_qjsqd_xb!=null)
	{
		rs_qjsqd_xb=cf.GB2Uni(rs_qjsqd_xb);
		if (!(rs_qjsqd_xb.equals("")))	wheresql+=" and  (rs_qjsqd.xb='"+rs_qjsqd_xb+"')";
	}

	rs_qjsqd_xzzwbm=request.getParameter("rs_qjsqd_xzzwbm");
	if (rs_qjsqd_xzzwbm!=null)
	{
		rs_qjsqd_xzzwbm=cf.GB2Uni(rs_qjsqd_xzzwbm);
		if (!(rs_qjsqd_xzzwbm.equals("")))	wheresql+=" and  (rs_qjsqd.xzzwbm='"+rs_qjsqd_xzzwbm+"')";
	}

	
	rs_qjsqd_sqxh=request.getParameter("rs_qjsqd_sqxh");
	if (rs_qjsqd_sqxh!=null)
	{
		rs_qjsqd_sqxh=cf.GB2Uni(rs_qjsqd_sqxh);
		if (!(rs_qjsqd_sqxh.equals("")))	wheresql+=" and  (rs_qjsqd.sqxh='"+rs_qjsqd_sqxh+"')";
	}
	rs_qjsqd_lrr=request.getParameter("rs_qjsqd_lrr");
	if (rs_qjsqd_lrr!=null)
	{
		rs_qjsqd_lrr=cf.GB2Uni(rs_qjsqd_lrr);
		if (!(rs_qjsqd_lrr.equals("")))	wheresql+=" and  (rs_qjsqd.lrr='"+rs_qjsqd_lrr+"')";
	}
	rs_qjsqd_lrsj=request.getParameter("rs_qjsqd_lrsj");
	if (rs_qjsqd_lrsj!=null)
	{
		rs_qjsqd_lrsj=rs_qjsqd_lrsj.trim();
		if (!(rs_qjsqd_lrsj.equals("")))	wheresql+="  and (rs_qjsqd.lrsj>=TO_DATE('"+rs_qjsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqd_lrsj=request.getParameter("rs_qjsqd_lrsj2");
	if (rs_qjsqd_lrsj!=null)
	{
		rs_qjsqd_lrsj=rs_qjsqd_lrsj.trim();
		if (!(rs_qjsqd_lrsj.equals("")))	wheresql+="  and (rs_qjsqd.lrsj<=TO_DATE('"+rs_qjsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqd_lrbm=request.getParameter("rs_qjsqd_lrbm");
	if (rs_qjsqd_lrbm!=null)
	{
		rs_qjsqd_lrbm=cf.GB2Uni(rs_qjsqd_lrbm);
		if (!(rs_qjsqd_lrbm.equals("")))	wheresql+=" and  (rs_qjsqd.lrbm='"+rs_qjsqd_lrbm+"')";
	}
	sqrq=request.getParameter("sqrq");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_qjsqd.sqrq>=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	sqrq=request.getParameter("sqrq2");
	if (sqrq!=null)
	{
		sqrq=sqrq.trim();
		if (!(sqrq.equals("")))	wheresql+="  and (rs_qjsqd.sqrq<=TO_DATE('"+sqrq+"','YYYY/MM/DD'))";
	}
	
	


	rs_qjsqd_clzt=request.getParameter("rs_qjsqd_clzt");
	if (rs_qjsqd_clzt!=null)
	{
		rs_qjsqd_clzt=cf.GB2Uni(rs_qjsqd_clzt);
		if (!(rs_qjsqd_clzt.equals("")))	wheresql+=" and  (rs_qjsqd.clzt='"+rs_qjsqd_clzt+"')";
	}
	rs_qjsqd_ztbm=request.getParameter("rs_qjsqd_ztbm");
	if (rs_qjsqd_ztbm!=null)
	{
		rs_qjsqd_ztbm=cf.GB2Uni(rs_qjsqd_ztbm);
		if (!(rs_qjsqd_ztbm.equals("")))	wheresql+=" and  (rs_qjsqd.ztbm='"+rs_qjsqd_ztbm+"')";
	}
	rs_qjsqd_spxh=request.getParameter("rs_qjsqd_spxh");
	if (rs_qjsqd_spxh!=null)
	{
		rs_qjsqd_spxh=rs_qjsqd_spxh.trim();
		if (!(rs_qjsqd_spxh.equals("")))	wheresql+=" and (rs_qjsqd.spxh="+rs_qjsqd_spxh+") ";
	}
	rs_qjsqd_shr=request.getParameter("rs_qjsqd_shr");
	if (rs_qjsqd_shr!=null)
	{
		rs_qjsqd_shr=cf.GB2Uni(rs_qjsqd_shr);
		if (!(rs_qjsqd_shr.equals("")))	wheresql+=" and  (rs_qjsqd.shr='"+rs_qjsqd_shr+"')";
	}
	rs_qjsqd_shsj=request.getParameter("rs_qjsqd_shsj");
	if (rs_qjsqd_shsj!=null)
	{
		rs_qjsqd_shsj=rs_qjsqd_shsj.trim();
		if (!(rs_qjsqd_shsj.equals("")))	wheresql+="  and (rs_qjsqd.shsj>=TO_DATE('"+rs_qjsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqd_shsj=request.getParameter("rs_qjsqd_shsj2");
	if (rs_qjsqd_shsj!=null)
	{
		rs_qjsqd_shsj=rs_qjsqd_shsj.trim();
		if (!(rs_qjsqd_shsj.equals("")))	wheresql+="  and (rs_qjsqd.shsj<=TO_DATE('"+rs_qjsqd_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqd_shjl=request.getParameter("rs_qjsqd_shjl");
	if (rs_qjsqd_shjl!=null)
	{
		rs_qjsqd_shjl=cf.GB2Uni(rs_qjsqd_shjl);
		if (!(rs_qjsqd_shjl.equals("")))	wheresql+=" and  (rs_qjsqd.shjl='"+rs_qjsqd_shjl+"')";
	}

	ls_sql="SELECT rs_qjsqd.sqxh,DECODE(rs_qjsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),ztmc,a.dwmc fgsbh,rs_qjsqd.ygbh,rs_qjsqd.yhmc, DECODE(rs_qjsqd.xb,'M','��','W','Ů'),b.dwmc dwbh,rs_qjsqd.xzzwbm,rs_qjsqd.kssj,rs_qjsqd.jzsj,rs_qjsqd.ljts,rs_qjsqd.yysm,rs_qjsqd.sqrq,rs_qjsqd.lrr,rs_qjsqd.lrsj,c.dwmc lrbm,rs_qjsqd.bz,rs_qjsqd.spxh,rs_qjsqd.shr,rs_qjsqd.shsj,shjlmc,rs_qjsqd.shyj";
	ls_sql+=" FROM rs_qjsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_qjsqd.fgsbh=a.dwbh(+) and rs_qjsqd.dwbh=b.dwbh(+) and rs_qjsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_qjsqd.shjl=rs_shjlbm.shjl(+) and rs_qjsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_qjsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_qjsqdCxList.jsp","SelectCxRs_qjsqd.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_qjsqd_ygbh","rs_qjsqd_yhmc","rs_qjsqd_xb","rs_qjsqd_yfgsbh","rs_qjsqd_dwbh","rs_qjsqd_xzzwbm","rs_qjsqd_yrzsj","rs_qjsqd_ylzrq","rs_qjsqd_ylzyy","rs_qjsqd_xdwbh","rs_qjsqd_xxzzwbm","rs_qjsqd_xrzyy","rs_qjsqd_lrr","rs_qjsqd_lrsj","rs_qjsqd_lrbm","rs_qjsqd_bz","rs_qjsqd_clzt","rs_qjsqd_ztbm","rs_qjsqd_spxh","rs_qjsqd_shr","rs_qjsqd_shsj","rs_qjsqd_shjl","rs_qjsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_qjsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
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
  <B><font size="3">��ѯ�������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="2%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="5%">��������</td>
	<td  width="4%">ְ��</td>

	<td  width="3%">��ʼʱ��</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ۼ�����</td>
	<td  width="13%">ԭ��˵��</td>
	<td  width="3%">��������</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="11%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="3%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="12%">������</td>
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