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
	String rs_jbsqspb_spxh=null;
	String rs_jbsqspb_sqxh=null;
	String rs_jbsqd_fgsbh=null;
	String rs_jbsqd_ygbh=null;
	String rs_jbsqd_yhmc=null;
	String rs_jbsqd_xb=null;
	String rs_jbsqd_lrsj=null;
	String rs_jbsqspb_shjl=null;
	String rs_jbsqspb_shr=null;
	String rs_jbsqspb_shsj=null;
	String rs_jbsqspb_clzt=null;
	String rs_jbsqspb_ztbm=null;
	String rs_jbsqspb_yclzt=null;
	String rs_jbsqspb_yztbm=null;
	rs_jbsqspb_spxh=request.getParameter("rs_jbsqspb_spxh");
	if (rs_jbsqspb_spxh!=null)
	{
		rs_jbsqspb_spxh=rs_jbsqspb_spxh.trim();
		if (!(rs_jbsqspb_spxh.equals("")))	wheresql+=" and (rs_jbsqspb.spxh="+rs_jbsqspb_spxh+") ";
	}
	rs_jbsqspb_sqxh=request.getParameter("rs_jbsqspb_sqxh");
	if (rs_jbsqspb_sqxh!=null)
	{
		rs_jbsqspb_sqxh=cf.GB2Uni(rs_jbsqspb_sqxh);
		if (!(rs_jbsqspb_sqxh.equals("")))	wheresql+=" and  (rs_jbsqspb.sqxh='"+rs_jbsqspb_sqxh+"')";
	}
	rs_jbsqd_fgsbh=request.getParameter("rs_jbsqd_fgsbh");
	if (rs_jbsqd_fgsbh!=null)
	{
		rs_jbsqd_fgsbh=cf.GB2Uni(rs_jbsqd_fgsbh);
		if (!(rs_jbsqd_fgsbh.equals("")))	wheresql+=" and  (rs_jbsqd.fgsbh='"+rs_jbsqd_fgsbh+"')";
	}
	rs_jbsqd_ygbh=request.getParameter("rs_jbsqd_ygbh");
	if (rs_jbsqd_ygbh!=null)
	{
		rs_jbsqd_ygbh=rs_jbsqd_ygbh.trim();
		if (!(rs_jbsqd_ygbh.equals("")))	wheresql+=" and (rs_jbsqd.ygbh="+rs_jbsqd_ygbh+") ";
	}
	rs_jbsqd_yhmc=request.getParameter("rs_jbsqd_yhmc");
	if (rs_jbsqd_yhmc!=null)
	{
		rs_jbsqd_yhmc=cf.GB2Uni(rs_jbsqd_yhmc);
		if (!(rs_jbsqd_yhmc.equals("")))	wheresql+=" and  (rs_jbsqd.yhmc='"+rs_jbsqd_yhmc+"')";
	}
	rs_jbsqd_xb=request.getParameter("rs_jbsqd_xb");
	if (rs_jbsqd_xb!=null)
	{
		rs_jbsqd_xb=cf.GB2Uni(rs_jbsqd_xb);
		if (!(rs_jbsqd_xb.equals("")))	wheresql+=" and  (rs_jbsqd.xb='"+rs_jbsqd_xb+"')";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj>=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqd_lrsj=request.getParameter("rs_jbsqd_lrsj2");
	if (rs_jbsqd_lrsj!=null)
	{
		rs_jbsqd_lrsj=rs_jbsqd_lrsj.trim();
		if (!(rs_jbsqd_lrsj.equals("")))	wheresql+="  and (rs_jbsqd.lrsj<=TO_DATE('"+rs_jbsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_shjl=request.getParameter("rs_jbsqspb_shjl");
	if (rs_jbsqspb_shjl!=null)
	{
		rs_jbsqspb_shjl=cf.GB2Uni(rs_jbsqspb_shjl);
		if (!(rs_jbsqspb_shjl.equals("")))	wheresql+=" and  (rs_jbsqspb.shjl='"+rs_jbsqspb_shjl+"')";
	}
	rs_jbsqspb_shr=request.getParameter("rs_jbsqspb_shr");
	if (rs_jbsqspb_shr!=null)
	{
		rs_jbsqspb_shr=cf.GB2Uni(rs_jbsqspb_shr);
		if (!(rs_jbsqspb_shr.equals("")))	wheresql+=" and  (rs_jbsqspb.shr='"+rs_jbsqspb_shr+"')";
	}
	rs_jbsqspb_shsj=request.getParameter("rs_jbsqspb_shsj");
	if (rs_jbsqspb_shsj!=null)
	{
		rs_jbsqspb_shsj=rs_jbsqspb_shsj.trim();
		if (!(rs_jbsqspb_shsj.equals("")))	wheresql+="  and (rs_jbsqspb.shsj>=TO_DATE('"+rs_jbsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_shsj=request.getParameter("rs_jbsqspb_shsj2");
	if (rs_jbsqspb_shsj!=null)
	{
		rs_jbsqspb_shsj=rs_jbsqspb_shsj.trim();
		if (!(rs_jbsqspb_shsj.equals("")))	wheresql+="  and (rs_jbsqspb.shsj<=TO_DATE('"+rs_jbsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_jbsqspb_clzt=request.getParameter("rs_jbsqspb_clzt");
	if (rs_jbsqspb_clzt!=null)
	{
		rs_jbsqspb_clzt=cf.GB2Uni(rs_jbsqspb_clzt);
		if (!(rs_jbsqspb_clzt.equals("")))	wheresql+=" and  (rs_jbsqspb.clzt='"+rs_jbsqspb_clzt+"')";
	}
	rs_jbsqspb_ztbm=request.getParameter("rs_jbsqspb_ztbm");
	if (rs_jbsqspb_ztbm!=null)
	{
		rs_jbsqspb_ztbm=cf.GB2Uni(rs_jbsqspb_ztbm);
		if (!(rs_jbsqspb_ztbm.equals("")))	wheresql+=" and  (rs_jbsqspb.ztbm='"+rs_jbsqspb_ztbm+"')";
	}
	rs_jbsqspb_yclzt=request.getParameter("rs_jbsqspb_yclzt");
	if (rs_jbsqspb_yclzt!=null)
	{
		rs_jbsqspb_yclzt=cf.GB2Uni(rs_jbsqspb_yclzt);
		if (!(rs_jbsqspb_yclzt.equals("")))	wheresql+=" and  (rs_jbsqspb.yclzt='"+rs_jbsqspb_yclzt+"')";
	}
	rs_jbsqspb_yztbm=request.getParameter("rs_jbsqspb_yztbm");
	if (rs_jbsqspb_yztbm!=null)
	{
		rs_jbsqspb_yztbm=cf.GB2Uni(rs_jbsqspb_yztbm);
		if (!(rs_jbsqspb_yztbm.equals("")))	wheresql+=" and  (rs_jbsqspb.yztbm='"+rs_jbsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_jbsqspb.spxh,rs_jbsqspb.sqxh,a.dwmc fgsbh,rs_jbsqd.ygbh,rs_jbsqd.yhmc, DECODE(rs_jbsqd.xb,'M','��','W','Ů'),rs_jbsqd.lrsj,e.shjlmc shjl,rs_jbsqspb.shyj,rs_jbsqspb.shr,rs_jbsqspb.shsj, DECODE(rs_jbsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_jbsqspb.yspxh, DECODE(rs_jbsqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_jbsqspb.yshyj,rs_jbsqspb.yshr,rs_jbsqspb.yshsj  ";
	ls_sql+=" FROM rs_jbsqspb,rs_jbsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_jbsqspb.sqxh=rs_jbsqd.sqxh";
    ls_sql+=" and rs_jbsqd.fgsbh=a.dwbh(+) and rs_jbsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_jbsqspb.shjl=e.shjl(+) and rs_jbsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_jbsqspb.ztbm=g.ztbm(+) and rs_jbsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_jbsqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_jbsqspbCxList.jsp","SelectCxRs_jbsqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_jbsqspb_sqxh","rs_jbsqd_fgsbh","rs_jbsqd_ygbh","rs_jbsqd_yhmc","rs_jbsqd_xb","rs_jbsqd_xdwbh","rs_jbsqd_xxzzwbm","rs_jbsqd_lrsj","rs_jbsqspb_shjl","rs_jbsqspb_shyj","rs_jbsqspb_shr","rs_jbsqspb_shsj","rs_jbsqspb_clzt","rs_jbsqspb_ztbm","rs_jbsqspb_yspxh","rs_jbsqspb_yclzt","rs_jbsqspb_yztbm","rs_jbsqspb_yshjl","rs_jbsqspb_yshyj","rs_jbsqspb_yshr","rs_jbsqspb_yshsj"};
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
  <B><font size="3">�Ӱ�����--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">�Ӱ��������</td>
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