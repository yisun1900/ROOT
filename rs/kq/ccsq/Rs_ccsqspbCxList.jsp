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
	String rs_ccsqspb_spxh=null;
	String rs_ccsqspb_sqxh=null;
	String rs_ccsqd_fgsbh=null;
	String rs_ccsqd_ygbh=null;
	String rs_ccsqd_yhmc=null;
	String rs_ccsqd_xb=null;
	String rs_ccsqd_lrsj=null;
	String rs_ccsqspb_shjl=null;
	String rs_ccsqspb_shr=null;
	String rs_ccsqspb_shsj=null;
	String rs_ccsqspb_clzt=null;
	String rs_ccsqspb_ztbm=null;
	String rs_ccsqspb_yclzt=null;
	String rs_ccsqspb_yztbm=null;
	rs_ccsqspb_spxh=request.getParameter("rs_ccsqspb_spxh");
	if (rs_ccsqspb_spxh!=null)
	{
		rs_ccsqspb_spxh=rs_ccsqspb_spxh.trim();
		if (!(rs_ccsqspb_spxh.equals("")))	wheresql+=" and (rs_ccsqspb.spxh="+rs_ccsqspb_spxh+") ";
	}
	rs_ccsqspb_sqxh=request.getParameter("rs_ccsqspb_sqxh");
	if (rs_ccsqspb_sqxh!=null)
	{
		rs_ccsqspb_sqxh=cf.GB2Uni(rs_ccsqspb_sqxh);
		if (!(rs_ccsqspb_sqxh.equals("")))	wheresql+=" and  (rs_ccsqspb.sqxh='"+rs_ccsqspb_sqxh+"')";
	}
	rs_ccsqd_fgsbh=request.getParameter("rs_ccsqd_fgsbh");
	if (rs_ccsqd_fgsbh!=null)
	{
		rs_ccsqd_fgsbh=cf.GB2Uni(rs_ccsqd_fgsbh);
		if (!(rs_ccsqd_fgsbh.equals("")))	wheresql+=" and  (rs_ccsqd.fgsbh='"+rs_ccsqd_fgsbh+"')";
	}
	rs_ccsqd_ygbh=request.getParameter("rs_ccsqd_ygbh");
	if (rs_ccsqd_ygbh!=null)
	{
		rs_ccsqd_ygbh=rs_ccsqd_ygbh.trim();
		if (!(rs_ccsqd_ygbh.equals("")))	wheresql+=" and (rs_ccsqd.ygbh="+rs_ccsqd_ygbh+") ";
	}
	rs_ccsqd_yhmc=request.getParameter("rs_ccsqd_yhmc");
	if (rs_ccsqd_yhmc!=null)
	{
		rs_ccsqd_yhmc=cf.GB2Uni(rs_ccsqd_yhmc);
		if (!(rs_ccsqd_yhmc.equals("")))	wheresql+=" and  (rs_ccsqd.yhmc='"+rs_ccsqd_yhmc+"')";
	}
	rs_ccsqd_xb=request.getParameter("rs_ccsqd_xb");
	if (rs_ccsqd_xb!=null)
	{
		rs_ccsqd_xb=cf.GB2Uni(rs_ccsqd_xb);
		if (!(rs_ccsqd_xb.equals("")))	wheresql+=" and  (rs_ccsqd.xb='"+rs_ccsqd_xb+"')";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj>=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqd_lrsj=request.getParameter("rs_ccsqd_lrsj2");
	if (rs_ccsqd_lrsj!=null)
	{
		rs_ccsqd_lrsj=rs_ccsqd_lrsj.trim();
		if (!(rs_ccsqd_lrsj.equals("")))	wheresql+="  and (rs_ccsqd.lrsj<=TO_DATE('"+rs_ccsqd_lrsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_shjl=request.getParameter("rs_ccsqspb_shjl");
	if (rs_ccsqspb_shjl!=null)
	{
		rs_ccsqspb_shjl=cf.GB2Uni(rs_ccsqspb_shjl);
		if (!(rs_ccsqspb_shjl.equals("")))	wheresql+=" and  (rs_ccsqspb.shjl='"+rs_ccsqspb_shjl+"')";
	}
	rs_ccsqspb_shr=request.getParameter("rs_ccsqspb_shr");
	if (rs_ccsqspb_shr!=null)
	{
		rs_ccsqspb_shr=cf.GB2Uni(rs_ccsqspb_shr);
		if (!(rs_ccsqspb_shr.equals("")))	wheresql+=" and  (rs_ccsqspb.shr='"+rs_ccsqspb_shr+"')";
	}
	rs_ccsqspb_shsj=request.getParameter("rs_ccsqspb_shsj");
	if (rs_ccsqspb_shsj!=null)
	{
		rs_ccsqspb_shsj=rs_ccsqspb_shsj.trim();
		if (!(rs_ccsqspb_shsj.equals("")))	wheresql+="  and (rs_ccsqspb.shsj>=TO_DATE('"+rs_ccsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_shsj=request.getParameter("rs_ccsqspb_shsj2");
	if (rs_ccsqspb_shsj!=null)
	{
		rs_ccsqspb_shsj=rs_ccsqspb_shsj.trim();
		if (!(rs_ccsqspb_shsj.equals("")))	wheresql+="  and (rs_ccsqspb.shsj<=TO_DATE('"+rs_ccsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_ccsqspb_clzt=request.getParameter("rs_ccsqspb_clzt");
	if (rs_ccsqspb_clzt!=null)
	{
		rs_ccsqspb_clzt=cf.GB2Uni(rs_ccsqspb_clzt);
		if (!(rs_ccsqspb_clzt.equals("")))	wheresql+=" and  (rs_ccsqspb.clzt='"+rs_ccsqspb_clzt+"')";
	}
	rs_ccsqspb_ztbm=request.getParameter("rs_ccsqspb_ztbm");
	if (rs_ccsqspb_ztbm!=null)
	{
		rs_ccsqspb_ztbm=cf.GB2Uni(rs_ccsqspb_ztbm);
		if (!(rs_ccsqspb_ztbm.equals("")))	wheresql+=" and  (rs_ccsqspb.ztbm='"+rs_ccsqspb_ztbm+"')";
	}
	rs_ccsqspb_yclzt=request.getParameter("rs_ccsqspb_yclzt");
	if (rs_ccsqspb_yclzt!=null)
	{
		rs_ccsqspb_yclzt=cf.GB2Uni(rs_ccsqspb_yclzt);
		if (!(rs_ccsqspb_yclzt.equals("")))	wheresql+=" and  (rs_ccsqspb.yclzt='"+rs_ccsqspb_yclzt+"')";
	}
	rs_ccsqspb_yztbm=request.getParameter("rs_ccsqspb_yztbm");
	if (rs_ccsqspb_yztbm!=null)
	{
		rs_ccsqspb_yztbm=cf.GB2Uni(rs_ccsqspb_yztbm);
		if (!(rs_ccsqspb_yztbm.equals("")))	wheresql+=" and  (rs_ccsqspb.yztbm='"+rs_ccsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_ccsqspb.spxh,rs_ccsqspb.sqxh,a.dwmc fgsbh,rs_ccsqd.ygbh,rs_ccsqd.yhmc, DECODE(rs_ccsqd.xb,'M','��','W','Ů'),rs_ccsqd.lrsj,e.shjlmc shjl,rs_ccsqspb.shyj,rs_ccsqspb.shr,rs_ccsqspb.shsj, DECODE(rs_ccsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_ccsqspb.yspxh, DECODE(rs_ccsqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_ccsqspb.yshyj,rs_ccsqspb.yshr,rs_ccsqspb.yshsj  ";
	ls_sql+=" FROM rs_ccsqspb,rs_ccsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_ccsqspb.sqxh=rs_ccsqd.sqxh";
    ls_sql+=" and rs_ccsqd.fgsbh=a.dwbh(+) and rs_ccsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_ccsqspb.shjl=e.shjl(+) and rs_ccsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_ccsqspb.ztbm=g.ztbm(+) and rs_ccsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_ccsqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ccsqspbCxList.jsp","SelectCxRs_ccsqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_ccsqspb_sqxh","rs_ccsqd_fgsbh","rs_ccsqd_ygbh","rs_ccsqd_yhmc","rs_ccsqd_xb","rs_ccsqd_xdwbh","rs_ccsqd_xxzzwbm","rs_ccsqd_lrsj","rs_ccsqspb_shjl","rs_ccsqspb_shyj","rs_ccsqspb_shr","rs_ccsqspb_shsj","rs_ccsqspb_clzt","rs_ccsqspb_ztbm","rs_ccsqspb_yspxh","rs_ccsqspb_yclzt","rs_ccsqspb_yztbm","rs_ccsqspb_yshjl","rs_ccsqspb_yshyj","rs_ccsqspb_yshr","rs_ccsqspb_yshsj"};
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