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
	String rs_qjsqspb_spxh=null;
	String rs_qjsqspb_sqxh=null;
	String rs_qjsqd_fgsbh=null;
	String rs_qjsqd_ygbh=null;
	String rs_qjsqd_yhmc=null;
	String rs_qjsqd_xb=null;
	String rs_qjsqd_lrsj=null;
	String rs_qjsqspb_shjl=null;
	String rs_qjsqspb_shr=null;
	String rs_qjsqspb_shsj=null;
	String rs_qjsqspb_clzt=null;
	String rs_qjsqspb_ztbm=null;
	String rs_qjsqspb_yclzt=null;
	String rs_qjsqspb_yztbm=null;
	rs_qjsqspb_spxh=request.getParameter("rs_qjsqspb_spxh");
	if (rs_qjsqspb_spxh!=null)
	{
		rs_qjsqspb_spxh=rs_qjsqspb_spxh.trim();
		if (!(rs_qjsqspb_spxh.equals("")))	wheresql+=" and (rs_qjsqspb.spxh="+rs_qjsqspb_spxh+") ";
	}
	rs_qjsqspb_sqxh=request.getParameter("rs_qjsqspb_sqxh");
	if (rs_qjsqspb_sqxh!=null)
	{
		rs_qjsqspb_sqxh=cf.GB2Uni(rs_qjsqspb_sqxh);
		if (!(rs_qjsqspb_sqxh.equals("")))	wheresql+=" and  (rs_qjsqspb.sqxh='"+rs_qjsqspb_sqxh+"')";
	}
	rs_qjsqd_fgsbh=request.getParameter("rs_qjsqd_fgsbh");
	if (rs_qjsqd_fgsbh!=null)
	{
		rs_qjsqd_fgsbh=cf.GB2Uni(rs_qjsqd_fgsbh);
		if (!(rs_qjsqd_fgsbh.equals("")))	wheresql+=" and  (rs_qjsqd.fgsbh='"+rs_qjsqd_fgsbh+"')";
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
		if (!(rs_qjsqd_yhmc.equals("")))	wheresql+=" and  (rs_qjsqd.yhmc='"+rs_qjsqd_yhmc+"')";
	}
	rs_qjsqd_xb=request.getParameter("rs_qjsqd_xb");
	if (rs_qjsqd_xb!=null)
	{
		rs_qjsqd_xb=cf.GB2Uni(rs_qjsqd_xb);
		if (!(rs_qjsqd_xb.equals("")))	wheresql+=" and  (rs_qjsqd.xb='"+rs_qjsqd_xb+"')";
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
	rs_qjsqspb_shjl=request.getParameter("rs_qjsqspb_shjl");
	if (rs_qjsqspb_shjl!=null)
	{
		rs_qjsqspb_shjl=cf.GB2Uni(rs_qjsqspb_shjl);
		if (!(rs_qjsqspb_shjl.equals("")))	wheresql+=" and  (rs_qjsqspb.shjl='"+rs_qjsqspb_shjl+"')";
	}
	rs_qjsqspb_shr=request.getParameter("rs_qjsqspb_shr");
	if (rs_qjsqspb_shr!=null)
	{
		rs_qjsqspb_shr=cf.GB2Uni(rs_qjsqspb_shr);
		if (!(rs_qjsqspb_shr.equals("")))	wheresql+=" and  (rs_qjsqspb.shr='"+rs_qjsqspb_shr+"')";
	}
	rs_qjsqspb_shsj=request.getParameter("rs_qjsqspb_shsj");
	if (rs_qjsqspb_shsj!=null)
	{
		rs_qjsqspb_shsj=rs_qjsqspb_shsj.trim();
		if (!(rs_qjsqspb_shsj.equals("")))	wheresql+="  and (rs_qjsqspb.shsj>=TO_DATE('"+rs_qjsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqspb_shsj=request.getParameter("rs_qjsqspb_shsj2");
	if (rs_qjsqspb_shsj!=null)
	{
		rs_qjsqspb_shsj=rs_qjsqspb_shsj.trim();
		if (!(rs_qjsqspb_shsj.equals("")))	wheresql+="  and (rs_qjsqspb.shsj<=TO_DATE('"+rs_qjsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_qjsqspb_clzt=request.getParameter("rs_qjsqspb_clzt");
	if (rs_qjsqspb_clzt!=null)
	{
		rs_qjsqspb_clzt=cf.GB2Uni(rs_qjsqspb_clzt);
		if (!(rs_qjsqspb_clzt.equals("")))	wheresql+=" and  (rs_qjsqspb.clzt='"+rs_qjsqspb_clzt+"')";
	}
	rs_qjsqspb_ztbm=request.getParameter("rs_qjsqspb_ztbm");
	if (rs_qjsqspb_ztbm!=null)
	{
		rs_qjsqspb_ztbm=cf.GB2Uni(rs_qjsqspb_ztbm);
		if (!(rs_qjsqspb_ztbm.equals("")))	wheresql+=" and  (rs_qjsqspb.ztbm='"+rs_qjsqspb_ztbm+"')";
	}
	rs_qjsqspb_yclzt=request.getParameter("rs_qjsqspb_yclzt");
	if (rs_qjsqspb_yclzt!=null)
	{
		rs_qjsqspb_yclzt=cf.GB2Uni(rs_qjsqspb_yclzt);
		if (!(rs_qjsqspb_yclzt.equals("")))	wheresql+=" and  (rs_qjsqspb.yclzt='"+rs_qjsqspb_yclzt+"')";
	}
	rs_qjsqspb_yztbm=request.getParameter("rs_qjsqspb_yztbm");
	if (rs_qjsqspb_yztbm!=null)
	{
		rs_qjsqspb_yztbm=cf.GB2Uni(rs_qjsqspb_yztbm);
		if (!(rs_qjsqspb_yztbm.equals("")))	wheresql+=" and  (rs_qjsqspb.yztbm='"+rs_qjsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_qjsqspb.spxh,rs_qjsqspb.sqxh,a.dwmc fgsbh,rs_qjsqd.ygbh,rs_qjsqd.yhmc, DECODE(rs_qjsqd.xb,'M','��','W','Ů'),rs_qjsqd.lrsj,e.shjlmc shjl,rs_qjsqspb.shyj,rs_qjsqspb.shr,rs_qjsqspb.shsj, DECODE(rs_qjsqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_qjsqspb.yspxh, DECODE(rs_qjsqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_qjsqspb.yshyj,rs_qjsqspb.yshr,rs_qjsqspb.yshsj  ";
	ls_sql+=" FROM rs_qjsqspb,rs_qjsqd,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_qjsqspb.sqxh=rs_qjsqd.sqxh";
    ls_sql+=" and rs_qjsqd.fgsbh=a.dwbh(+) and rs_qjsqd.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_qjsqspb.shjl=e.shjl(+) and rs_qjsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_qjsqspb.ztbm=g.ztbm(+) and rs_qjsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_qjsqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_qjsqspbCxList.jsp","SelectCxRs_qjsqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_qjsqspb_sqxh","rs_qjsqd_fgsbh","rs_qjsqd_ygbh","rs_qjsqd_yhmc","rs_qjsqd_xb","rs_qjsqd_xdwbh","rs_qjsqd_xxzzwbm","rs_qjsqd_lrsj","rs_qjsqspb_shjl","rs_qjsqspb_shyj","rs_qjsqspb_shr","rs_qjsqspb_shsj","rs_qjsqspb_clzt","rs_qjsqspb_ztbm","rs_qjsqspb_yspxh","rs_qjsqspb_yclzt","rs_qjsqspb_yztbm","rs_qjsqspb_yshjl","rs_qjsqspb_yshyj","rs_qjsqspb_yshr","rs_qjsqspb_yshsj"};
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
  <B><font size="3">�������--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">����������</td>
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