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
	String rs_kqksqspb_spxh=null;
	String rs_kqksqspb_sqxh=null;
	String rs_kqksqd_fgsbh=null;
	String rs_kqksqd_ygbh=null;
	String rs_kqksqd_yhmc=null;
	String rs_kqksqd_xb=null;
	String rs_kqksqd_lrsj=null;
	String rs_kqksqspb_shjl=null;
	String rs_kqksqspb_shr=null;
	String rs_kqksqspb_shsj=null;
	String rs_kqksqspb_clzt=null;
	String rs_kqksqspb_ztbm=null;
	String rs_kqksqspb_yclzt=null;
	String rs_kqksqspb_yztbm=null;
	rs_kqksqspb_spxh=request.getParameter("rs_kqksqspb_spxh");
	if (rs_kqksqspb_spxh!=null)
	{
		rs_kqksqspb_spxh=rs_kqksqspb_spxh.trim();
		if (!(rs_kqksqspb_spxh.equals("")))	wheresql+=" and (rs_kqksqspb.spxh="+rs_kqksqspb_spxh+") ";
	}
	rs_kqksqspb_sqxh=request.getParameter("rs_kqksqspb_sqxh");
	if (rs_kqksqspb_sqxh!=null)
	{
		rs_kqksqspb_sqxh=cf.GB2Uni(rs_kqksqspb_sqxh);
		if (!(rs_kqksqspb_sqxh.equals("")))	wheresql+=" and  (rs_kqksqspb.sqxh='"+rs_kqksqspb_sqxh+"')";
	}
	rs_kqksqd_fgsbh=request.getParameter("rs_kqksqd_fgsbh");
	if (rs_kqksqd_fgsbh!=null)
	{
		rs_kqksqd_fgsbh=cf.GB2Uni(rs_kqksqd_fgsbh);
		if (!(rs_kqksqd_fgsbh.equals("")))	wheresql+=" and  (rs_kqksqd.fgsbh='"+rs_kqksqd_fgsbh+"')";
	}
	rs_kqksqd_ygbh=request.getParameter("rs_kqksqd_ygbh");
	if (rs_kqksqd_ygbh!=null)
	{
		rs_kqksqd_ygbh=rs_kqksqd_ygbh.trim();
		if (!(rs_kqksqd_ygbh.equals("")))	wheresql+=" and (rs_kqksqd.ygbh="+rs_kqksqd_ygbh+") ";
	}
	rs_kqksqd_yhmc=request.getParameter("rs_kqksqd_yhmc");
	if (rs_kqksqd_yhmc!=null)
	{
		rs_kqksqd_yhmc=cf.GB2Uni(rs_kqksqd_yhmc);
		if (!(rs_kqksqd_yhmc.equals("")))	wheresql+=" and  (rs_kqksqd.yhmc='"+rs_kqksqd_yhmc+"')";
	}
	rs_kqksqd_xb=request.getParameter("rs_kqksqd_xb");
	if (rs_kqksqd_xb!=null)
	{
		rs_kqksqd_xb=cf.GB2Uni(rs_kqksqd_xb);
		if (!(rs_kqksqd_xb.equals("")))	wheresql+=" and  (rs_kqksqd.xb='"+rs_kqksqd_xb+"')";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj>=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqd_lrsj=request.getParameter("rs_kqksqd_lrsj2");
	if (rs_kqksqd_lrsj!=null)
	{
		rs_kqksqd_lrsj=rs_kqksqd_lrsj.trim();
		if (!(rs_kqksqd_lrsj.equals("")))	wheresql+="  and (rs_kqksqd.lrsj<=TO_DATE('"+rs_kqksqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_shjl=request.getParameter("rs_kqksqspb_shjl");
	if (rs_kqksqspb_shjl!=null)
	{
		rs_kqksqspb_shjl=cf.GB2Uni(rs_kqksqspb_shjl);
		if (!(rs_kqksqspb_shjl.equals("")))	wheresql+=" and  (rs_kqksqspb.shjl='"+rs_kqksqspb_shjl+"')";
	}
	rs_kqksqspb_shr=request.getParameter("rs_kqksqspb_shr");
	if (rs_kqksqspb_shr!=null)
	{
		rs_kqksqspb_shr=cf.GB2Uni(rs_kqksqspb_shr);
		if (!(rs_kqksqspb_shr.equals("")))	wheresql+=" and  (rs_kqksqspb.shr='"+rs_kqksqspb_shr+"')";
	}
	rs_kqksqspb_shsj=request.getParameter("rs_kqksqspb_shsj");
	if (rs_kqksqspb_shsj!=null)
	{
		rs_kqksqspb_shsj=rs_kqksqspb_shsj.trim();
		if (!(rs_kqksqspb_shsj.equals("")))	wheresql+="  and (rs_kqksqspb.shsj>=TO_DATE('"+rs_kqksqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_shsj=request.getParameter("rs_kqksqspb_shsj2");
	if (rs_kqksqspb_shsj!=null)
	{
		rs_kqksqspb_shsj=rs_kqksqspb_shsj.trim();
		if (!(rs_kqksqspb_shsj.equals("")))	wheresql+="  and (rs_kqksqspb.shsj<=TO_DATE('"+rs_kqksqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_kqksqspb_clzt=request.getParameter("rs_kqksqspb_clzt");
	if (rs_kqksqspb_clzt!=null)
	{
		rs_kqksqspb_clzt=cf.GB2Uni(rs_kqksqspb_clzt);
		if (!(rs_kqksqspb_clzt.equals("")))	wheresql+=" and  (rs_kqksqspb.clzt='"+rs_kqksqspb_clzt+"')";
	}
	rs_kqksqspb_ztbm=request.getParameter("rs_kqksqspb_ztbm");
	if (rs_kqksqspb_ztbm!=null)
	{
		rs_kqksqspb_ztbm=cf.GB2Uni(rs_kqksqspb_ztbm);
		if (!(rs_kqksqspb_ztbm.equals("")))	wheresql+=" and  (rs_kqksqspb.ztbm='"+rs_kqksqspb_ztbm+"')";
	}
	rs_kqksqspb_yclzt=request.getParameter("rs_kqksqspb_yclzt");
	if (rs_kqksqspb_yclzt!=null)
	{
		rs_kqksqspb_yclzt=cf.GB2Uni(rs_kqksqspb_yclzt);
		if (!(rs_kqksqspb_yclzt.equals("")))	wheresql+=" and  (rs_kqksqspb.yclzt='"+rs_kqksqspb_yclzt+"')";
	}
	rs_kqksqspb_yztbm=request.getParameter("rs_kqksqspb_yztbm");
	if (rs_kqksqspb_yztbm!=null)
	{
		rs_kqksqspb_yztbm=cf.GB2Uni(rs_kqksqspb_yztbm);
		if (!(rs_kqksqspb_yztbm.equals("")))	wheresql+=" and  (rs_kqksqspb.yztbm='"+rs_kqksqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_kqksqspb.spxh,rs_kqksqspb.sqxh,a.dwmc fgsbh,rs_kqksqd.ygbh,rs_kqksqd.yhmc, DECODE(rs_kqksqd.xb,'M','��','W','Ů'),rs_kqksqd.lrsj,e.shjlmc shjl,rs_kqksqspb.shyj,rs_kqksqspb.shr,rs_kqksqspb.shsj, DECODE(rs_kqksqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_kqksqspb.yspxh, DECODE(rs_kqksqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_kqksqspb.yshyj,rs_kqksqspb.yshr,rs_kqksqspb.yshsj  ";
	ls_sql+=" FROM rs_kqksqspb,rs_kqksqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_kqksqspb.sqxh=rs_kqksqd.sqxh";
    ls_sql+=" and rs_kqksqd.fgsbh=a.dwbh(+) and rs_kqksqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_kqksqspb.shjl=e.shjl(+) and rs_kqksqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_kqksqspb.ztbm=g.ztbm(+) and rs_kqksqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_kqksqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_kqksqspbCxList.jsp","SelectCxRs_kqksqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_kqksqspb_sqxh","rs_kqksqd_fgsbh","rs_kqksqd_ygbh","rs_kqksqd_yhmc","rs_kqksqd_xb","rs_kqksqd_xdwbh","rs_kqksqd_xxzzwbm","rs_kqksqd_lrsj","rs_kqksqspb_shjl","rs_kqksqspb_shyj","rs_kqksqspb_shr","rs_kqksqspb_shsj","rs_kqksqspb_clzt","rs_kqksqspb_ztbm","rs_kqksqspb_yspxh","rs_kqksqspb_yclzt","rs_kqksqspb_yztbm","rs_kqksqspb_yshjl","rs_kqksqspb_yshyj","rs_kqksqspb_yshr","rs_kqksqspb_yshsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"spxh"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">���ڿ���������--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">���ڿ������������</td>
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