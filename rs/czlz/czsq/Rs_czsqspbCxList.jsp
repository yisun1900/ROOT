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
	String rs_czsqspb_spxh=null;
	String rs_czsqspb_sqxh=null;
	String rs_czsq_fgsbh=null;
	String rs_czsq_ygbh=null;
	String rs_czsq_yhmc=null;
	String rs_czsq_xb=null;
	String rs_czsq_lrsj=null;
	String rs_czsqspb_shjl=null;
	String rs_czsqspb_shr=null;
	String rs_czsqspb_shsj=null;
	String rs_czsqspb_clzt=null;
	String rs_czsqspb_ztbm=null;
	String rs_czsqspb_yclzt=null;
	String rs_czsqspb_yztbm=null;
	rs_czsqspb_spxh=request.getParameter("rs_czsqspb_spxh");
	if (rs_czsqspb_spxh!=null)
	{
		rs_czsqspb_spxh=rs_czsqspb_spxh.trim();
		if (!(rs_czsqspb_spxh.equals("")))	wheresql+=" and (rs_czsqspb.spxh="+rs_czsqspb_spxh+") ";
	}
	rs_czsqspb_sqxh=request.getParameter("rs_czsqspb_sqxh");
	if (rs_czsqspb_sqxh!=null)
	{
		rs_czsqspb_sqxh=cf.GB2Uni(rs_czsqspb_sqxh);
		if (!(rs_czsqspb_sqxh.equals("")))	wheresql+=" and  (rs_czsqspb.sqxh='"+rs_czsqspb_sqxh+"')";
	}
	rs_czsq_fgsbh=request.getParameter("rs_czsq_fgsbh");
	if (rs_czsq_fgsbh!=null)
	{
		rs_czsq_fgsbh=cf.GB2Uni(rs_czsq_fgsbh);
		if (!(rs_czsq_fgsbh.equals("")))	wheresql+=" and  (rs_czsq.fgsbh='"+rs_czsq_fgsbh+"')";
	}
	rs_czsq_ygbh=request.getParameter("rs_czsq_ygbh");
	if (rs_czsq_ygbh!=null)
	{
		rs_czsq_ygbh=rs_czsq_ygbh.trim();
		if (!(rs_czsq_ygbh.equals("")))	wheresql+=" and (rs_czsq.ygbh="+rs_czsq_ygbh+") ";
	}
	rs_czsq_yhmc=request.getParameter("rs_czsq_yhmc");
	if (rs_czsq_yhmc!=null)
	{
		rs_czsq_yhmc=cf.GB2Uni(rs_czsq_yhmc);
		if (!(rs_czsq_yhmc.equals("")))	wheresql+=" and  (rs_czsq.yhmc='"+rs_czsq_yhmc+"')";
	}
	rs_czsq_xb=request.getParameter("rs_czsq_xb");
	if (rs_czsq_xb!=null)
	{
		rs_czsq_xb=cf.GB2Uni(rs_czsq_xb);
		if (!(rs_czsq_xb.equals("")))	wheresql+=" and  (rs_czsq.xb='"+rs_czsq_xb+"')";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj>=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsq_lrsj=request.getParameter("rs_czsq_lrsj2");
	if (rs_czsq_lrsj!=null)
	{
		rs_czsq_lrsj=rs_czsq_lrsj.trim();
		if (!(rs_czsq_lrsj.equals("")))	wheresql+="  and (rs_czsq.lrsj<=TO_DATE('"+rs_czsq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_shjl=request.getParameter("rs_czsqspb_shjl");
	if (rs_czsqspb_shjl!=null)
	{
		rs_czsqspb_shjl=cf.GB2Uni(rs_czsqspb_shjl);
		if (!(rs_czsqspb_shjl.equals("")))	wheresql+=" and  (rs_czsqspb.shjl='"+rs_czsqspb_shjl+"')";
	}
	rs_czsqspb_shr=request.getParameter("rs_czsqspb_shr");
	if (rs_czsqspb_shr!=null)
	{
		rs_czsqspb_shr=cf.GB2Uni(rs_czsqspb_shr);
		if (!(rs_czsqspb_shr.equals("")))	wheresql+=" and  (rs_czsqspb.shr='"+rs_czsqspb_shr+"')";
	}
	rs_czsqspb_shsj=request.getParameter("rs_czsqspb_shsj");
	if (rs_czsqspb_shsj!=null)
	{
		rs_czsqspb_shsj=rs_czsqspb_shsj.trim();
		if (!(rs_czsqspb_shsj.equals("")))	wheresql+="  and (rs_czsqspb.shsj>=TO_DATE('"+rs_czsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_shsj=request.getParameter("rs_czsqspb_shsj2");
	if (rs_czsqspb_shsj!=null)
	{
		rs_czsqspb_shsj=rs_czsqspb_shsj.trim();
		if (!(rs_czsqspb_shsj.equals("")))	wheresql+="  and (rs_czsqspb.shsj<=TO_DATE('"+rs_czsqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_czsqspb_clzt=request.getParameter("rs_czsqspb_clzt");
	if (rs_czsqspb_clzt!=null)
	{
		rs_czsqspb_clzt=cf.GB2Uni(rs_czsqspb_clzt);
		if (!(rs_czsqspb_clzt.equals("")))	wheresql+=" and  (rs_czsqspb.clzt='"+rs_czsqspb_clzt+"')";
	}
	rs_czsqspb_ztbm=request.getParameter("rs_czsqspb_ztbm");
	if (rs_czsqspb_ztbm!=null)
	{
		rs_czsqspb_ztbm=cf.GB2Uni(rs_czsqspb_ztbm);
		if (!(rs_czsqspb_ztbm.equals("")))	wheresql+=" and  (rs_czsqspb.ztbm='"+rs_czsqspb_ztbm+"')";
	}
	rs_czsqspb_yclzt=request.getParameter("rs_czsqspb_yclzt");
	if (rs_czsqspb_yclzt!=null)
	{
		rs_czsqspb_yclzt=cf.GB2Uni(rs_czsqspb_yclzt);
		if (!(rs_czsqspb_yclzt.equals("")))	wheresql+=" and  (rs_czsqspb.yclzt='"+rs_czsqspb_yclzt+"')";
	}
	rs_czsqspb_yztbm=request.getParameter("rs_czsqspb_yztbm");
	if (rs_czsqspb_yztbm!=null)
	{
		rs_czsqspb_yztbm=cf.GB2Uni(rs_czsqspb_yztbm);
		if (!(rs_czsqspb_yztbm.equals("")))	wheresql+=" and  (rs_czsqspb.yztbm='"+rs_czsqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_czsqspb.spxh,rs_czsqspb.sqxh,a.dwmc fgsbh,rs_czsq.ygbh,rs_czsq.yhmc,rs_czsq.xzzwbm,rs_czsq.lrsj,e.shjlmc shjl,rs_czsqspb.shyj,rs_czsqspb.shr,rs_czsqspb.shsj, DECODE(rs_czsqspb.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),g.ztmc ztbm,rs_czsqspb.yspxh, DECODE(rs_czsqspb.yclzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ'),h.ztmc yztbm,f.shjlmc yshjl,rs_czsqspb.yshyj,rs_czsqspb.yshr,rs_czsqspb.yshsj  ";
	ls_sql+=" FROM rs_czsqspb,rs_czsq,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_czsqspb.sqxh=rs_czsq.sqxh";
    ls_sql+=" and rs_czsq.fgsbh=a.dwbh(+) and rs_czsq.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_czsqspb.shjl=e.shjl(+) and rs_czsqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_czsqspb.ztbm=g.ztbm(+) and rs_czsqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_czsqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_czsqspbCxList.jsp","SelectCxRs_czsqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_czsqspb_sqxh","rs_czsq_fgsbh","rs_czsq_ygbh","rs_czsq_yhmc","rs_czsq_xb","rs_czsq_xdwbh","rs_czsq_xxzzwbm","rs_czsq_lrsj","rs_czsqspb_shjl","rs_czsqspb_shyj","rs_czsqspb_shr","rs_czsqspb_shsj","rs_czsqspb_clzt","rs_czsqspb_ztbm","rs_czsqspb_yspxh","rs_czsqspb_yclzt","rs_czsqspb_yztbm","rs_czsqspb_yshjl","rs_czsqspb_yshyj","rs_czsqspb_yshr","rs_czsqspb_yshsj"};
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
  <B><font size="3">��ְ����--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">��ְ��ְ�������</td>
	<td  width="5%">�걨��˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="4%">����ְ��</td>
	<td  width="3%">����¼��ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="16%">������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˺���״̬</td>
	<td  width="6%">��˺�����״̬</td>
	<td  width="3%">�ϴ��������</td>
	<td  width="3%">�ϴδ���״̬</td>
	<td  width="6%">�ϴ�����״̬</td>
	<td  width="3%">�ϴ���˽���</td>
	<td  width="15%">�ϴ�������</td>
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