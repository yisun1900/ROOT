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
	String rs_thrysqspb_spxh=null;
	String rs_thrysqspb_sqxh=null;
	String rs_thrysq_fgsbh=null;
	String rs_thrysq_ygbh=null;
	String rs_thrysq_yhmc=null;
	String rs_thrysq_xb=null;
	String rs_thrysq_lrsj=null;
	String rs_thrysqspb_shjl=null;
	String rs_thrysqspb_shr=null;
	String rs_thrysqspb_shsj=null;
	String rs_thrysqspb_clzt=null;
	String rs_thrysqspb_ztbm=null;
	String rs_thrysqspb_yclzt=null;
	String rs_thrysqspb_yztbm=null;
	rs_thrysqspb_spxh=request.getParameter("rs_thrysqspb_spxh");
	if (rs_thrysqspb_spxh!=null)
	{
		rs_thrysqspb_spxh=rs_thrysqspb_spxh.trim();
		if (!(rs_thrysqspb_spxh.equals("")))	wheresql+=" and (rs_thrysqspb.spxh="+rs_thrysqspb_spxh+") ";
	}
	rs_thrysqspb_sqxh=request.getParameter("rs_thrysqspb_sqxh");
	if (rs_thrysqspb_sqxh!=null)
	{
		rs_thrysqspb_sqxh=cf.GB2Uni(rs_thrysqspb_sqxh);
		if (!(rs_thrysqspb_sqxh.equals("")))	wheresql+=" and  (rs_thrysqspb.sqxh='"+rs_thrysqspb_sqxh+"')";
	}
	rs_thrysq_fgsbh=request.getParameter("rs_thrysq_fgsbh");
	if (rs_thrysq_fgsbh!=null)
	{
		rs_thrysq_fgsbh=cf.GB2Uni(rs_thrysq_fgsbh);
		if (!(rs_thrysq_fgsbh.equals("")))	wheresql+=" and  (rs_thrysq.fgsbh='"+rs_thrysq_fgsbh+"')";
	}
	rs_thrysq_ygbh=request.getParameter("rs_thrysq_ygbh");
	if (rs_thrysq_ygbh!=null)
	{
		rs_thrysq_ygbh=rs_thrysq_ygbh.trim();
		if (!(rs_thrysq_ygbh.equals("")))	wheresql+=" and (rs_thrysq.ygbh="+rs_thrysq_ygbh+") ";
	}
	rs_thrysq_yhmc=request.getParameter("rs_thrysq_yhmc");
	if (rs_thrysq_yhmc!=null)
	{
		rs_thrysq_yhmc=cf.GB2Uni(rs_thrysq_yhmc);
		if (!(rs_thrysq_yhmc.equals("")))	wheresql+=" and  (rs_thrysq.yhmc='"+rs_thrysq_yhmc+"')";
	}
	rs_thrysq_xb=request.getParameter("rs_thrysq_xb");
	if (rs_thrysq_xb!=null)
	{
		rs_thrysq_xb=cf.GB2Uni(rs_thrysq_xb);
		if (!(rs_thrysq_xb.equals("")))	wheresql+=" and  (rs_thrysq.xb='"+rs_thrysq_xb+"')";
	}
	rs_thrysq_lrsj=request.getParameter("rs_thrysq_lrsj");
	if (rs_thrysq_lrsj!=null)
	{
		rs_thrysq_lrsj=rs_thrysq_lrsj.trim();
		if (!(rs_thrysq_lrsj.equals("")))	wheresql+="  and (rs_thrysq.lrsj>=TO_DATE('"+rs_thrysq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_thrysq_lrsj=request.getParameter("rs_thrysq_lrsj2");
	if (rs_thrysq_lrsj!=null)
	{
		rs_thrysq_lrsj=rs_thrysq_lrsj.trim();
		if (!(rs_thrysq_lrsj.equals("")))	wheresql+="  and (rs_thrysq.lrsj<=TO_DATE('"+rs_thrysq_lrsj+"','YYYY/MM/DD'))";
	}
	rs_thrysqspb_shjl=request.getParameter("rs_thrysqspb_shjl");
	if (rs_thrysqspb_shjl!=null)
	{
		rs_thrysqspb_shjl=cf.GB2Uni(rs_thrysqspb_shjl);
		if (!(rs_thrysqspb_shjl.equals("")))	wheresql+=" and  (rs_thrysqspb.shjl='"+rs_thrysqspb_shjl+"')";
	}
	rs_thrysqspb_shr=request.getParameter("rs_thrysqspb_shr");
	if (rs_thrysqspb_shr!=null)
	{
		rs_thrysqspb_shr=cf.GB2Uni(rs_thrysqspb_shr);
		if (!(rs_thrysqspb_shr.equals("")))	wheresql+=" and  (rs_thrysqspb.shr='"+rs_thrysqspb_shr+"')";
	}
	rs_thrysqspb_shsj=request.getParameter("rs_thrysqspb_shsj");
	if (rs_thrysqspb_shsj!=null)
	{
		rs_thrysqspb_shsj=rs_thrysqspb_shsj.trim();
		if (!(rs_thrysqspb_shsj.equals("")))	wheresql+="  and (rs_thrysqspb.shsj>=TO_DATE('"+rs_thrysqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_thrysqspb_shsj=request.getParameter("rs_thrysqspb_shsj2");
	if (rs_thrysqspb_shsj!=null)
	{
		rs_thrysqspb_shsj=rs_thrysqspb_shsj.trim();
		if (!(rs_thrysqspb_shsj.equals("")))	wheresql+="  and (rs_thrysqspb.shsj<=TO_DATE('"+rs_thrysqspb_shsj+"','YYYY/MM/DD'))";
	}
	rs_thrysqspb_clzt=request.getParameter("rs_thrysqspb_clzt");
	if (rs_thrysqspb_clzt!=null)
	{
		rs_thrysqspb_clzt=cf.GB2Uni(rs_thrysqspb_clzt);
		if (!(rs_thrysqspb_clzt.equals("")))	wheresql+=" and  (rs_thrysqspb.clzt='"+rs_thrysqspb_clzt+"')";
	}
	rs_thrysqspb_ztbm=request.getParameter("rs_thrysqspb_ztbm");
	if (rs_thrysqspb_ztbm!=null)
	{
		rs_thrysqspb_ztbm=cf.GB2Uni(rs_thrysqspb_ztbm);
		if (!(rs_thrysqspb_ztbm.equals("")))	wheresql+=" and  (rs_thrysqspb.ztbm='"+rs_thrysqspb_ztbm+"')";
	}
	rs_thrysqspb_yclzt=request.getParameter("rs_thrysqspb_yclzt");
	if (rs_thrysqspb_yclzt!=null)
	{
		rs_thrysqspb_yclzt=cf.GB2Uni(rs_thrysqspb_yclzt);
		if (!(rs_thrysqspb_yclzt.equals("")))	wheresql+=" and  (rs_thrysqspb.yclzt='"+rs_thrysqspb_yclzt+"')";
	}
	rs_thrysqspb_yztbm=request.getParameter("rs_thrysqspb_yztbm");
	if (rs_thrysqspb_yztbm!=null)
	{
		rs_thrysqspb_yztbm=cf.GB2Uni(rs_thrysqspb_yztbm);
		if (!(rs_thrysqspb_yztbm.equals("")))	wheresql+=" and  (rs_thrysqspb.yztbm='"+rs_thrysqspb_yztbm+"')";
	}
	ls_sql="SELECT rs_thrysqspb.spxh,rs_thrysqspb.sqxh,a.dwmc fgsbh,rs_thrysq.ygbh,rs_thrysq.yhmc,rs_thrysq.xzzwbm,rs_thrysq.lrsj,e.shjlmc shjl,rs_thrysqspb.shyj,rs_thrysqspb.shr,rs_thrysqspb.shsj, DECODE(rs_thrysqspb.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),g.ztmc ztbm,rs_thrysqspb.yspxh, DECODE(rs_thrysqspb.yclzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��'),h.ztmc yztbm,f.shjlmc yshjl,rs_thrysqspb.yshyj,rs_thrysqspb.yshr,rs_thrysqspb.yshsj  ";
	ls_sql+=" FROM rs_thrysqspb,rs_thrysq,sq_dwxx a,sq_dwxx c,rs_shjlbm e,rs_shjlbm f ,rs_ztbm g,rs_ztbm h ";
    ls_sql+=" where rs_thrysqspb.sqxh=rs_thrysq.sqxh";
    ls_sql+=" and rs_thrysq.fgsbh=a.dwbh(+) and rs_thrysq.fgsbh=c.dwbh(+) ";
    ls_sql+=" and rs_thrysqspb.shjl=e.shjl(+) and rs_thrysqspb.yshjl=f.shjl(+) ";
    ls_sql+=" and rs_thrysqspb.ztbm=g.ztbm(+) and rs_thrysqspb.yztbm=h.ztbm(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_thrysqspb.spxh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_thrysqspbCxList.jsp","SelectCxRs_thrysqspb.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"spxh","rs_thrysqspb_sqxh","rs_thrysq_fgsbh","rs_thrysq_ygbh","rs_thrysq_yhmc","rs_thrysq_xb","rs_thrysq_xdwbh","rs_thrysq_xxzzwbm","rs_thrysq_lrsj","rs_thrysqspb_shjl","rs_thrysqspb_shyj","rs_thrysqspb_shr","rs_thrysqspb_shsj","rs_thrysqspb_clzt","rs_thrysqspb_ztbm","rs_thrysqspb_yspxh","rs_thrysqspb_yclzt","rs_thrysqspb_yztbm","rs_thrysqspb_yshjl","rs_thrysqspb_yshyj","rs_thrysqspb_yshr","rs_thrysqspb_yshsj"};
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
	coluParm.link="ViewRs_thrysq.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">�˻���Ա����--������ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�������</td>
	<td  width="4%">��ְ�˻���Ա�������</td>
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