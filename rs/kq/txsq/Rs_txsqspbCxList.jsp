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
	String rs_txsqspb_spxh=null;
	String rs_txsqspb_sqxh=null;
	String rs_txsqd_fgsbh=null;
	String rs_txsqd_ygbh=null;
	String rs_txsqd_yhmc=null;
	String rs_txsqd_xb=null;
	String rs_txsqd_lrsj=null;
	String rs_txsqspb_shjl=null;
	String rs_txsqspb_shr=null;
	String rs_txsqspb_shsj=null;
	String rs_txsqspb_clzt=null;
	String rs_txsqspb_ztbm=null;
	String rs_txsqspb_yclzt=null;
	String rs_txsqspb_yztbm=null;
	rs_txsqspb_spxh=request.getParameter("rs_txsqspb_spxh");
	if (rs_txsqspb_spxh!=null)
	{
		rs_txsqspb_spxh=rs_txsqspb_spxh.trim();
		if (!(rs_txsqspb_spxh.equals("")))	wheresql+=" and (rs_txsqspb.spxh="+rs_txsqspb_spxh+") ";
	}
	rs_txsqspb_sqxh=request.getParameter("rs_txsqspb_sqxh");
	if (rs_txsqspb_sqxh!=null)
	{
		rs_txsqspb_sqxh=cf.GB2Uni(rs_txsqspb_sqxh);
		if (!(rs_txsqspb_sqxh.equals("")))	wheresql+=" and  (rs_txsqspb.sqxh='"+rs_txsqspb_sqxh+"')";
	}
	rs_txsqd_fgsbh=request.getParameter("rs_txsqd_fgsbh");
	if (rs_txsqd_fgsbh!=null)
	{
		rs_txsqd_fgsbh=cf.GB2Uni(rs_txsqd_fgsbh);
		if (!(rs_txsqd_fgsbh.equals("")))	wheresql+=" and  (rs_txsqd.fgsbh='"+rs_txsqd_fgsbh+"')";
	}
	rs_txsqd_ygbh=request.getParameter("rs_txsqd_ygbh");
	if (rs_txsqd_ygbh!=null)
	{
		rs_txsqd_ygbh=rs_txsqd_ygbh.trim();
		if (!(rs_txsqd_ygbh.equals("")))	wheresql+=" and (rs_txsqd.ygbh="+rs_txsqd_ygbh+") ";
	}
	rs_txsqd_yhmc=request.getParameter("rs_txsqd_yhmc");
	if (rs_txsqd_yhmc!=null)
	{
		rs_txsqd_yhmc=cf.GB2Uni(rs_txsqd_yhmc);
		if (!(rs_txsqd_yhmc.equals("")))	wheresql+=" and  (rs_txsqd.yhmc='"+rs_txsqd_yhmc+"')";
	}
	rs_txsqd_xb=request.getParameter("rs_txsqd_xb");
	if (rs_txsqd_xb!=null)
	{
		rs_txsqd_xb=cf.GB2Uni(rs_txsqd_xb);
		if (!(rs_txsqd_xb.equals("")))	wheresql+=" and  (rs_txsqd.xb='"+rs_txsqd_xb+"')";
	}
	rs_txsqd_lrsj=request.getParameter("rs_txsqd_lrsj");
	if (rs_txsqd_lrsj!=null)
	{
		rs_txsqd_lrsj=rs_txsqd_lrsj.trim();
		if (!(rs_txsqd_lrsj.equals("")))	wheresql+="  and (rs_txsqd.lrsj>=TO_DATE('"+rs_txsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_txsqd_lrsj=request.getParameter("rs_txsqd_lrsj2");
	if (rs_txsqd_lrsj!=null)
	{
		rs_txsqd_lrsj=rs_txsqd_lrsj.trim();
		if (!(rs_txsqd_lrsj.equals("")))	wheresql+="  and (rs_txsqd.lrsj<=TO_DATE('"+rs_txsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_txsqspb_shjl=request.getParameter("rs_txsqspb_shjl");
	if (rs_txsqspb_shjl!=null)
	{
		rs_txsqspb_shjl=cf.GB2Uni(rs_txsqspb_shjl);
		if (!(rs_txsqspb_shjl.equals("")))	wheresql+=" and  (rs_txsqspb.shjl='"+rs_txsqspb_shjl+"')";
	}
	rs_txsqspb_shr=request.getParameter("rs_txsqspb_shr");
	if (rs_txsqspb_shr!=null)
	{
		rs_txsqspb_shr=cf.GB2Uni(rs_txsqspb_shr);
		if (!(rs_txsqspb_shr.equals("")))	wheresql+=" and  (rs_txsqspb.shr='"+rs_txsqspb_shr+"')";
	}
	rs_txsqspb_shsj=request.getParameter("rs_txsqspb_shsj");
	if (rs_txsqspb_shsj!=null)
	{
		rs_txsqspb_shsj=rs_txsqspb_shsj.trim();
		if (!(rs_txsqspb_shsj.equals("")))	wheresql+="  and (rs_txsqspb.shsj>=TO_DATE('"+rs_txsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_txsqspb_shsj=request.getParameter("rs_txsqspb_shsj2");
	if (rs_txsqspb_shsj!=null)
	{
		rs_txsqspb_shsj=rs_txsqspb_shsj.trim();
		if (!(rs_txsqspb_shsj.equals("")))	wheresql+="  and (rs_txsqspb.shsj<=TO_DATE('"+rs_txsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_txsqspb_clzt=request.getParameter("rs_txsqspb_clzt");
	if (rs_txsqspb_clzt!=null)
	{
		rs_txsqspb_clzt=cf.GB2Uni(rs_txsqspb_clzt);
		if (!(rs_txsqspb_clzt.equals("")))	wheresql+=" and  (rs_txsqspb.clzt='"+rs_txsqspb_clzt+"')";
	}
	rs_txsqspb_ztbm=request.getParameter("rs_txsqspb_ztbm");
	if (rs_txsqspb_ztbm!=null)
	{
		rs_txsqspb_ztbm=cf.GB2Uni(rs_txsqspb_ztbm);
		if (!(rs_txsqspb_ztbm.equals("")))	wheresql+=" and  (rs_txsqspb.ztbm='"+rs_txsqspb_ztbm+"')";
	}
	rs_txsqspb_yclzt=request.getParameter("rs_txsqspb_yclzt");
	if (rs_txsqspb_yclzt!=null)
	{
		rs_txsqspb_yclzt=cf.GB2Uni(rs_txsqspb_yclzt);
		if (!(rs_txsqspb_yclzt.equals("")))	wheresql+=" and  (rs_txsqspb.yclzt='"+rs_txsqspb_yclzt+"')";
	}
	rs_txsqspb_yztbm=request.getParameter("rs_txsqspb_yztbm");
	if (rs_txsqspb_yztbm!=null)
	{
		rs_txsqspb_yztbm=cf.GB2Uni(rs_txsqspb_yztbm);
		if (!(rs_txsqspb_yztbm.equals("")))	wheresql+=" and  (rs_txsqspb.yztbm='"+rs_txsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_txsqspb.spxh,rs_txsqspb.sqxh,a.dwmc fgsbh,rs_txsqd.ygbh,rs_txsqd.yhmc, DECODE(rs_txsqd.xb,'M','��','W','Ů'),rs_txsqd.lrsj,e.shjlmc shjl,rs_txsqspb.shyj,rs_txsqspb.shr,rs_txsqspb.shsj, DECODE(rs_txsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_txsqspb.yspxh, DECODE(rs_txsqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_txsqspb.yshyj,rs_txsqspb.yshr,rs_txsqspb.yshsj  ";
	ls_sql+=" FROM rs_txsqspb,rs_txsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_txsqspb.sqxh=rs_txsqd.sqxh";
    ls_sql+=" and rs_txsqd.fgsbh=a.dwbh(+) and rs_txsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_txsqspb.shjl=e.shjl(+) and rs_txsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_txsqspb.ztbm=g.ztbm(+) and rs_txsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_txsqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_txsqspbCxList.jsp","SelectCxRs_txsqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_txsqspb_sqxh","rs_txsqd_fgsbh","rs_txsqd_ygbh","rs_txsqd_yhmc","rs_txsqd_xb","rs_txsqd_xdwbh","rs_txsqd_xxzzwbm","rs_txsqd_lrsj","rs_txsqspb_shjl","rs_txsqspb_shyj","rs_txsqspb_shr","rs_txsqspb_shsj","rs_txsqspb_clzt","rs_txsqspb_ztbm","rs_txsqspb_yspxh","rs_txsqspb_yclzt","rs_txsqspb_yztbm","rs_txsqspb_yshjl","rs_txsqspb_yshyj","rs_txsqspb_yshr","rs_txsqspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_txsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">��������--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">�����������</td>
	<td  width="5%">�걨��˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="17%">������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˺���״̬</td>
	<td  width="6%">��˺�����״̬</td>
	<td  width="3%">�ϴ��������</td>
	<td  width="3%">�ϴδ���״̬</td>
	<td  width="6%">�ϴ�����״̬</td>
	<td  width="3%">�ϴ���˽���</td>
	<td  width="16%">�ϴ�������</td>
	<td  width="2%">�ϴ������</td>
	<td  width="3%">�ϴ����ʱ��</td>
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